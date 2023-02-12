import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import './app_exception.dart';
import './constants/endpoints.dart';

class BaseClient {
  Future<dynamic> get(String api, {Map<String, String>? headers}) async {
    var uri = Uri.parse(Endpoints.baseUrl + api);
    headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    try {
      var response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(
            const Duration(
              milliseconds: Endpoints.receiveTimeout,
            ),
          );
      return _processResponse(response, uri.toString());
    } on SocketException {
      throw FetchDataException(
        message: 'No internet connection',
        url: uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        message: 'Request timeout',
        url: uri.toString(),
      );
    }
  }

  dynamic _processResponse(http.Response response, String url) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
          message: utf8.decode(response.bodyBytes),
          url: response.request!.url.toString(),
        );
      case 401:
      case 403:
        throw UnAuthorizedException(
          message: utf8.decode(response.bodyBytes),
          url: response.request!.url.toString(),
        );
      case 500:
      default:
        throw FetchDataException(
          message: 'Error : ${response.statusCode}',
          url: response.request!.url.toString(),
        );
    }
  }
}
