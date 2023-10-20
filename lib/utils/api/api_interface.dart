import 'dart:convert';
import 'package:http/http.dart';

import 'api_client.dart';
import 'api_method.dart';

class ApiInterface {
  static Future<Map<String, dynamic>> send(
      {required ApiMethod apiMethod,
      Map<String, dynamic>? body,
      required String route}) async {
    late Response response;

    if (apiMethod == ApiMethod.GET) {
      response = await ApiClient.client().get(ApiClient.url(route));
    } else if (apiMethod == ApiMethod.POST) {
      response = await ApiClient.client()
          .post(ApiClient.url(route), body: jsonEncode(body ?? {}));
    } else if (apiMethod == ApiMethod.PUT) {
      response = await ApiClient.client()
          .put(ApiClient.url(route), body: jsonEncode(body ?? {}));
    } else if (apiMethod == ApiMethod.DELETE) {
      response = await ApiClient.client().delete(ApiClient.url(route));
    } else {
      return {};
    }

    return jsonDecode(response.body);
  }
}
