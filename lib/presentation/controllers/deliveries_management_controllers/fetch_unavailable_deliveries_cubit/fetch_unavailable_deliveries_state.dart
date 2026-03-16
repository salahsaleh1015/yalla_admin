import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class FetchUnavailableDeliveriesStates {}

final class FetchUnavailableDeliveriesInitialState
    extends FetchUnavailableDeliveriesStates {}

final class FetchUnavailableDeliveriesLoadingState
    extends FetchUnavailableDeliveriesStates {}

final class FetchUnavailableDeliveriesSuccessState
    extends FetchUnavailableDeliveriesStates {
  final List<DeliveryEntity> unAvailableDeliveries;

  FetchUnavailableDeliveriesSuccessState({required this.unAvailableDeliveries});
}

final class FetchUnavailableDeliveriesErrorState
    extends FetchUnavailableDeliveriesStates {
  final String errorMsg;

  FetchUnavailableDeliveriesErrorState({required this.errorMsg});
}

