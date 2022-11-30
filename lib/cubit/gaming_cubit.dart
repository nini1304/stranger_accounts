import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/gaming_service.dart';
import 'PageStatus.dart';
import 'gaming_state.dart';

class GamingCubit extends Cubit<GamingState> {
  GamingCubit() : super(const GamingState());

  Future<void> gaming() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      final result = await GamingService().getGamingList(token!);
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
