import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';
import 'package:marvelapp/utils/enums/type_rest.dart';
import 'package:marvelapp/utils/interceptor_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceHttpUtil {

  static final http.Client client = HttpClientWithInterceptor.build(interceptors: [
    ApiInterceptor(),
  ]);

  static Future<dynamic> callService(
      bool isHttps, String host, TypeRest rest, String uri,
      {String json,
        String msgConnection = MessageConstants.connectionError,
        String msgTimeOut = MessageConstants.timeoutError,
        String msgFailure = MessageConstants.communicationError,
        Map<String, dynamic> qParam}) async {

    String filename =  uri.replaceAll('/', '-') + '${qParam['offset']}';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.get(filename) != null) {
      return jsonDecode(prefs.get(filename));
    }

    Uri url = isHttps
        ? Uri.https(host, uri, qParam)
        : Uri.http(host, uri, qParam);

    http.Response response;

    switch (rest) {
      case TypeRest.GET:
        debugPrint('------------------------------- REQUEST GET --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('----------------------------------------------------------------------------');
        response = await client.get(url);
        debugPrint('response=$response');
        break;

      case TypeRest.POST:
        debugPrint('------------------------------- REQUEST POST --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('POST -> $json');
        debugPrint('----------------------------------------------------------------------------');
        response = await client.post(url, body: json);
        debugPrint('response=$response');
        break;

        default:
          {
            debugPrint('callService -> default');
            break;
          }
    }

    if (response.statusCode != 200) {
       throw msgFailure;
    }

    await prefs.setString(filename, response.body);
    return jsonDecode(response.body);

  }

}