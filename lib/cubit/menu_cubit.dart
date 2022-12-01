import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/menu_service.dart';
import 'PageStatus.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState());

  Future<void> menu() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      final result = await MenuService().getUserData(token!);
      emit(state.copyWith(status: PageStatus.success, data: result));
      print(state.data!.profilePicture);
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
