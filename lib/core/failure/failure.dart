import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "send time out");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "receive Timeout");

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "bad certificate");

      case DioExceptionType.badResponse:
        return ServerFailure.formBadResponse(dioException);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "request canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "connection error");
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "unknown error , try access later");
    }
  }

  factory ServerFailure.formBadResponse(DioException dioException) {
    if (dioException.response!.statusCode == 401 ||
        dioException.response!.statusCode == 400 ||
        dioException.response!.statusCode == 402 ||
        dioException.response!.statusCode == 403) {
      return ServerFailure(errorMessage: dioException.response!.data["code"]);
    } else if (dioException.response!.statusCode == 404 ||
        dioException.response!.statusCode == 522) {
      return ServerFailure(errorMessage: "your request not founded");
    } else if (dioException.response!.statusCode == 500) {
      return ServerFailure(
        errorMessage: "internal server error ,plz later again",
      );
    }
    return ServerFailure(errorMessage: "unknown error , try access later");
  }
}
