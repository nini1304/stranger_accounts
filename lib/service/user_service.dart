import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;
import '../dto/ResponseDto.dart';
import '../dto/user_info_dato.dart';

class UserService {
  static String backendUrlBase = ip.urlBack;
  Future<UserInfoDto> getUserInfo(String token) async {
    UserInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/reapi/");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      // El backend procesó la solicitud entonces decodificamos
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        // Si el backend me envió la información del usuario lo extraemos
        result = UserInfoDto.fromJson(backendResponse.data);
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception(
          "Error desonocido al intentar consultar la información del usuario");
    }
    return result;
  }
}
