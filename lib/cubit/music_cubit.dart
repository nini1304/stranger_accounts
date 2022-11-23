import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/music_service.dart';
import 'PageStatus.dart';
import 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(const MusicState());

  Future<void> music() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final result = await MusicService().getMusicList();
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
