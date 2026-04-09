


import '../../domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    String? id,
    String? title,
    String? details,
  }) : super(
    recommendationId: id ?? '',
    recommendationTitle: title ?? '',
    recommendationDetails: details ?? '',
  );

  /// fromJson
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['recommendationId'],
      title: json['recommendationTitle'],
      details: json['recommendationDetails'],
    );
  }

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'recommendationId': recommendationId,
      'recommendationTitle': recommendationTitle,
      'recommendationDetails': recommendationDetails,
    };
  }

}