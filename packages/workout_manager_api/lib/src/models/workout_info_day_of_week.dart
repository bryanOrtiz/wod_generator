import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info_day_of_week.g.dart';

@JsonSerializable()
class WorkoutInfoDayOfWeek extends Equatable {
  const WorkoutInfoDayOfWeek({
    required this.day,
    required this.days,
  });

  factory WorkoutInfoDayOfWeek.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoDayOfWeekFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoDayOfWeekToJson(this);

  @JsonKey(name: 'text')
  final String day;
  @JsonKey(name: 'day_list')
  final List<DaysOfTheWeek> days;

  @override
  List<Object?> get props => [
        day,
        days,
      ];
}
