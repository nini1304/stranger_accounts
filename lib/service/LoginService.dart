// ignore: file_names
import 'dart:convert';
import '../dto/LoginResponseDto.dart';
import 'package:http/http.dart' as http;
import '../dto/ResponseDto.dart';

class LoginService {
  static const String backendUrlBase = "http://192.168.0.145:25060";
  //Creamos el future para que nos devuelva un LoginResponseDto
  static Future<LoginResponseDto> login(
      String username, String password) async {
    // guardaremos la respuesta en la variable result
    LoginResponseDto result;
    //guardamos en variables lo necesario para hacer el post
    var uri = Uri.parse("$backendUrlBase/api/v1/loapi");
    var body = jsonEncode({
      'username': username,
      'password': password,
    });
    // Como es Java es obligatorio mandar Content-Type y Accept
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    // Realizamos la invocación por post al Backend con los datos proporcionados.
    var response = await http.post(uri, headers: headers, body: body);
    // Preguto si el backend dió exitosa la solicitud
    if (response.statusCode == 200) {
      // 200 significa que el backend proceso la solicitud.
      // Decodifficamos el JSON a un objecto responseDto y guardamos todo el cuerpo  del ResponseDto
      var responseDto = ResponseDto.fromJson(jsonDecode(response.body));
      // Preguto si el backend autentico al usuario
      if (responseDto.success) {
        // Decodifcamos el data del objecto Response del backend y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = LoginResponseDto.fromJson(responseDto.data);
      } else {
        // Si el backend envíe error (success = true), entonces seguramente
        // envió un message para mostrarle a nuestra usuario final
        throw Exception(responseDto.message);
      }
    } else {
      throw Exception('Failed to login.');
    }
    return result;
  }
}
