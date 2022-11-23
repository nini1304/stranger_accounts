class GamingDto {
  final int serviceId;
  final String platformName;
  final String durationLabel;
  final String picture;

  GamingDto(
      {required this.serviceId,
      required this.platformName,
      required this.durationLabel,
      required this.picture});

  factory GamingDto.fromJson(Map<String, dynamic> json) {
    return GamingDto(
      serviceId: json['serviceId'],
      platformName: json['platformName'],
      durationLabel: json['durationLabel'],
      picture: json['picture'],
    );
  }
}
