import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http4/package_content/domain/http4_config.dart';
import 'package:http4/package_content/domain/http4_response.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Http4PutImplementation {
  late InterceptedClient client;
  late Uri baseUrl;
  final RetryPolicy? retryPolicy;
  final Map<String, dynamic> body;
  final Map<String, dynamic> params;
  final Map<String, String> headers;

  Http4PutImplementation({
    List<InterceptorContract> interceptors = const [],
    required String url,
    this.body = const {},
    this.params = const {},
    this.headers = const {},
    this.retryPolicy,
  }) {
    client = InterceptedClient.build(
      interceptors: interceptors,
      retryPolicy: retryPolicy,
    );
    baseUrl = Uri.parse('${Http4Config().baseUrl}$url');
  }

  Future<Http4Response> call() async {
    try {
      final response = await client.put(
        baseUrl,
        headers: headers,
        params: params,
        body: body,
      );

      client.close();

      return Http4Response(
        httpResponse: response,
        isSuccessed: true,
        isOkey: [200, 201, 202, 203, 204, 205, 206, 207]
            .contains(response.statusCode),
        decodedBody: jsonDecode(response.body),
      );
    } catch (exception) {
      if (Http4Config().debugMode) {
        debugPrint('\nHTTP4 Exception: ');
        debugPrint('Endpoint: (PUT) $baseUrl');
        debugPrint('Exception: $exception');
        debugPrint('\n\n');
      }

      client.close();

      return Http4Response(
        httpResponse: null,
        isSuccessed: false,
        isOkey: false,
        decodedBody: null,
      );
    }
  }
}
