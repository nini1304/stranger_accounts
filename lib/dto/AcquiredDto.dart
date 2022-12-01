class AcquiredDto {
  final int serviceId;
  final String platformName;
  final int userId;
  final String profileUsername;
  final String durationLabel;
  final String picture;
  final startDate;
  final expirationDate;
  AcquiredDto(
      {required this.serviceId,
      required this.platformName,
      required this.userId,
      required this.profileUsername,
      required this.durationLabel,
      required this.picture,
      required this.startDate,
      required this.expirationDate});
  factory AcquiredDto.fromJson(Map<String, dynamic> json) {
    return AcquiredDto(
        serviceId: json['serviceId'],
        platformName: json['platformName'],
        userId: json['userId'],
        profileUsername: json['profileUsername'],
        durationLabel: json['durationLabel'],
        picture: json['picture'],
        startDate: json['startDate'],
        expirationDate: json['expirationDate']);
  }
}
