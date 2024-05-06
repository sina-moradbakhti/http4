import 'package:http4/package_content/data/http_methods_enum.dart';
import 'package:http4/package_content/domain/http4_response.dart';
import 'package:http4/package_content/domain/methods/http4_delete_method.dart';
import 'package:http4/package_content/domain/methods/http4_get_method.dart';
import 'package:http4/package_content/domain/methods/http4_multipart_method.dart';
import 'package:http4/package_content/domain/methods/http4_patch_method.dart';
import 'package:http4/package_content/domain/methods/http4_post_method.dart';
import 'package:http4/package_content/domain/methods/http4_put_method.dart';
import 'package:http4/package_content/repository/http4_repository.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Http4 extends Http4Repository {
  @override
  Future<Http4Response> delete(
    final String url, {
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4DeleteImplementation(
        url: url,
        body: body,
        headers: headers,
        params: params,
        retryPolicy: retryPolicy,
        interceptors: interceptors,
      ).call();

  @override
  Future<Http4Response> get(
    final String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4GetImplementation(
        url: url,
        headers: headers,
        params: params,
        retryPolicy: retryPolicy,
        interceptors: interceptors,
      ).call();

  @override
  Future<Http4Response> patch(
    final String url, {
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4PatchImplementation(
        url: url,
        body: body,
        headers: headers,
        params: params,
        retryPolicy: retryPolicy,
        interceptors: interceptors,
      ).call();

  @override
  Future<Http4Response> post(
    final String url, {
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4PostImplementation(
        url: url,
        body: body,
        headers: headers,
        params: params,
        retryPolicy: retryPolicy,
        interceptors: interceptors,
      ).call();

  @override
  Future<Http4Response> put(
    final String url, {
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4PutImplementation(
        url: url,
        body: body,
        headers: headers,
        params: params,
        retryPolicy: retryPolicy,
        interceptors: interceptors,
      ).call();

  @override
  Future<Http4Response> multipart(
    final String url, {
    required Http4Method method,
    Map<String, String> fields = const {},
    Map<String, String> headers = const {},
    List<MultipartFile> files = const [],
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  }) async =>
      await Http4MultipartImplementation(
        url: url,
        method: method,
        files: files,
        fields: fields,
        headers: headers,
        interceptors: interceptors,
        retryPolicy: retryPolicy,
      ).call();
}
