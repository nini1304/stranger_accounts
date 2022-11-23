import 'package:equatable/equatable.dart';

import '../dto/MusicDto.dart';
import 'PageStatus.dart';

class MusicState extends Equatable {
  final PageStatus status;
  final List<MusicDto> data;
  final String? errorMessage;

  const MusicState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  MusicState copyWith({
    PageStatus? status,
    List<MusicDto>? data,
    String? errorMessage,
  }) {
    return MusicState(
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
