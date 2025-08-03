import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tn_test/core/constants/app_strings.dart';

import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  static const LatLng _center = LatLng(23.8103, 90.4125);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.shortestRoute.tr())),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          final markers = <Marker>{};
          final polyLines = <Polyline>{};

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

          if ((state.routePoints ?? []).isNotEmpty) {
            polyLines.add(Polyline(
              polylineId: const PolylineId("route"),
              points: state.routePoints ?? [],
              color: Colors.blue,
              width: 5,
            ));
          }

          return GoogleMap(
            initialCameraPosition:
                const CameraPosition(target: _center, zoom: 12),
            onMapCreated: (controller) {
              context.read<MapCubit>().mapController = controller;
            },
            markers: markers,
            polylines: polyLines,
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
