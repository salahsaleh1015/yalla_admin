import 'package:hive_flutter/hive_flutter.dart';

part 'recommendation_entity.g.dart';

@HiveType(typeId: 4)
class RecommendationEntity {
  @HiveField(0)
  final String recommendationId;
  @HiveField(1)
  final String recommendationTitle;
  @HiveField(2)
  final String recommendationDetails;

  RecommendationEntity({
    required this.recommendationId,
    required this.recommendationTitle,
    required this.recommendationDetails,
  });
}
