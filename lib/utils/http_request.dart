import "dart:async";
import "dart:convert";

import "package:http/http.dart" as http;
enum RequestMethod {
  HTTP_GET,
  HTTP_POST
}

class HttpRequestUtil {
  final String requestURL;
  final RequestMethod method;
  HttpRequestUtil({this.requestURL, this.method});

  Future<Map<String, dynamic>> performRequest() async {
    http.Response response;

    if (method ==RequestMethod.HTTP_GET) {
      response = await http.get(this.requestURL);
    }
    else if (method ==RequestMethod.HTTP_POST) {
      response = await http.post(this.requestURL);
    }
    
    return json.decode(response.body);
  }
}
