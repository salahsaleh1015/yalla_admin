import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchBusyDeliveriesStates {}

final class FetchBusyDeliveriesInitialState extends FetchBusyDeliveriesStates {}
////////////////////////////////////////////////////////////////////////////////
final class FetchBusyDeliveriesLoadingState
    extends FetchBusyDeliveriesStates {}

final class FetchBusyDeliveriesSuccessState
    extends FetchBusyDeliveriesStates {
  final List<DeliveryEntity> busyDeliveries;

  FetchBusyDeliveriesSuccessState({required this.busyDeliveries});
}

final class FetchBusyDeliveriesErrorState
    extends FetchBusyDeliveriesStates {
  final String errorMsg;

  FetchBusyDeliveriesErrorState({required this.errorMsg});
}

