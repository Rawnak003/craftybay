part of 'network_client.dart';

class NetworkResponse<T> {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final String? errorMessage;
  final bool isSuccessful;

  NetworkResponse({
    required this.isSuccessful,
    required this.statusCode,
    this.responseData,
    this.errorMessage,
  });
}