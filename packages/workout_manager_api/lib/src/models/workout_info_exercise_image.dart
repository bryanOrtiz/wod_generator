import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'workout_info_exercise_image.g.dart';

@JsonSerializable()
class WorkoutInfoExerciseImage extends Equatable {
  const WorkoutInfoExerciseImage({
    required this.image,
    required this.isMain,
  });

  factory WorkoutInfoExerciseImage.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoExerciseImageFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoExerciseImageToJson(this);

  final String image;
  @JsonKey(name: 'is_main')
  final bool isMain;

  @override
  List<Object?> get props => [
        image,
        isMain,
      ];
}
