import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info_exercise.g.dart';

@JsonSerializable()
class WorkoutInfoExercise extends Equatable {
  const WorkoutInfoExercise({
    required this.exercise,
    required this.text,
    required this.hasWeight,
    required this.comments,
    required this.images,
    required this.settings,
  });

  factory WorkoutInfoExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoExerciseToJson(this);

  @JsonKey(name: 'obj')
  final Exercise exercise;
  @JsonKey(name: 'setting_text')
  final String text;
  @JsonKey(name: 'has_weight')
  final bool hasWeight;
  @JsonKey(name: 'comment_list')
  final List<String> comments;
  @JsonKey(name: 'image_list')
  final List<WorkoutInfoExerciseImage> images;
  @JsonKey(name: 'setting_obj_list')
  final List<Setting> settings;

  @override
  List<Object?> get props => [
        exercise,
        text,
        hasWeight,
        comments,
        images,
        settings,
      ];
}
