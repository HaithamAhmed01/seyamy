import 'package:dio/dio.dart';

import '../utils/app_string.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(ResponseMessage.CONNECT_TIMEOUT);
      case DioErrorType.sendTimeout:
        return ServerFailure(ResponseMessage.SEND_TIMEOUT);
      case DioErrorType.receiveTimeout:
        return ServerFailure(ResponseMessage.RECIEVE_TIMEOUT);
      case DioErrorType.badCertificate:
        return ServerFailure(ResponseMessage.BAD_REQUEST);
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(ResponseMessage.CANCEL);
      case DioErrorType.connectionError:
        return ServerFailure(ResponseMessage.NO_INTERNET_CONNECTION);
      case DioErrorType.unknown:
        return ServerFailure(ResponseMessage.DEFAULT);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(ResponseMessage.NOT_FOUND);
    } else if (statusCode == 500) {
      return ServerFailure(ResponseMessage.INTERNAL_SERVER_ERROR);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure(ResponseMessage.DEFAULT);
    }
  }
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String DEFAULT = AppStrings.defaultError;
}
