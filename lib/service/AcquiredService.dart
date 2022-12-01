import 'package:stranger_accounts/dto/AcquiredDto.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AcquiredService {
  static const String _url = 'http://192.168.0.145:25060';
  Future<List<AcquiredDto>> getAcquiredList() async {
    List<AcquiredDto> result;
    var uri = Uri.parse("$_url/api/v1/acquired/23");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
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
            .map((e) => AcquiredDto.fromJson(e))
            .toList();
        print("2: $result");
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
}
