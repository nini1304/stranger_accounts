import 'package:equatable/equatable.dart';

import '../dto/StreamingDto.dart';
import 'PageStatus.dart';

class StreamingState extends Equatable {
  final PageStatus status;
  final List<StreamingDto> data;
  final String? errorMessage;

  const StreamingState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  StreamingState copyWith({
    PageStatus? status,
    List<StreamingDto>? data,
    String? errorMessage,
  }) {
    return StreamingState(
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
