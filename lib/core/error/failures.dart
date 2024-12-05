import 'package:dio/dio.dart';
abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    if (dioException.response != null) {
      return ServerFailure.fromResponse(
        dioException.response?.statusCode,
        dioException.response?.data,
      );
    } else {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
          return ServerFailure('Connection timeout with the API server');
        case DioExceptionType.sendTimeout:
          return ServerFailure('Send timeout with the API server');
        case DioExceptionType.receiveTimeout:
          return ServerFailure('Receive timeout with the API server');
        case DioExceptionType.cancel:
          return ServerFailure('Request to the API server was cancelled');
        case DioExceptionType.connectionError:
          return ServerFailure('Connection error occurred. Please check your internet connection');
        case DioExceptionType.unknown:
        default:
          return ServerFailure('An unknown error occurred');
      }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message'] ?? 'Bad request. Please try again');
    } else if (statusCode == 404) {
      return ServerFailure('The requested resource was not found. Please try later.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error. Please try later.');
    } else if (statusCode == 502) {
      return ServerFailure('Bad Gateway. Please try again later.');
    } else if (statusCode == 503) {
      return ServerFailure('Service Unavailable. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred with status code: $statusCode');
    }
  }
}
