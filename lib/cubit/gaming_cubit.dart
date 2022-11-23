import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/gaming_service.dart';
import 'PageStatus.dart';
import 'gaming_state.dart';

class GamingCubit extends Cubit<GamingState> {
  GamingCubit() : super(const GamingState());

  Future<void> gaming() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final result = await GamingService().getGamingList();
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
