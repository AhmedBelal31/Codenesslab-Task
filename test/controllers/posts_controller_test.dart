import 'package:codenesslab_task/core/services/web_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:codenesslab_task/core/utils/constants/api_constants.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late ApiService apiService;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    apiService = ApiService(mockDioClient);
  });

  group('ApiService Tests', () {
    test('should return data when the API call is successful', () async {
      final mockResponse = Response(data: {
        'key': 'value'
      }, requestOptions: RequestOptions(path: '${ApiConstants.postsEndPoint}'));
      when(mockDioClient.get(
              '${ApiConstants.baseUrl}${ApiConstants.postsEndPoint}',
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      // اختبار ApiService
      final result =
          await apiService.getData(endPoint: '${ApiConstants.postsEndPoint}');

      // تحقق من النتيجة
      expect(result, isNotNull);
      expect(result['key'], 'value');
      verify(mockDioClient.get(
              '${ApiConstants.baseUrl}${ApiConstants.postsEndPoint}',
              queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test('should throw an error when the API call fails', () async {
      // محاكاة فشل الاتصال بالـ API
      when(mockDioClient.get(
              '${ApiConstants.baseUrl}${ApiConstants.postsEndPoint}',
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: '${ApiConstants.postsEndPoint}'),
        type: DioExceptionType.unknown,
        error: 'Test error',
      ));

      // اختبار ApiService ومعالجة الأخطاء
      expect(
          () async => await apiService.getData(
              endPoint: '${ApiConstants.postsEndPoint}'),
          throwsA(isA<DioError>()));
    });
  });
}
