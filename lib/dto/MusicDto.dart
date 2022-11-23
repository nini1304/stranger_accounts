class MusicDto {
  final int serviceId;
  final String platformName;
  final String durationLabel;
  final String picture;

  MusicDto(
      {required this.serviceId,
      required this.platformName,
      required this.durationLabel,
      required this.picture});

  factory MusicDto.fromJson(Map<String, dynamic> json) {
    return MusicDto(
      serviceId: json['serviceId'],
      platformName: json['platformName'],
      durationLabel: json['durationLabel'],
      picture: json['picture'],
    );
  }
}
