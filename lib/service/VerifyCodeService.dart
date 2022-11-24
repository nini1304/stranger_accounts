import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/ResponseDto.dart';

class VerifyCodeService {
  static const String backendUrlBase = "http://192.168.118.211:25060";
  static Future<ResponseDto> verifyc(String codee) async {
    ResponseDto result;

    var uri = Uri.parse("$backendUrlBase/api/v1/userapi/verifycode");
    var body = jsonEncode({
      'codee': codee,
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
