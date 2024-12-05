import 'package:codenesslab_task/core/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {

  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    var result = await _dio.get('${ApiConstants.baseUrl}$endPoint', queryParameters: query);

    return result.data;
  }
}
