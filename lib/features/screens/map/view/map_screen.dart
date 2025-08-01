import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../../../../core/constants/secret.dart';
import '../repository/map_repository.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const LatLng _center = LatLng(23.8103, 90.4125);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit(MapRepository(apiKey: googleApiKey)),
      child: const MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shortest Route Finder")),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          final markers = <Marker>{};
          final polylines = <Polyline>{};

          if (state.startPoint != null) {
            markers.add(Marker(
              markerId: const MarkerId("start"),
              position: state.startPoint!,
              infoWindow: const InfoWindow(title: "Start"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ));
          }

          if (state.endPoint != null) {
            markers.add(Marker(
              markerId: const MarkerId("end"),
              position: state.endPoint!,
              infoWindow: const InfoWindow(title: "End"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ));
          }

          if (state.routePoints.isNotEmpty) {
            polylines.add(Polyline(
              polylineId: const PolylineId("route"),
              points: state.routePoints,
              color: Colors.blue,
              width: 5,
            ));
          }

          return GoogleMap(
            initialCameraPosition:
                const CameraPosition(target: MapScreen._center, zoom: 12),
            onMapCreated: (controller) => _controller.complete(controller),
            markers: markers,
            polylines: polylines,
            onTap: (point) {
              final cubit = context.read<MapCubit>();
              if (state.startPoint == null) {
                cubit.setStartPoint(point);
              } else if (state.endPoint == null) {
                cubit.setEndPoint(point);
              } else {
                cubit.reset();
              }
            },
          );
        },
      ),
    );
  }
}
