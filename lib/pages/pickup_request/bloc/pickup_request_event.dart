part of 'pickup_request_bloc.dart';

abstract class PickupRequestEvent extends Equatable {
  const PickupRequestEvent();
}

class PickupRequestSelectedCategoryEvent extends PickupRequestEvent {
  final String category;

  const PickupRequestSelectedCategoryEvent({
    required this.category,
  }) : super();

  @override
  List<Object> get props => [category];
}

class PickupRequestLocationEvent extends PickupRequestEvent {
  final double latitude;
  final double longitude;

  const PickupRequestLocationEvent({
    required this.latitude,
    required this.longitude,
  }) : super();

  @override
  List<Object?> get props => [latitude, longitude];
}
