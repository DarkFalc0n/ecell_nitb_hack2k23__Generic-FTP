part of 'pickup_request_bloc.dart';

abstract class PickupRequestState extends Equatable {
  const PickupRequestState();
}

class PickupRequestInitialState extends PickupRequestState {
  final String category;
  final double latitude;
  final double longitude;

  const PickupRequestInitialState({
    required this.category,
    required this.latitude,
    required this.longitude,
  }) : super();

  @override
  List<Object> get props => [category, latitude, longitude];
}
