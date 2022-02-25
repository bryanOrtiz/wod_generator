import 'dart:async';
import 'dart:math';

import 'package:workout_manager_api/workout_manager_api.dart'
    hide User, SearchExercise, SettingWeightUnit;

import 'models/models.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class WodGeneratorRepository {
  WodGeneratorRepository({WorkoutManagerApiClient? workoutManagerApiClient})
      : _workoutManagerApiClient =
            workoutManagerApiClient ?? WorkoutManagerApiClient();
  final _controller = StreamController<AuthenticationStatus>();
  final _wodController = StreamController<List<Wod>>();

  final kToken = 'kToken';
  late String _token;

  final WorkoutManagerApiClient _workoutManagerApiClient;

  Future<User?> getUser() async {
    final userPage = await _workoutManagerApiClient.getUser(token: _token);
    final user = userPage.results.first;
    return User(
        user: user.user,
        gym: user.gym,
        isTemporary: user.isTemporary,
        showComments: user.showComments,
        workoutReminderActive: user.workoutReminderActive,
        workoutReminder: user.workoutReminder,
        workoutDuration: user.workoutDuration,
        lastWorkoutNotification: user.lastWorkoutNotification,
        notificationLanguage: user.notificationLanguage,
        age: user.age,
        birthdate: user.birthdate,
        height: user.height,
        gender: user.gender,
        weightUnit: user.weightUnit);
  }

  Future<void> getCachedToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(kToken);
    if (token != null) {
      _token = token;
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final token = await _workoutManagerApiClient.login(email, password);
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kToken, _token);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    _token = '';
    prefs.remove(kToken);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
    _wodController.close();
  }

  Future<List<SearchExercise>> searchExerciseByTerm({
    required String term,
  }) async {
    final exercise = await _workoutManagerApiClient.searchExerciseByTerm(
      token: _token,
      term: term,
    );
    return exercise.suggestions
            ?.map(
              (suggestionItem) => SearchExercise(
                  id: suggestionItem.data.id,
                  name: suggestionItem.data.name,
                  category: suggestionItem.data.category,
                  image: suggestionItem.data.image,
                  imageThumbnail: suggestionItem.data.imageThumbnail),
            )
            .toList() ??
        [];
  }

  Future<List<WeightUnit>> getWeightUnits() async {
    final weightUnits =
        await _workoutManagerApiClient.getSettingWeightUnits(token: _token);
    return weightUnits.results
        .map(
          (settingWeightUnit) => WeightUnit(
            id: settingWeightUnit.id,
            name: settingWeightUnit.name,
          ),
        )
        .toList();
  }

  Future<void> createWorkout({required Wod wod}) async {
    final createdWorkout = await _workoutManagerApiClient.createWorkout(
      token: _token,
      name: wod.name,
      description: wod.description,
    );
    final lday = Day(
        training: createdWorkout.id,
        description: createdWorkout.description,
        day: [1]);
    final createdDay =
        await _workoutManagerApiClient.createDay(token: _token, day: lday);
    await Future.forEach<MapEntry<int, WorkoutPart>>(wod.parts.asMap().entries,
        (element) async {
      final index = element.key;
      final part = element.value;
      final lset = Set(
        id: part.id ?? Random().nextInt(100),
        exerciseDay: createdDay.id!,
        sets: part.sets.length,
        order: index,
        comment: part.comment,
      );
      final set =
          await _workoutManagerApiClient.createSet(token: _token, set: lset);
      final lsetting = Setting(
        id: Random().nextInt(100),
        set: set.id,
        exercise: part.exercise!.id,
        repitionUnit: 1,
        reps: part.sets[index].reps,
        weight: '1',
        weightUnit: part.weightUnit,
        order: index,
        comment: part.comment,
      );
      await _workoutManagerApiClient.createSetting(
          token: _token, setting: lsetting);
    });
    Future.delayed(Duration(milliseconds: 500));
    await getWods();
  }

  Stream<List<Wod>> get wods async* {
    yield* _wodController.stream;
  }

  Future<List<Wod>> getWods() async {
    final workouts = await _workoutManagerApiClient.getWorkouts(token: _token);
    final retVal = workouts.results
        .map((workout) => Wod(
            id: workout.id,
            name: workout.name,
            description: workout.description,
            creationDate: workout.creationDate,
            parts: []))
        .toList();
    _wodController.add(retVal);
    return retVal;
  }

  Future<Wod> getWodDetails(String id) async {
    final details =
        await _workoutManagerApiClient.getWorkoutDetails(token: _token, id: id);
    Wod wod = Wod(
      id: details.workout.id,
      name: details.workout.name,
      description: details.workout.description,
      creationDate: details.workout.creationDate,
      parts: [],
    );
    details.days.forEach((infoSets) {
      infoSets.sets.forEach((infoSet) {
        final parts = infoSet.exercises.fold<List<WorkoutPart>>([],
            (previousValue, infoExercise) {
          final exercise = infoExercise.exercise;
          final comment = infoSet.set.comment;
          final id = infoSet.set.id;
          final workoutSets = infoExercise.settings
              .map((e) => WorkoutSet(reps: e.reps))
              .toList();
          final weightUnit = infoExercise.settings.first.weightUnit;
          final part = WorkoutPart(
              id: id,
              exercise: SearchExercise(
                id: exercise.id,
                name: exercise.name,
                category: exercise.category.toString(),
                image: null,
                imageThumbnail: null,
              ), // TODO: choose correct exercise type
              weightUnit: weightUnit,
              sets: workoutSets,
              comment: comment);
          previousValue.add(part);
          return previousValue;
        });
        wod = wod.copyWith(parts: parts);
      });
    });
    return wod;
  }

  Future<void> deleteWod(Wod wod) async {
    await _workoutManagerApiClient.deleteWorkout(
        token: _token, id: wod.id.toString());
    Future.delayed(Duration(milliseconds: 500));
    await getWods();
  }

  Future<void> updateWorkout({required Wod wod}) async {
    final lWorkout = Workout(
        id: wod.id,
        name: wod.name,
        description: wod.description,
        creationDate: wod.creationDate);
    final updatedWorkout = await _workoutManagerApiClient.updateWorkout(
      token: _token,
      workout: lWorkout,
    );
    final pageDay = await _workoutManagerApiClient.getDayTrainingId(
      token: _token,
      id: updatedWorkout.id.toString(),
    );
    final day = pageDay.results.first;
    await Future.forEach<MapEntry<int, WorkoutPart>>(wod.parts.asMap().entries,
        (element) async {
      final index = element.key;
      final part = element.value;
      final lset = Set(
        id: part.id!,
        exerciseDay: day.id!,
        sets: part.sets.length,
        order: index,
        comment: part.comment,
      );
      final set = await _workoutManagerApiClient.updateSet(
        token: _token,
        set: lset,
      );
      final pageSettings = await _workoutManagerApiClient.getSettingsBySetId(
        token: _token,
        setId: set.id.toString(),
      );
      await Future.forEach<Setting>(pageSettings.results, (setting) async {
        if (setting.order != index) return;
        final lsetting = Setting(
          id: setting.id,
          set: setting.set,
          exercise: part.exercise!.id,
          repitionUnit: 1,
          reps: part.sets[index].reps,
          weight: '1',
          weightUnit: part.weightUnit,
          order: index,
          comment: part.comment,
        );
        await _workoutManagerApiClient.updateSetting(
          token: _token,
          setting: lsetting,
        );
      });
    });

    Future.delayed(Duration(milliseconds: 500));
    await getWods();
  }
}
