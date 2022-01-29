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
    required this.workoutReminderActive,
    required this.workoutReminder,
    required this.workoutDuration,
    required this.lastWorkoutNotification,
    required this.notificationLanguage,
    required this.age,
    required this.birthdate,
    required this.height,
    required this.gender,
    required this.weightUnit,
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
  @JsonKey(name: 'weight_unit')
  final String weightUnit;

  @override
  List<Object?> get props => [
        user,
        gym,
        isTemporary,
        showComments,
        workoutReminderActive,
        workoutReminder,
        workoutDuration,
        lastWorkoutNotification,
        notificationLanguage,
        age,
        birthdate,
        height,
        gender,
        weightUnit,
      ];
}
