import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../repository/map_repository.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapRepository repository;

  MapCubit(this.repository) : super(MapState.initial());

  void setStartPoint(LatLng point) {
    emit(state.copyWith(startPoint: point));
  }

  void setEndPoint(LatLng point) async {
    emit(state.copyWith(endPoint: point, status: MapStatus.loading));

    try {
      final route = await repository.fetchRoute(state.startPoint!, point);
      emit(state.copyWith(routePoints: route, status: MapStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: MapStatus.error));
    }
  }

  void reset() {
    emit(MapState.initial());
  }
}
