class StreamingDto {
  final int serviceId;
  final String platformName;
  final String durationLabel;
  final String picture;

  StreamingDto(
      {required this.serviceId,
      required this.platformName,
      required this.durationLabel,
      required this.picture});

  factory StreamingDto.fromJson(Map<String, dynamic> json) {
    return StreamingDto(
      serviceId: json['serviceId'],
      platformName: json['platformName'],
      durationLabel: json['durationLabel'],
      picture: json['picture'],
    );
  }
}
