import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';

class ProblemModel extends ProblemEntity {
  ProblemModel({
    String? id,
    String? title,
    String? details,
  }) : super(
    problemId: id ?? '',
    problemTitle: title ?? '',
    problemDetails: details ?? '',
  );
  /// fromJson
  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      id: json['problemId'],
      title: json['problemTitle'],
      details: json['problemDetails'],
    );
  }

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'problemId': problemId,
      'problemTitle': problemTitle,
      'problemDetails': problemDetails,
    };
  }
}