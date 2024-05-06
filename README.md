# HTTP4

The **`http4`** package provides enhanced HTTP request functionality in Flutter by leveraging the **`http`** package and **`http_interceptor`** for customizable HTTP requests with additional features and a new call-to-action style.



## Features
- **HTTP Methods**: Simplified HTTP methods (GET, POST, PUT, PATCH, DELETE, MULTIPART) with customizable headers, parameters, and retry policies.
- **HTTP Interceptors**: Ability to use interceptors for modifying request headers, logging, and retrying failed requests.
- **Configurable Base URL**: Configure a base URL for all HTTP requests within the package.
- **Debug Mode**: Enable debug mode to print detailed information about HTTP requests and exceptions.


## Installation
Add `lazylist` to your `pubspec.yaml` file:
```yaml
dependencies:
    http4: ^1.0.0
```


## Usage

### 1st way
```dart
import 'package:http4/http4.dart';

void fetchData() async {
  final http4 = Http4();

  final response = await http4.get(
    '/api/data',
    headers: {'Authorization': 'Bearer <token>'},
    params: {'page': 1},
    retryPolicy: RetryOptions(maxAttempts: 3),
  );

  if (response.isSuccessed && response.isOkey) {
    // Handle successful response
    print('Response: ${response.decodedBody}');
  } else {
    // Handle failed response
    print('Request failed');
  }
}

```

### 2nd way (inherit from Http4)
```dart
import 'package:http4/http4.dart' as http4;

class ExampleService extends http4.Http4 {
  Future<List<Map<String,dynamic>>> fetchData() async {
    final response = await get(
      '/posts?_page=1&_per_page=10',
      interceptors: [AuthInterceptor()],
    );

    return response.decodedBody;
  }
}
```
## Configuration
To configure the base URL and debug mode, use `Http4Config`:

```dart
final config = Http4Config();
  config.baseUrl = 'https://api.example.com';
  config.debugMode = true;
```


## Contributing
Contributions are welcome! Please feel free to submit issues, fork the repository, and submit pull requests.

To contribute to this package, follow these steps:

1. Fork the repository.
2. Create a new branch **`(git checkout -b feature/my-feature)`**.
3. Make your changes.
4. Commit your changes **`(git commit -am 'Add new feature')`**.
5. Push to the branch **`(git push origin feature/my-feature)`**.
6. Create a new Pull Request.



## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.

