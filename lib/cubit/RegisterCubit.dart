import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/ResponseDto.dart';
import '../service/RegisterService.dart';
import 'PageStatus.dart';
import 'RegisterState.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  Future<void> register(String picture, String name, String lastname,
      String username, String password, String phone) async {
    //para mantener la data segura
    final storage = FlutterSecureStorage();
    // Le digo al frontend que estamos iniciando el proceso de registro para eso usamos el estado loading de PageStatus
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // Aquí iría la llamada a la API para hacer el registro
      ResponseDto response = await RegisterService.register(
          picture, name, lastname, username, password, phone);
      //emitimos el estado del cubit a los widgets
      emit(state.copyWith(
        registerSuccess: true,
        status: PageStatus.success,
      ));
    } on Exception catch (ex) {
      emit(state.copyWith(
          registerSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}
