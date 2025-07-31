part of 'map_cubit.dart';

// Base sealed class
sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

final class MapInitial extends MapState {
  const MapInitial();
}

final class MapLoading extends MapState {
  const MapLoading();
}

final class MapLoaded extends MapState {
  final List<LatLng> selectedPoints;
  final Set<Marker> markers;
  final Polyline? polyline;
  final String? distance;
  final String? duration;

  const MapLoaded({
    required this.selectedPoints,
    required this.markers,
    this.polyline,
    this.distance,
    this.duration,
  });

  MapLoaded copyWith({
    List<LatLng>? selectedPoints,
    Set<Marker>? markers,
    Polyline? polyline,
    String? distance,
    String? duration,
  }) {
    return MapLoaded(
      selectedPoints: selectedPoints ?? this.selectedPoints,
      markers: markers ?? this.markers,
      polyline: polyline ?? this.polyline,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
        selectedPoints,
        markers,
        polyline,
        distance,
        duration,
      ];
}
