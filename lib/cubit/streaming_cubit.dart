import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/cubit/streaming_state.dart';
import 'package:stranger_accounts/service/streaming_service.dart';

import 'PageStatus.dart';

class StreamingCubit extends Cubit<StreamingState> {
  StreamingCubit() : super(const StreamingState());

  Future<void> streaming() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final result = await StreamingService().getStreamingList();
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
