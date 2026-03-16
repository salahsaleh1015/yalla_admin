import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchAvailableDeliveriesStates {}

final class FetchAvailableDeliveriesInitialState
    extends FetchAvailableDeliveriesStates {}
///////////////////////////////////////////////////////////////////////////////
final class FetchAvailableDeliveriesLoadingState
    extends FetchAvailableDeliveriesStates {}

final class FetchAvailableDeliveriesSuccessState
    extends FetchAvailableDeliveriesStates {
  final List<DeliveryEntity> availableDeliveries;

  FetchAvailableDeliveriesSuccessState({required this.availableDeliveries});
}

final class FetchAvailableDeliveriesErrorState
    extends FetchAvailableDeliveriesStates {
  final String errorMsg;

  FetchAvailableDeliveriesErrorState({required this.errorMsg});
}

/////////////////////////////////////////////////////////////////////////////////

