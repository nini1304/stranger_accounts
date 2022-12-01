import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/cubit/plans_state.dart';
import 'package:stranger_accounts/dto/PlansDto.dart';

import '../service/plans_service.dart';
import 'PageStatus.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(const PlansState());

  Future<void> plans() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final List<PlansDto> result = await PlansService().getPlanList();
      emit(state.copyWith(status: PageStatus.success, data: result));
    } catch (e) {
      emit(state.copyWith(
        status: PageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void changePlansId(value) {
    emit(state.copyWith(status: PageStatus.initial, plansId: value));
  }
}
