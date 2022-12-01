import 'dart:convert';

import '../dto/ResponseDto.dart';
import 'package:http/http.dart' as http;
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;

class RestorePassService {
  static String backendUrlBase = ip.urlBack;
  static Future<ResponseDto> restorepass(String password) async {
    ResponseDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/userapi/restorepass");
    var body = jsonEncode({
      'password': password,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      result = ResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update.');
    }
    return result;
  }
}
