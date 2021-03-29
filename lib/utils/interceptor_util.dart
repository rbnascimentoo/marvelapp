import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';
import 'package:marvelapp/utils/hash_util.dart';

class ApiInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {

    String ts = HashUtil.generateTsRandom();

    String hash = ts + MessageConstants.apikey2 + MessageConstants.apikey;

    var bytes = utf8.encode(hash);

    String md5Hash = md5.convert(bytes).toString();

    try {
      data.params['ts'] = ts;
      data.params['apikey'] = MessageConstants.apikey;
      data.params['hash'] = md5Hash;
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }

}