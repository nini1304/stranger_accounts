import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stranger_accounts/service/RestorePassService.dart';

import '../dto/ResponseDto.dart';
import 'PageStatus.dart';
import 'RestorePassState.dart';

class RestorePassCubit extends Cubit<RestorePassState> {
  RestorePassCubit() : super(RestorePassState());
  Future<void> restorepass(String password) async {
    //para mantener la data segura
    final storage = FlutterSecureStorage();
    // Le digo al frontend que estamos iniciando el proceso de registro para eso usamos el estado loading de PageStatus
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // Aquí iría la llamada a la API para hacer el registro
      ResponseDto response = await RestorePassService.restorepass(password);

      //emitimos el estado del cubit a los widgets
      emit(state.copyWith(
        restorepassSuccess: true,
        status: PageStatus.success,
      ));
    } on Exception catch (ex) {
      emit(state.copyWith(
          restorepassSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}
