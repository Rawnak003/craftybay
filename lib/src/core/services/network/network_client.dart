import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkClient {
  final Logger _logger = Logger();
  final String _defaultErrorMessage = 'Something went wrong';
  final VoidCallback onUnauthorized;
  final Map<String, String> headers;

  NetworkClient({required this.onUnauthorized, required this.headers});

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      return NetworkResponse(responseData: responseBody, statusCode: response.statusCode, isSuccessful: true);
    } else if (response.statusCode == 401) {
      onUnauthorized();
      return NetworkResponse(statusCode: response.statusCode, errorMessage: 'Unauthorized',isSuccessful: false);
    } else {
      final responseBody = jsonDecode(response.body);
      return NetworkResponse(isSuccessful: false,statusCode: response.statusCode, errorMessage: responseBody['msg'] ?? _defaultErrorMessage);
    }
  }

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null, headers);
      Response response = await get(uri, headers: headers);
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccessful: false,statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> postRequest({required String url, required Map<String, dynamic> body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body, headers);
      Response response = await post(uri, headers: headers, body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccessful: false,statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> putRequest({required String url, required Map<String, dynamic> body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body, headers);
      Response response = await put(uri, headers: headers, body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccessful: false,statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> patchRequest({required String url, required Map<String, dynamic> body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body, headers);
      Response response = await patch(uri, headers: headers, body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccessful: false,statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> deleteRequest({required String url, required Map<String, dynamic> body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body, headers);
      Response response = await delete(uri, headers: headers, body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccessful: false,statusCode: -1, errorMessage: e.toString());
    }
  }

  void _logRequest(String url, Map<String, dynamic>? body, Map<String, String>? headers) {
    final String message = '''URL -> $url\nHeaders -> $headers\nBody -> $body''';
    _logger.i(message);
  }

  void _logResponse(Response response) {
    final String url = response.request!.url.toString();
    final int statusCode = response.statusCode;
    final Map<String, String>? headers = response.request?.headers;
    final String body = response.body;
    final String message = '''URL -> $url\nStatus Code -> $statusCode\nHeaders -> $headers\nBody -> $body''';
    _logger.i(message);
  }
}