import 'dart:convert';

import '../dto/StreamingDto.dart';
import 'package:stranger_accounts/service/serviceip/ip.dart' as ip;
import 'package:http/http.dart' as http;

class StreamingService {
  static String backendUrlBase = ip.urlBack;
  Future<List<StreamingDto>> getStreamingList(String token) async {
    List<StreamingDto> result;
    var uri = Uri.parse("$backendUrlBase/api/v1/streaming/");
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
            .map((e) => StreamingDto.fromJson(e))
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
          "Error desonocido al intentar obtener los servicios de streaming");
    }
    return result;
  }
  //PENDIENTE: Token de autorización
}
