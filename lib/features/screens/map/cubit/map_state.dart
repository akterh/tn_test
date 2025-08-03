import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tn_test/features/screens/map/model/direction_response.dart';

enum MapStatus { initial, loading, loaded, error }

class MapState extends Equatable {
  final LatLng? startPoint;
  final LatLng? endPoint;
  final List<LatLng>? routePoints;
  final MapStatus status;

  const MapState({
    this.startPoint,
    this.endPoint,
    this.routePoints,
    this.status = MapStatus.initial,
  });

  factory MapState.initial() => const MapState();

  MapState copyWith({
    LatLng? startPoint,
    LatLng? endPoint,
    List<LatLng>? routePoints,
    MapStatus? status,
  }) {
    return MapState(
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      routePoints: routePoints ?? this.routePoints,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [startPoint, endPoint, routePoints, status];
}
