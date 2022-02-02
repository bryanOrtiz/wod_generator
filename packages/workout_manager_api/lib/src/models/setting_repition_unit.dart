import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_repition_unit.g.dart';

@JsonSerializable()
class SettingRepitionUnit extends Equatable {
  const SettingRepitionUnit({
    required this.id,
    required this.name,
  });

  factory SettingRepitionUnit.fromJson(Map<String, dynamic> json) =>
      _$SettingRepitionUnitFromJson(json);

  Map<String, dynamic> toJson() => _$SettingRepitionUnitToJson(this);

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
