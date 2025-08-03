import 'package:dartz/dartz.dart';
import 'package:tn_test/core/data_source_client/network/api_failure.dart';

import '../model/direction_response.dart';

abstract class MapRepository {
  Future<Either<ApiFailure, DirectionResponse>> fetchRoute(Map<String, dynamic> params);
}
