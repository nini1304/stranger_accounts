import 'package:equatable/equatable.dart';

import 'PageStatus.dart';

class VerifyUserState extends Equatable {
  final PageStatus status;
  final bool verifyuSuccess;
  final String? errorMessage;
  final Exception? exception;

  const VerifyUserState({
    this.status = PageStatus.initial,
    this.verifyuSuccess = false,
    this.errorMessage,
    this.exception,
  });

  VerifyUserState copyWith({
    PageStatus? status,
    bool? verifyuSuccess,
    String? errorMessage,
    Exception? exception,
  }) {
    return VerifyUserState(
      status: status ?? this.status,
      verifyuSuccess: verifyuSuccess ?? this.verifyuSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        verifyuSuccess,
        errorMessage,
        exception,
      ];
}
