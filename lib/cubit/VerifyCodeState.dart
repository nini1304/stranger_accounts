import 'package:equatable/equatable.dart';

import 'PageStatus.dart';

class VerifyCodeState extends Equatable {
  final PageStatus status;
  final bool verifycSuccess;
  final String? errorMessage;
  final Exception? exception;

  const VerifyCodeState({
    this.status = PageStatus.initial,
    this.verifycSuccess = false,
    this.errorMessage,
    this.exception,
  });

  VerifyCodeState copyWith({
    PageStatus? status,
    bool? verifycSuccess,
    String? errorMessage,
    Exception? exception,
  }) {
    return VerifyCodeState(
      status: status ?? this.status,
      verifycSuccess: verifycSuccess ?? this.verifycSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        verifycSuccess,
        errorMessage,
        exception,
      ];
}
