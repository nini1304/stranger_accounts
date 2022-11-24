import 'package:equatable/equatable.dart';

import 'PageStatus.dart';

class RestorePassState extends Equatable {
  final PageStatus status;
  final bool restorepassSuccess;
  final String? errorMessage;
  final Exception? exception;

  const RestorePassState({
    this.status = PageStatus.initial,
    this.restorepassSuccess = false,
    this.errorMessage,
    this.exception,
  });

  RestorePassState copyWith({
    PageStatus? status,
    bool? restorepassSuccess,
    String? errorMessage,
    Exception? exception,
  }) {
    return RestorePassState(
      status: status ?? this.status,
      restorepassSuccess: restorepassSuccess ?? this.restorepassSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        restorepassSuccess,
        errorMessage,
        exception,
      ];
}
