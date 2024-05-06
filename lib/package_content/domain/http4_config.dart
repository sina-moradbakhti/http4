class Http4Config {
  static final Http4Config _singleton = Http4Config._internal();
  factory Http4Config() => _singleton;
  Http4Config._internal();

  String baseUrl = "";
  bool debugMode = true;
}
