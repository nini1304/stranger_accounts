import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/ItemDto.dart';

class ItemService {
  static const String backendUrlBase = "http://192.168.31.149:25060";
  Future<List<ItemDto>> getItemList() async {
    List<ItemDto> result;
    var uri = Uri.parse("$backendUrlBase/api/v1/item/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'Bearer $token'
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      // El backend procesó la solicitud entonces decodificamos
      var backendResponse = jsonDecode(response.body);
      // Si el backend me envió la información de los items lo extraemos
      if (backendResponse['success']) {
        print("cmsss:$backendResponse['data']");
        // Decodificamos el data del objecto Response del backend en una lista y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = (backendResponse['data'] as List)
            .map((e) => ItemDto.fromJson(e))
            .toList();
        print("1: $result");
      } else {
        // Si el backend envíe error (success = true), entonces seguramente
        // envió un message para mostrarle a nuestra usuario final
        throw Exception(backendResponse['message']);
      }
    }
    //en caso de error lanza una excepcion
    else {
      throw Exception(
          "Error desonocido al intentar obtener los datos de los items");
    }
    return result;
  }
  //PENDIENTE: Token de autorización
}
