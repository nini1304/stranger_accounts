import 'package:equatable/equatable.dart';

import 'PageStatus.dart';

class RegisterState extends Equatable {
  final PageStatus status;
  final bool registerSuccess;
  final String? errorMessage;
  final Exception? exception;


  const RegisterState({
    this.status = PageStatus.initial,
    this.registerSuccess = false,
    this.errorMessage,
    this.exception,

  });

  RegisterState copyWith({
    PageStatus? status,
    bool? loginSuccess,
    String? errorMessage,
    Exception? exception,

  }) {
    return RegisterState(
      status: status ?? this.status,
      registerSuccess: loginSuccess ?? this.registerSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,

    );
  }
  @override
  List<Object?> get props => [
    status,
    registerSuccess,
    errorMessage,
    exception,

  ];
}