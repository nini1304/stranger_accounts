import 'dart:convert';

import 'package:stranger_accounts/dto/MenuDto.dart';
import 'package:http/http.dart' as http;

import '../dto/ResponseDto.dart';
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;

class MenuService {
  String backendUrlBase = ip.urlBack;
  Future<MenuDto> getUserData(String token) async {
    MenuDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/userapi/");
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
      print(backendResponse.data);
      if (backendResponse.success) {
        print("mensjae: $backendResponse.success");
        // Si el backend me envió la información del usuario lo extraemos
        result = MenuDto.fromJson(backendResponse.data);
        print(result.firstName);
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
