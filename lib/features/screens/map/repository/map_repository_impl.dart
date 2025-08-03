import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tn_test/core/data_source_client/network/api_failure.dart';
import 'package:tn_test/core/data_source_client/network/api_urls.dart';
import 'package:tn_test/features/screens/map/repository/map_repository.dart';

import '../../../../core/data_source_client/network/api_client.dart';
import '../../../../core/data_source_client/network/api_exception.dart';
import '../../../../core/data_source_client/network/api_request.dart';
import '../model/direction_response.dart';

@Injectable(as: MapRepository)
class MapRepositoryImpl implements MapRepository {
  MapRepositoryImpl({required ApiRequest apiRequest})
      : _apiRequest = apiRequest;

  final ApiRequest _apiRequest;

  @override
  Future<Either<ApiFailure, DirectionResponse>> fetchRoute(
      Map<String, dynamic> params) async {
    try {
      return _apiRequest.performRequest(
          url: ApiUrls.directionUrl,
          method: Method.get,
          params: params,
          fromJson: DirectionResponse.fromJson);
    } catch (e) {
      log("error $e");
      return Left(ApiException.handle(e).failure);
    }
  }
}
