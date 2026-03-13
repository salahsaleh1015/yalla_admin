import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class AvailableDeliveriesStates {}

final class AvailableDeliveriesInitialState
    extends AvailableDeliveriesStates {}
///////////////////////////////////////////////////////////////////////////////
final class FetchAvailableDeliveriesLoadingState
    extends AvailableDeliveriesStates {}

final class FetchAvailableDeliveriesSuccessState
    extends AvailableDeliveriesStates {
  final List<DeliveryEntity> availableDeliveries;

  FetchAvailableDeliveriesSuccessState({required this.availableDeliveries});
}

final class FetchAvailableDeliveriesErrorState
    extends AvailableDeliveriesStates {
  final String errorMsg;

  FetchAvailableDeliveriesErrorState({required this.errorMsg});
}

/////////////////////////////////////////////////////////////////////////////////

final class DeleteAvailableDeliveryLoadingState
    extends AvailableDeliveriesStates {}

final class DeleteAvailableDeliverySuccessState
    extends AvailableDeliveriesStates {}

final class DeleteAvailableDeliveryErrorState
    extends AvailableDeliveriesStates {
  final String errorMsg;

  DeleteAvailableDeliveryErrorState({required this.errorMsg});
}
/////////////////////////////////////////////////////////////////////////////////
final class UpdateAvailableDeliveryLoadingState
    extends AvailableDeliveriesStates {}

final class UpdateAvailableDeliverySuccessState
    extends AvailableDeliveriesStates {}

final class UpdateAvailableDeliveryErrorState
    extends AvailableDeliveriesStates {
  final String errorMsg;

  UpdateAvailableDeliveryErrorState({required this.errorMsg});
}