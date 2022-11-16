import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/LoginResponseDto.dart';
import '../service/LoginService.dart';
import 'LoginState.dart';
import 'PageStatus.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    //para mantener la data segura
    final storage = FlutterSecureStorage();
    // Le digo al frontend que estamos iniciando el proceso de login para eso usamos el estado loading de PageStatus
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // Aquí iría la llamada a la API para hacer el login
      // Si el login es exitoso, guardamos el token en el storage
      LoginResponseDto response = await LoginService.login(username, password);
      // Si la autenticación fue exitosa Guardar el token y refresh
      await storage.write(key: "TOKEN", value: response.token);
      await storage.write(key: "REFRESH", value: response.refresh);
      //emitimos el estado del cubit a los widgets
      emit(state.copyWith(
          loginSuccess: true,
          status: PageStatus.success,
          token: response.token,
          refreshToken: response.refresh));
      //en caso de haber un error se emite igualmente el estado correspondiente a los widgets
    } on Exception catch (ex) {
      emit(state.copyWith(
          loginSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}
