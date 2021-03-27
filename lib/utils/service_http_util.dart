import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_app/utils/constants/message_constants.dart';
import 'package:marvel_app/utils/enums/type_rest.dart';

class ServiceHttpUtil {

  static const Map<String, String> headers = {'Content-Type' : 'application/json'};

  static Future<dynamic> callService(
      bool isHttps, String host, TypeRest rest, String uri,
      {String json,
        String msgConnection = MessageConstants.connectionError,
        String msgTimeOut = MessageConstants.timeoutError,
        String msgFailure = MessageConstants.communicationError,
        Map<String, dynamic> qParam}) async {

    Uri url = isHttps
        ? Uri.https(host, uri, qParam)
        : Uri.http(host, uri, qParam);

    http.Response response;

    switch (rest) {
      case TypeRest.GET:
        debugPrint('------------------------------- REQUEST GET --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('----------------------------------------------------------------------------');
        response = await http.get(url, headers: headers);
        break;

      case TypeRest.POST:
        debugPrint('------------------------------- REQUEST POST --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('POST -> $json');
        debugPrint('----------------------------------------------------------------------------');
        response = await http.post(url, headers: headers, body: json);
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

    return jsonDecode(response.body);

  }

}