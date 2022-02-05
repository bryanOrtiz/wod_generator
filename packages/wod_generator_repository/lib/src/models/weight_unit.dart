import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight_unit.g.dart';

@JsonSerializable()
class WeightUnit extends Equatable {
  const WeightUnit({
    required this.id,
    required this.name,
  });

  factory WeightUnit.fromJson(Map<String, dynamic> json) =>
      _$WeightUnitFromJson(json);

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
