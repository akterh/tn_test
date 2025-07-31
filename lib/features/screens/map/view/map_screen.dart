import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/app/app_context.dart';
import '../../../components/custom_back.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(23.8103, 90.4125),
                  zoom: 12,
                ),
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: {Marker(markerId: MarkerId(''))},
                onTap: (LatLng newPosition) async {
                  setState(() {});
                },
              ),
              Positioned(
                  top: 70,
                  left: 20,
                  child: CustomBackButton(
                    onTap: () => GetContext.back(),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
