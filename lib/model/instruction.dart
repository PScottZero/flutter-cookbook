import 'package:json_annotation/json_annotation.dart';

part 'instruction.g.dart';

@JsonSerializable()
class Instruction {
  String value;

  Instruction([this.value = '']);

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}
