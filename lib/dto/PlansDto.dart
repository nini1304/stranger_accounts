class PlansDto {
  final int plansId;
  final int days;
  final double price;
  final String durationLabel;
  final int serviceId;

  PlansDto(
      {required this.plansId,
      required this.days,
      required this.price,
      required this.durationLabel,
      required this.serviceId});

  factory PlansDto.fromJson(Map<String, dynamic> json) {
    return PlansDto(
        plansId: json['plansId'],
        days: json['days'],
        price: json['price'],
        durationLabel: json['durationLabel'],
        serviceId: json['serviceId']);
  }
}
