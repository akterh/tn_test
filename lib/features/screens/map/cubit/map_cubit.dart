import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:tn_test/core/constants/secret.dart';
import 'package:tn_test/features/screens/map/repository/map_repository_impl.dart';

import '../repository/map_repository.dart';
import 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  final MapRepository repository;

  MapCubit(this.repository) : super(MapState.initial());
  GoogleMapController? mapController;

  void setStartPoint(LatLng point) {
    emit(state.copyWith(startPoint: point));
  }

  void setEndPoint(LatLng point) async {
    emit(state.copyWith(endPoint: point, status: MapStatus.loading));
    fetchRoute();
  }

  void fetchRoute() async {
    try {
      final route = await repository.fetchRoute({
        "origin":
            "${state.startPoint?.latitude},${state.startPoint?.longitude}",
        "destination":
            "${state.endPoint?.latitude},${state.endPoint?.longitude}",
        "key": googleApiKey
      });

      route.fold((failure) {}, (data) {

        //Note though api provides data based on distance sometime it's failed , that's why made it sorted again
        data.routes?.sort((a, b) {
          final aDistance = a.legs?.first.distance?.value ?? double.infinity;
          final bDistance = b.legs?.first.distance?.value ?? double.infinity;
          return aDistance.compareTo(bDistance);
        });

        final decodedPoints = PolylinePoints()
            .decodePolyline(data.routes?.first.overviewPolyline?.points ?? "");

        final routePoints =
            decodedPoints.map((p) => LatLng(p.latitude, p.longitude)).toList();

        emit(
            state.copyWith(routePoints: routePoints, status: MapStatus.loaded));
      });
    } catch (e) {
      emit(state.copyWith(status: MapStatus.error));
    }
  }

  void reset() {
    emit(MapState.initial());
  }
}
