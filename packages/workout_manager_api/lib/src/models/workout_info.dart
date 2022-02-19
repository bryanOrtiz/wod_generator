import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info.g.dart';

@JsonSerializable()
class WorkoutInfo extends Equatable {
  const WorkoutInfo({
    required this.workout,
    required this.days,
    required this.muscles,
  });

  factory WorkoutInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoToJson(this);

  @JsonKey(name: 'obj')
  final Workout workout;
  @JsonKey(name: 'day_list')
  final List<WorkoutInfoDay> days;
  final WorkoutInfoMuscle muscles;

  @override
  List<Object?> get props => [
        workout,
        days,
        muscles,
      ];
}
