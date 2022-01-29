// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          user: $checkedConvert('user', (v) => v as int),
          gym: $checkedConvert('gym', (v) => v as String?),
          isTemporary: $checkedConvert('is_temporary', (v) => v as bool),
          showComments: $checkedConvert('show_comments', (v) => v as bool),
          showEnglishIngredients:
              $checkedConvert('show_english_ingredients', (v) => v as bool),
          workoutReminderActive:
              $checkedConvert('workout_reminder_active', (v) => v as bool),
          workoutReminder: $checkedConvert('workout_reminder', (v) => v as int),
          workoutDuration: $checkedConvert('workout_duration', (v) => v as int),
          lastWorkoutNotification:
              $checkedConvert('last_workout_notification', (v) => v as String?),
          notificationLanguage:
              $checkedConvert('notification_language', (v) => v as int),
          age: $checkedConvert('timer_active', (v) => v as int?),
          birthdate: $checkedConvert('birthdate', (v) => v as String?),
          height: $checkedConvert('height', (v) => v as int?),
          gender: $checkedConvert('gender', (v) => v as String),
          sleepHours: $checkedConvert('sleep_hours', (v) => v as int),
          workHours: $checkedConvert('work_hours', (v) => v as int),
          workIntensity: $checkedConvert('work_intensity', (v) => v as String),
          sportHours: $checkedConvert('sport_hours', (v) => v as int),
          sportIntensity:
              $checkedConvert('sport_intensity', (v) => v as String),
          freetimeHours: $checkedConvert('freetime_hours', (v) => v as int),
          freetimeIntensity:
              $checkedConvert('freetime_intensity', (v) => v as String),
          calories: $checkedConvert('calories', (v) => v as int),
          weightUnit: $checkedConvert('weight_unit', (v) => v as String),
          roAccess: $checkedConvert('ro_access', (v) => v as bool),
          numDaysWeightReminder:
              $checkedConvert('num_days_weight_reminder', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'isTemporary': 'is_temporary',
        'showComments': 'show_comments',
        'showEnglishIngredients': 'show_english_ingredients',
        'workoutReminderActive': 'workout_reminder_active',
        'workoutReminder': 'workout_reminder',
        'workoutDuration': 'workout_duration',
        'lastWorkoutNotification': 'last_workout_notification',
        'notificationLanguage': 'notification_language',
        'age': 'timer_active',
        'sleepHours': 'sleep_hours',
        'workHours': 'work_hours',
        'workIntensity': 'work_intensity',
        'sportHours': 'sport_hours',
        'sportIntensity': 'sport_intensity',
        'freetimeHours': 'freetime_hours',
        'freetimeIntensity': 'freetime_intensity',
        'weightUnit': 'weight_unit',
        'roAccess': 'ro_access',
        'numDaysWeightReminder': 'num_days_weight_reminder'
      },
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user': instance.user,
      'gym': instance.gym,
      'is_temporary': instance.isTemporary,
      'show_comments': instance.showComments,
      'show_english_ingredients': instance.showEnglishIngredients,
      'workout_reminder_active': instance.workoutReminderActive,
      'workout_reminder': instance.workoutReminder,
      'workout_duration': instance.workoutDuration,
      'last_workout_notification': instance.lastWorkoutNotification,
      'notification_language': instance.notificationLanguage,
      'timer_active': instance.age,
      'birthdate': instance.birthdate,
      'height': instance.height,
      'gender': instance.gender,
      'sleep_hours': instance.sleepHours,
      'work_hours': instance.workHours,
      'work_intensity': instance.workIntensity,
      'sport_hours': instance.sportHours,
      'sport_intensity': instance.sportIntensity,
      'freetime_hours': instance.freetimeHours,
      'freetime_intensity': instance.freetimeIntensity,
      'calories': instance.calories,
      'weight_unit': instance.weightUnit,
      'ro_access': instance.roAccess,
      'num_days_weight_reminder': instance.numDaysWeightReminder,
    };
