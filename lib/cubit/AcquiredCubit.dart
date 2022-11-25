import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/cubit/AcquiredState.dart';
import 'package:stranger_accounts/service/AcquiredService.dart';

import 'PageStatus.dart';

class AcquiredCubit extends Cubit<AcquiredState> {
  AcquiredCubit() : super(const AcquiredState());

  Future<void> acquired() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final result = await AcquiredService().getAcquiredList();
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
