import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_exercise.g.dart';

@JsonSerializable()
class SearchExercise extends Equatable {
  const SearchExercise({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.imageThumbnail,
  });

  factory SearchExercise.fromJson(Map<String, dynamic> json) =>
      _$SearchExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchExerciseToJson(this);

  final int id;
  final String name;
  final String category;
  final String? image;
  final String? imageThumbnail;

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        image,
        imageThumbnail,
      ];
}
