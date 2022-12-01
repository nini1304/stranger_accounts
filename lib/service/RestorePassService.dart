import 'dart:convert';

import '../dto/ResponseDto.dart';
import 'package:http/http.dart' as http;

class RestorePassService {
  static const String backendUrlBase = "http://192.168.1.216:25060";
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
