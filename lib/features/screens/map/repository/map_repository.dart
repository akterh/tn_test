import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapRepository {
  final String apiKey;

  MapRepository({required this.apiKey});

  Future<List<LatLng>> fetchRoute(LatLng start, LatLng end) async {
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['routes'].isNotEmpty) {
      final points = PolylinePoints()
          .decodePolyline(data['routes'][0]['overview_polyline']['points']);

      return points
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList(growable: false);
    }else{
      return [];
    }


  }
}
