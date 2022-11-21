import 'package:equatable/equatable.dart';

import '../dto/user_info_dato.dart';
import 'PageStatus.dart';

class HomePageState extends Equatable {
  // Necesitamos informar al Widget en que estado estamos
  final PageStatus status;
  // Necesitamos enviar los datos que recibimos del service
  final UserInfoDto? userInfoDto;
  // Error Message en caso de error.
  final String? errorMessage;

  const HomePageState(
      {this.status = PageStatus.initial, this.userInfoDto, this.errorMessage});

  @override
  List<Object?> get props => [status, userInfoDto, errorMessage];

  HomePageState copyWith(
      {PageStatus? status, UserInfoDto? userInfoDto, String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
        userInfoDto: userInfoDto ?? this.userInfoDto,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
