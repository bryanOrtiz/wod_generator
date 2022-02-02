import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting extends Equatable {
  const Setting({
    required this.id,
    required this.set,
    required this.exercise,
    required this.repitionUnit,
    required this.reps,
    required this.weight,
    required this.weightUnit,
    required this.rir,
    required this.order,
    required this.comment,
  });

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  Map<String, dynamic> toJson() => _$SettingToJson(this);

  final int id;
  final int set;
  final int exercise;
  @JsonKey(name: 'repetition_unit')
  final int repitionUnit;
  final int reps;
  final String weight;
  @JsonKey(name: 'weight_unit')
  final int weightUnit;
  final String? rir;
  final int order;
  final String comment;

  @override
  List<Object?> get props => [
        id,
        set,
        exercise,
        repitionUnit,
        reps,
        weight,
        weightUnit,
        rir,
        order,
        comment,
      ];
}
