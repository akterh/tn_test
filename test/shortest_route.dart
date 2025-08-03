import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:mocktail/mocktail.dart';
import 'package:tn_test/core/constants/secret.dart';
import 'package:tn_test/features/screens/map/cubit/map_cubit.dart';
import 'package:tn_test/features/screens/map/cubit/map_state.dart';
import 'package:tn_test/features/screens/map/model/direction_response.dart';
import 'package:tn_test/features/screens/map/repository/map_repository.dart';
import 'package:tn_test/features/screens/map/repository/map_repository_impl.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  late MockMapRepository mockRepository;
  late MapCubit cubit;

  setUp(() {
    mockRepository = MockMapRepository();
    cubit = MapCubit(mockRepository);
  });

  test('should select route with shortest distance', () async {
    // Arrange
    final route1 = Routes(
      legs: [
        Legs(distance: Distance(value: 5000, text: '5 km')),
      ],
      overviewPolyline: Polyline(
        points: '_p~iF~ps|U_ulLnnqC_mqNvxq`@', // Decodes to 3 points
      ),
    );

    final route2 = Routes(
      legs: [
        Legs(distance: Distance(value: 3000, text: '3 km')),
      ],
      overviewPolyline: Polyline(
        points: 'a~l~Fjk~uOwHJy@P', // Decodes to 3 different points
      ),
    );

    final directionResponse = DirectionResponse(routes: [route1, route2]);

    when(() => mockRepository.fetchRoute(any()))
        .thenAnswer((_) async => Right(directionResponse));

    // Act
    cubit.fetchRoute();

    expect(cubit.state.routePoints, isNotEmpty);
    expect(cubit.state.status, MapStatus.loaded);

    // Assert
    final emitted = cubit.state.routePoints;

    // Decode manually what polyline 'a~l~Fjk~uOwHJy@P' gives
    final expectedPoints = [
      const map.LatLng(38.5, -120.2),
      const map.LatLng(40.7, -120.95),
      const map.LatLng(43.252, -126.453)
    ];

    expect(emitted, expectedPoints);
  });
}