

import 'package:flutter/material.dart';
import 'package:yalla_admin/core/resources/colors_manager.dart';
import 'package:yalla_admin/core/services/hive_services/hive_services.dart';
import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';



Color getStatusBadgeColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.lightGrayColor;
    case "المقبولة":
      return ColorManager.lightSecondary;
    case "الملغية":
      return ColorManager.lightPrimary;
    case "مكتملة":
      return ColorManager.lightGreenColor;
    default:
      return ColorManager.primary;
  }
}

Color getStatusTextColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.darkGrayColor;
    case "المقبولة":
      return ColorManager.primary;
    case "الملغية":
      return ColorManager.error;
    case "مكتملة":
      return ColorManager.greenColor;
    default:
      return ColorManager.white;
  }
}


void clearDeliveriesBoxByStatus(String deliveryStatus) {
  switch (deliveryStatus) {
    case 'متاح':
      HiveServices.clearHiveBox<DeliveryEntity>(
        boxName: HiveServices.kAvailableDeliveryBox,
      );
      break;

    case 'غير متاح':
      HiveServices.clearHiveBox<DeliveryEntity>(
        boxName: HiveServices.kUnAvailableDeliveryBox,
      );
      break;

    case 'مشغول':
      HiveServices.clearHiveBox<DeliveryEntity>(
        boxName: HiveServices.kBusyDeliveryBox,
      );
      break;
  }
}