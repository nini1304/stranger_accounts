import 'package:equatable/equatable.dart';
import 'package:stranger_accounts/dto/MenuDto.dart';

import 'PageStatus.dart';

class MenuState extends Equatable {
  final PageStatus status;
  final MenuDto? data;
  final String? errorMessage;

  const MenuState({
    this.status = PageStatus.initial,
    this.data,
    this.errorMessage,
  });

  MenuState copyWith({
    PageStatus? status,
    MenuDto? data,
    String? errorMessage,
  }) {
    return MenuState(
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
