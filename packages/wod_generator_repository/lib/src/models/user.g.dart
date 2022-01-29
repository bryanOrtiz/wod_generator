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
          workoutReminderActive:
              $checkedConvert('show_english_ingredients', (v) => v as bool),
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
          weightUnit: $checkedConvert('weight_unit', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'isTemporary': 'is_temporary',
        'showComments': 'show_comments',
        'workoutReminderActive': 'show_english_ingredients',
        'workoutReminder': 'workout_reminder',
        'workoutDuration': 'workout_duration',
        'lastWorkoutNotification': 'last_workout_notification',
        'notificationLanguage': 'notification_language',
        'age': 'timer_active',
        'weightUnit': 'weight_unit'
      },
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user': instance.user,
      'gym': instance.gym,
      'is_temporary': instance.isTemporary,
      'show_comments': instance.showComments,
      'show_english_ingredients': instance.workoutReminderActive,
      'workout_reminder': instance.workoutReminder,
      'workout_duration': instance.workoutDuration,
      'last_workout_notification': instance.lastWorkoutNotification,
      'notification_language': instance.notificationLanguage,
      'timer_active': instance.age,
      'birthdate': instance.birthdate,
      'height': instance.height,
      'gender': instance.gender,
      'weight_unit': instance.weightUnit,
    };
