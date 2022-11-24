import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/ResponseDto.dart';
import '../service/VerifyUserService.dart';
import 'PageStatus.dart';
import 'VerifyUserState.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  VerifyUserCubit() : super(VerifyUserState());
  Future<void> verify(String username) async {
    //para mantener la data segura
    final storage = FlutterSecureStorage();
    // Le digo al frontend que estamos iniciando el proceso de registro para eso usamos el estado loading de PageStatus
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // Aquí iría la llamada a la API para hacer el registro
      ResponseDto response = await VerifyUserService.verify(username);
      //emitimos el estado del cubit a los widgets
      emit(state.copyWith(
        verifyuSuccess: true,
        status: PageStatus.success,
      ));
    } on Exception catch (ex) {
      emit(state.copyWith(
          verifyuSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}
