import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'muscle.g.dart';

@JsonSerializable()
class Muscle extends Equatable {
  const Muscle({
    required this.name,
    required this.isFront,
    required this.imageUrlMain,
    required this.imageUrlSecondary,
  });

  factory Muscle.fromJson(Map<String, dynamic> json) => _$MuscleFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleToJson(this);

  final String name;
  @JsonKey(name: 'is_front')
  final bool isFront;
  @JsonKey(name: 'image_url_main')
  final String imageUrlMain;
  @JsonKey(name: 'image_url_secondary')
  final String imageUrlSecondary;

  @override
  List<Object?> get props => [
        name,
        isFront,
        imageUrlMain,
        imageUrlSecondary,
      ];
}
