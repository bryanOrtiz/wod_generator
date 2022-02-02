import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_weight_unit.g.dart';

@JsonSerializable()
class SettingWeightUnit extends Equatable {
  const SettingWeightUnit({
    required this.id,
    required this.name,
  });

  factory SettingWeightUnit.fromJson(Map<String, dynamic> json) =>
      _$SettingWeightUnitFromJson(json);

  Map<String, dynamic> toJson() => _$SettingWeightUnitToJson(this);

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
