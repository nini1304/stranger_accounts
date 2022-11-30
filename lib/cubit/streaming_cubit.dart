import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stranger_accounts/cubit/streaming_state.dart';
import 'package:stranger_accounts/service/streaming_service.dart';

import 'PageStatus.dart';

class StreamingCubit extends Cubit<StreamingState> {
  StreamingCubit() : super(const StreamingState());

  Future<void> streaming() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      final result = await StreamingService().getStreamingList(token!);
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
