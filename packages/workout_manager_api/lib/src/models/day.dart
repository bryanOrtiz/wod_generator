import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable()
class Day extends Equatable {
  const Day({
    this.id,
    required this.training,
    required this.description,
    required this.day,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @JsonKey(includeIfNull: false)
  final int? id;
  final int training;
  final String description;
  final List<int> day;

  @override
  List<Object?> get props => [
        id,
        training,
        description,
        day,
      ];
}
