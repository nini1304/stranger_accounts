import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/ResponseDto.dart';
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;

class VerifyUserService {
<<<<<<< HEAD
  static const String backendUrlBase = "http://192.168.1.216:25060";
=======
  static String backendUrlBase = ip.urlBack;
>>>>>>> 6d5e0fd70efc1c16a6746f409ec579d63f389c0f
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
