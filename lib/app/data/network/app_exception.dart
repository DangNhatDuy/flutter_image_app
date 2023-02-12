class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException(
      {required this.message, required this.prefix, required this.url});
}

class BadRequestException extends AppException {
  BadRequestException({required String message, required String url})
      : super(message: message, prefix: 'Bad request', url: url);
}

class FetchDataException extends AppException {
  FetchDataException({required String message, required String url})
      : super(message: message, prefix: 'Fail to fetch data', url: url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({required String message, required String url})
      : super(message: message, prefix: 'Api not response', url: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required String message, required String url})
      : super(message: message, prefix: 'Unauthorization', url: url);
}
