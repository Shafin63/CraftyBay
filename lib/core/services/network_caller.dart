import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final VoidCallback onUnauthorize;
  final Map<String, String>? headers;

  NetworkCaller({required this.onUnauthorize, this.headers});

  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url); //parsing url into uri form

      _logRequest(url);
      Response response = await get(
        uri,
        headers: headers,
      );
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        //SUCCESS
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        onUnauthorize;
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: "Un-authorized!",
          responseData: null,
        );
      } else {
        //FAILED
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
          errorMessage: decodedData['data'],
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url); //parsing url into uri form

      _logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        //SUCCESS
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        onUnauthorize();
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: "Un-authorized!",
          responseData: null,
        );
      } else {
        //FAILED
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
          errorMessage: decodedData['data'],
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      "URL => $url\n"
          "Request Body => $body",
    );
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      "URL => $url\n"
          "Status Code => ${response.statusCode}\n"
          "Body => ${response.body}\n",
    );
  }

  Future<void> _moveToLogIn() async {
    // await AuthController.clearUserData();
    // Navigator.pushAndRemoveUntil(
    //   TaskManagerApp.navigator.currentContext!,
    //   MaterialPageRoute(builder: (_) => LoginScreen()),
    //       (predicate) => false,
    // );
  }
}

class ApiResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic responseData;
  final String? errorMessage;

  ApiResponse({
    required this.isSuccess,
    required this.responseCode,
    required this.responseData,
    this.errorMessage = "Something went wrong",
  });
}