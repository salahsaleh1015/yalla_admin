


import 'package:hive/hive.dart';

class HiveServices {


 static const kCompletedOrdersNumberBox = 'completed_orders_number_box';
 static const kDeliveryNumbersBox = 'delivery_numbers_box';
 static const kUsersNumberBox = 'users_number_box';
////////////////////////////////////////////////////////////////
  static const kCompletedOrdersNumberBoxKey = 'completed_orders_number_box_key';
  static const kDeliveryNumbersBoxKey = 'delivery_numbers_box_key';
  static const kUsersNumberBoxKey = 'users_number_box_key';


  static void cacheDeliveriesNumber({required int value}){
    var box = Hive.box<int>(kDeliveryNumbersBox);
    box.put(kDeliveryNumbersBoxKey, value);
  }

  static void cacheCompletedOrdersNumber({required int value}){
    var box = Hive.box<int>(kCompletedOrdersNumberBox);
    box.put(kCompletedOrdersNumberBoxKey, value);
  }

  static void cacheUsersNumber({required int value}){
    var box = Hive.box<int>(kUsersNumberBox);
    box.put(kUsersNumberBoxKey, value);
  }




}