import 'package:equatable/equatable.dart';

import '../dto/PlansDto.dart';
import 'PageStatus.dart';

class PlansState extends Equatable {
  final PageStatus status;
  final List<PlansDto> data;
  final String? errorMessage;

  const PlansState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  PlansState copyWith({
    PageStatus? status,
    List<PlansDto>? data,
    String? errorMessage,
  }) {
    return PlansState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        errorMessage,
      ];
}
