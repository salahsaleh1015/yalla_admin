import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class BusyDeliveriesStates {}

final class BusyDeliveriesInitialState extends BusyDeliveriesStates {}
////////////////////////////////////////////////////////////////////////////////
final class FetchBusyDeliveriesLoadingState
    extends BusyDeliveriesStates {}

final class FetchBusyDeliveriesSuccessState
    extends BusyDeliveriesStates {
  final List<DeliveryEntity> availableDeliveries;

  FetchBusyDeliveriesSuccessState({required this.availableDeliveries});
}

final class FetchBusyDeliveriesErrorState
    extends BusyDeliveriesStates {
  final String errorMsg;

  FetchBusyDeliveriesErrorState({required this.errorMsg});
}

/////////////////////////////////////////////////////////////////////////////////

final class DeleteBusyDeliveryLoadingState
    extends BusyDeliveriesStates {}

final class DeleteBusyDeliverySuccessState
    extends BusyDeliveriesStates {}

final class DeleteBusyDeliveryErrorState
    extends BusyDeliveriesStates {
  final String errorMsg;

  DeleteBusyDeliveryErrorState({required this.errorMsg});
}
/////////////////////////////////////////////////////////////////////////////////
final class UpdateBusyDeliveryLoadingState
    extends BusyDeliveriesStates {}

final class UpdateBusyDeliverySuccessState
    extends BusyDeliveriesStates {}

final class UpdateBusyDeliveryErrorState
    extends BusyDeliveriesStates {
  final String errorMsg;

  UpdateBusyDeliveryErrorState({required this.errorMsg});
}