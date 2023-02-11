import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pickup_request_event.dart';
part 'pickup_request_state.dart';

class PickupRequestBloc extends Bloc<PickupRequestEvent, PickupRequestState> {
  PickupRequestBloc()
      : super(
          const PickupRequestInitialState(
            category: "",
            latitude: 0.0,
            longitude: 0.0,
          ),
        ) {
    on<PickupRequestSelectedCategoryEvent>((event, emit) => null);

    on<PickupRequestLocationEvent>((event, emit) => null);
  }
}
