import 'package:flutter/animation.dart';

class StatusBadgeModel {
  final Color badgeBackgroundColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;

  const StatusBadgeModel({
    required this.badgeBackgroundColor,
    required this.deliveryStatus,
    required this.deliveryStatusColor,
  });
}
