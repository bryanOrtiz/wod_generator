import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'wod.g.dart';

@JsonSerializable()
class Wod extends Equatable {
  const Wod({
    required this.id,
    required this.name,
    required this.description,
    required this.creationDate,
    required this.parts,
  });

  factory Wod.fromJson(Map<String, dynamic> json) => _$WodFromJson(json);

  final int id;
  final String name;
  final String description;
  final String creationDate;
  final List<WorkoutPart> parts;

  Wod copyWith({
    int? id,
    String? name,
    String? description,
    String? creationDate,
    List<WorkoutPart>? parts,
  }) {
    return Wod(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        creationDate: creationDate ?? this.creationDate,
        parts: parts ?? this.parts);
  }

  @override
  List<Object> get props => [
        id,
        name,
        description,
        creationDate,
        parts,
      ];
}
