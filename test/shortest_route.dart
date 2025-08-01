import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tn_test/core/constants/secret.dart';
import 'package:tn_test/features/screens/map/repository/map_repository.dart';

void main() {
  group('MapRepository', () {
    late MapRepository repository;

    setUp(() {
      repository = MapRepository(apiKey: 'YOUR_GOOGLE_API_KEY');
    });

    test('returns the shortest route as one of the alternatives', () async {
      final origin = LatLng(23.8103, 90.4125);
      final destination = LatLng(23.8040, 90.3667);

      final routes = await repository.fetchRoute(
        origin,
        destination,
      );

      expect(routes.isNotEmpty, true);

      final distances =
          routes.map((r) => r['legs'][0]['distance']['value'] as int).toList();

      final minDistance = distances.reduce((a, b) => a < b ? a : b);

      print('First route: ${distances[0]} meters');
      print('Shortest route: ${minDistance} meters');

      // Optionally assert the first is shortest
      expect(distances[0], equals(minDistance),
          reason: 'First route should be shortest by distance');
    });
  });
}
