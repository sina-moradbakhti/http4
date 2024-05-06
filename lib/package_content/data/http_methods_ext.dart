import 'package:http4/package_content/data/http_methods_enum.dart';

extension Http4MethodsExt on Http4Method {
  String get toStr {
    switch (this) {
      case Http4Method.get:
        return 'GET';
      case Http4Method.post:
        return 'POST';
      case Http4Method.delete:
        return 'DELETE';
      case Http4Method.patch:
        return 'PATCH';
      case Http4Method.put:
        return 'PUT';
      default:
        return 'GET';
    }
  }
}
