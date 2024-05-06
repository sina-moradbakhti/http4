import 'package:http/http.dart';
import 'package:http4/package_content/data/http_methods_enum.dart';
import 'package:http4/package_content/domain/http4_response.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';
import 'package:http_interceptor/models/retry_policy.dart';

abstract class Http4Repository {
  Future<Http4Response> get(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
  Future<Http4Response> post(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
  Future<Http4Response> patch(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
  Future<Http4Response> put(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
  Future<Http4Response> delete(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
  Future<Http4Response> multipart(
    String url, {
    required Http4Method method,
    Map<String, String> fields = const {},
    Map<String, String> headers = const {},
    List<MultipartFile> files = const [],
    List<InterceptorContract> interceptors = const [],
    RetryPolicy? retryPolicy,
  });
}
