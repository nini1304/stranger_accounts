import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/ResponseDto.dart';

class VerifyUserService {
<<<<<<< HEAD
  static const String backendUrlBase = "http://192.168.0.145:25060";
=======
  static const String backendUrlBase = "http://192.168.31.149:25060";
>>>>>>> da3875cd110fc110f247aeebbd225c1751e09a6a
  static Future<ResponseDto> verify(String username) async {
    ResponseDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/userapi/verify");
    var body = jsonEncode({
      'username': username,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      result = ResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to verify.');
    }
    return result;
  }
}
