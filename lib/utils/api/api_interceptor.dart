import 'dart:developer';

import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class ApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers["content-type"] = "application/json";

    log("------->Request Start\n${data.method}: ${data.baseUrl} \nHeaders: ${data.headers}\nBody: \n${data.body}\n<----------Request End",
        time: DateTime.now());

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log("------->Response Start\n${data.method}${data.statusCode}: ${data.url} \nHeaders: ${data.headers}\nBody: \n${data.body}\n<----------Response End",
        time: DateTime.now());

    return data;
  }
}
