import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import 'api_interceptor.dart';

class ApiClient {
  static const String BASE_URL = "https://api.nytimes.com/svc/mostpopular/v2/";

  static http.Client client() {
    return InterceptedClient.build(interceptors: [ApiInterceptor()]);
  }

  static Uri url(String route) {
    String fullRoute = "$BASE_URL$route";
    return Uri.parse(fullRoute);
  }
}
