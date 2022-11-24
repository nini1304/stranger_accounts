import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../dto/PlansDto.dart';

class PlansService {
  static const String backendUrlBase = "http://192.168.31.149:25060";

  Future<List<PlansDto>> getPlanList() async {
    List<PlansDto> result;
    var uri = Uri.parse("$backendUrlBase/api/v1/plans/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'Bearer $token'
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("hola1:$response.body");
      // El backend procesó la solicitud entonces decodificamos
      var backendResponse = jsonDecode(response.body);
      // Si el backend me envió la información de los servicios de streaming lo extraemos
      if (backendResponse['success']) {
        // Decodificamos el data del objecto Response del backend y lo covertimos
        // a una clase Dart para retornarselo al CUBIT
        result = (backendResponse['data'] as List)
            .map((e) => PlansDto.fromJson(e))
            .toList();
        print("hola2:$result");
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
