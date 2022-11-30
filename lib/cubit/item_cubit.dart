import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/item_service.dart';
import 'PageStatus.dart';
import 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(const ItemState());

  Future<void> item() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      final result = await ItemService().getItemList(token!);
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
