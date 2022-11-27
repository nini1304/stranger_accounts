class AcquiredDto {
  final int serviceId;
  final int userId;
  final String profileUsername;
  final String durationLabel;
  final startDate;
  final expirationDate;
  AcquiredDto(
      {required this.serviceId,
      required this.userId,
      required this.profileUsername,
      required this.durationLabel,
      required this.startDate,
      required this.expirationDate});
  factory AcquiredDto.fromJson(Map<String, dynamic> json) {
    return AcquiredDto(
        serviceId: json['serviceId'],
        userId: json['userId'],
        profileUsername: json['profileUsername'],
        durationLabel: json['durationLabel'],
        startDate: json['startDate'],
        expirationDate: json['expirationDate']);
  }
}
