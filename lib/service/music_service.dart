import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/MusicDto.dart';
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;

class MusicService {
  static String backendUrlBase = ip.urlBack;
  Future<List<MusicDto>> getMusicList(String token) async {
    List<MusicDto> result;
    var uri = Uri.parse("$backendUrlBase/api/v1/music/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      // El backend procesó la solicitud entonces decodificamos
      var backendResponse = jsonDecode(response.body);
      // Si el backend me envió la información de los servicios de streaming lo extraemos
      if (backendResponse['success']) {
        // Decodificamos el data del objecto Response del backend y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = (backendResponse['data'] as List)
            .map((e) => MusicDto.fromJson(e))
            .toList();
      } else {
        // Si el backend envíe error (success = true), entonces seguramente
        // envió un message para mostrarle a nuestra usuario final
        throw Exception(backendResponse['message']);
      }
    }
    //en caso de error lanza una excepcion
    else {
      throw Exception(
          "Error desonocido al intentar obtener los servicios de music");
    }
    return result;
  }
  //PENDIENTE: Token de autorización
}
