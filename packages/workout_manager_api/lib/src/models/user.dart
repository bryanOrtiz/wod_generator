import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.user,
    required this.gym,
    required this.isTemporary,
    required this.showComments,
    required this.showEnglishIngredients,
    required this.workoutReminderActive,
    required this.workoutReminder,
    required this.workoutDuration,
    required this.lastWorkoutNotification,
    required this.notificationLanguage,
    required this.age,
    required this.birthdate,
    required this.height,
    required this.gender,
    required this.sleepHours,
    required this.workHours,
    required this.workIntensity,
    required this.sportHours,
    required this.sportIntensity,
    required this.freetimeHours,
    required this.freetimeIntensity,
    required this.calories,
    required this.weightUnit,
    required this.roAccess,
    required this.numDaysWeightReminder,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final int user;
  final String? gym;
  @JsonKey(name: 'is_temporary')
  final bool isTemporary;
  @JsonKey(name: 'show_comments')
  final bool showComments;
  @JsonKey(name: 'show_english_ingredients')
  final bool showEnglishIngredients;
  @JsonKey(name: 'workout_reminder_active')
  final bool workoutReminderActive;
  @JsonKey(name: 'workout_reminder')
  final int workoutReminder;
  @JsonKey(name: 'workout_duration')
  final int workoutDuration;
  @JsonKey(name: 'last_workout_notification')
  final String? lastWorkoutNotification;
  @JsonKey(name: 'notification_language')
  final int notificationLanguage;
  @JsonKey(name: 'timer_active')
  final int? age;
  final String? birthdate;
  final int? height;
  final String gender;
  @JsonKey(name: 'sleep_hours')
  final int sleepHours;
  @JsonKey(name: 'work_hours')
  final int workHours;
  @JsonKey(name: 'work_intensity')
  final String workIntensity;
  @JsonKey(name: 'sport_hours')
  final int sportHours;
  @JsonKey(name: 'sport_intensity')
  final String sportIntensity;
  @JsonKey(name: 'freetime_hours')
  final int freetimeHours;
  @JsonKey(name: 'freetime_intensity')
  final String freetimeIntensity;
  final int calories;
  @JsonKey(name: 'weight_unit')
  final String weightUnit;
  @JsonKey(name: 'ro_access')
  final bool roAccess;
  @JsonKey(name: 'num_days_weight_reminder')
  final int numDaysWeightReminder;

  @override
  List<Object?> get props => [
        user,
        gym,
        isTemporary,
        showComments,
        showEnglishIngredients,
        workoutReminderActive,
        workoutReminder,
        workoutDuration,
        lastWorkoutNotification,
        notificationLanguage,
        age,
        birthdate,
        height,
        gender,
        sleepHours,
        workHours,
        workIntensity,
        sportHours,
        sportIntensity,
        freetimeHours,
        freetimeIntensity,
        calories,
        weightUnit,
        roAccess,
        numDaysWeightReminder,
      ];
}
