import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'days_of_the_week.g.dart';

@JsonSerializable()
class DaysOfTheWeek extends Equatable {
  const DaysOfTheWeek({
    required this.id,
    required this.day,
  });

  factory DaysOfTheWeek.fromJson(Map<String, dynamic> json) =>
      _$DaysOfTheWeekFromJson(json);

  Map<String, dynamic> toJson() => _$DaysOfTheWeekToJson(this);

  final int id;
  @JsonKey(name: 'day_of_week')
  final String day;

  @override
  List<Object?> get props => [
        id,
        day,
      ];
}
