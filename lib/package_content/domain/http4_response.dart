import 'package:http/http.dart' as http;

class Http4Response {
  final http.Response? httpResponse;
  final bool isSuccessed;
  final bool isOkey;
  final dynamic decodedBody;

  Http4Response({
    required this.isSuccessed,
    required this.decodedBody,
    required this.isOkey,
    this.httpResponse,
  });
}
