import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/PlansDto.dart';
import 'package:get/get.dart';
import 'package:stranger_accounts/ui/widget/getId.dart';

class PlansService {
  Controller controller = Get.put(Controller());
<<<<<<< HEAD
  static const String backendUrlBase = "http://192.168.0.145:25060";
=======
  static const String backendUrlBase = "http://192.168.31.149:25060";
>>>>>>> da3875cd110fc110f247aeebbd225c1751e09a6a

  Future<List<PlansDto>> getPlanList() async {
    List<PlansDto> result;
    var uri =
        Uri.parse("$backendUrlBase/api/v1/plans/${controller.servicesId}");
    print("efe: ${controller.servicesId}");
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
      // Si el backend me envió la información de los servicios de streaming lo extraemos
      if (backendResponse['success']) {
        // Decodificamos el data del objecto Response del backend y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = (backendResponse['data'] as List)
            .map((e) => PlansDto.fromJson(e))
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
