import 'package:yalla_admin/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class UnavailableDeliveriesStates {}

final class UnavailableDeliveriesInitialState
    extends UnavailableDeliveriesStates {}

final class FetchUnavailableDeliveriesLoadingState
    extends UnavailableDeliveriesStates {}

final class FetchUnavailableDeliveriesSuccessState
    extends UnavailableDeliveriesStates {
  final List<DeliveryEntity> unAvailableDeliveries;

  FetchUnavailableDeliveriesSuccessState({required this.unAvailableDeliveries});
}

final class FetchUnavailableDeliveriesErrorState
    extends UnavailableDeliveriesStates {
  final String errorMsg;

  FetchUnavailableDeliveriesErrorState({required this.errorMsg});
}

final class AddUnavailableDeliveryLoadingState
    extends UnavailableDeliveriesStates {}

final class AddUnavailableDeliverySuccessState
    extends UnavailableDeliveriesStates {}

final class AddUnavailableDeliveryErrorState
    extends UnavailableDeliveriesStates {
  final String errorMsg;

  AddUnavailableDeliveryErrorState({required this.errorMsg});
}



final class DeleteUnavailableDeliveryLoadingState
    extends UnavailableDeliveriesStates {}

final class DeleteUnavailableDeliverySuccessState
    extends UnavailableDeliveriesStates {}

final class DeleteUnavailableDeliveryErrorState
    extends UnavailableDeliveriesStates {
  final String errorMsg;

  DeleteUnavailableDeliveryErrorState({required this.errorMsg});
}

final class UpdateUnavailableDeliveryLoadingState
    extends UnavailableDeliveriesStates {}

final class UpdateUnavailableDeliverySuccessState
    extends UnavailableDeliveriesStates {}

final class UpdateUnavailableDeliveryErrorState
    extends UnavailableDeliveriesStates {
  final String errorMsg;

  UpdateUnavailableDeliveryErrorState({required this.errorMsg});
}
