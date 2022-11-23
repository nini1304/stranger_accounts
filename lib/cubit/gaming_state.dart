import 'package:equatable/equatable.dart';

import '../dto/GamingDto.dart';
import 'PageStatus.dart';

class GamingState extends Equatable {
  final PageStatus status;
  final List<GamingDto> data;
  final String? errorMessage;

  const GamingState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  GamingState copyWith({
    PageStatus? status,
    List<GamingDto>? data,
    String? errorMessage,
  }) {
    return GamingState(
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
