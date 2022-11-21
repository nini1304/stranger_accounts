class UserInfoDto {
  final String firstName;
  final String lastName;
  final String email;

  UserInfoDto(
      {required this.firstName, required this.lastName, required this.email});

  factory UserInfoDto.fromJson(Map<String, dynamic> json) {
    return UserInfoDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}
