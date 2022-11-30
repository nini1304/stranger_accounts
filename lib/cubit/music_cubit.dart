import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/music_service.dart';
import 'PageStatus.dart';
import 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(const MusicState());

  Future<void> music() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      final result = await MusicService().getMusicList(token!);
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
