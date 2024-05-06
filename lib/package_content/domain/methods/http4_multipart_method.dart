import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http4/package_content/data/http_methods_enum.dart';
import 'package:http4/package_content/data/http_methods_ext.dart';
import 'package:http4/package_content/domain/http4_config.dart';
import 'package:http4/package_content/domain/http4_response.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;

class Http4MultipartImplementation {
  late InterceptedClient client;
  late Uri baseUrl;
  late Http4Method method;
  final RetryPolicy? retryPolicy;
  final Map<String, String> fields;
  final Map<String, String> headers;
  final List<MultipartFile> files;

  Http4MultipartImplementation({
    List<InterceptorContract> interceptors = const [],
    required String url,
    required this.method,
    required this.files,
    this.fields = const {},
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
      final req = http.MultipartRequest(
        method.toStr,
        baseUrl,
      );

      req.headers.addAll(headers);
      req.fields.addAll(fields);
      req.files.addAll(files);

      final response = await http.Response.fromStream(
        await client.send(req),
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
        debugPrint('Endpoint: (MULTIPART | ${method.toStr}) $baseUrl');
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
