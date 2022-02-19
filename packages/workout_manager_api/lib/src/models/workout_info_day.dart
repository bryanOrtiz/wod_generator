import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info_day.g.dart';

@JsonSerializable()
class WorkoutInfoDay extends Equatable {
  const WorkoutInfoDay({
    required this.day,
    required this.daysOfTheWeek,
    required this.sets,
    required this.muscles,
  });

  factory WorkoutInfoDay.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoDayFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoDayToJson(this);

  @JsonKey(name: 'obj')
  final Day day;
  @JsonKey(name: 'days_of_week')
  final WorkoutInfoDayOfWeek daysOfTheWeek;
  @JsonKey(name: 'set_list')
  final List<WorkoutInfoSet> sets;
  final WorkoutInfoMuscle muscles;

  @override
  List<Object?> get props => [
        day,
        daysOfTheWeek,
        sets,
        muscles,
      ];
}
