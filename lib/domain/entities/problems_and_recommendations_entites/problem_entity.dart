


import 'package:hive_flutter/adapters.dart';
part 'problem_entity.g.dart';
@HiveType(typeId: 5)
class ProblemEntity {

  @HiveField(0)
  final String problemId;
  @HiveField(1)
  final String  problemTitle;
  @HiveField(2)
  final String problemDetails;


  ProblemEntity({
    required this.problemId,
    required this.problemTitle,
    required this.problemDetails,

  });
}