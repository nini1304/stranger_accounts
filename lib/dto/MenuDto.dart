class MenuDto {
  final String firstName;
  final String lastName;
  final String profilePicture;

  MenuDto(
      {required this.firstName,
      required this.lastName,
      required this.profilePicture});

  factory MenuDto.fromJson(Map<String, dynamic> json) {
    return MenuDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePicture: json['profilePicture'],
    );
  }
}
