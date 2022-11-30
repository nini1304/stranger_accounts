import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto/ResponseDto.dart';
import '../service/service.dart' as service;

class RegisterService {
  static const String backendUrlBase = "http://192.168.31.149:25060";
  static Future<ResponseDto> register(String picture, String name,
      String lastname, String username, String password, String phone) async {
    ResponseDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/userapi/register");
    var body = jsonEncode({
      'picture': picture,
      'name': name,
      'lastname': lastname,
      'username': username,
      'password': password,
      'phone': phone,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      result = ResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register.');
    }
    return result;
  }
}
