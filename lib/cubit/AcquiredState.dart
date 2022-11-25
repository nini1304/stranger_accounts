import 'package:stranger_accounts/cubit/streaming_state.dart';

import 'PageStatus.dart';
import 'package:equatable/equatable.dart';

import '../dto/AcquiredDto.dart';

class AcquiredState extends Equatable {
  final PageStatus status;
  final List<AcquiredDto> data;
  final String? errorMessage;

  const AcquiredState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  AcquiredState copyWith({
    PageStatus? status,
    List<AcquiredDto>? data,
    String? errorMessage,
  }) {
    return AcquiredState(
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
