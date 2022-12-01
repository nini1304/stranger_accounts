class AcquiredDto {
  final int serviceId;
  final String serviceName;
  final int userId;
  final String profileUsername;
  final String durationLabel;
  final String picture;
  final startDate;
  final expirationDate;
  AcquiredDto(
      {required this.serviceId,
      required this.serviceName,
      required this.userId,
      required this.profileUsername,
      required this.durationLabel,
      required this.picture,
      required this.startDate,
      required this.expirationDate});
  factory AcquiredDto.fromJson(Map<String, dynamic> json) {
    return AcquiredDto(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
        userId: json['userId'],
        profileUsername: json['profileUsername'],
        durationLabel: json['durationLabel'],
        picture: json['picture'],
        startDate: json['startDate'],
        expirationDate: json['expirationDate']);
  }
}
