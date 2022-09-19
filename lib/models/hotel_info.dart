import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInfo {
  final String uuid;
  final String name;
  final String poster;
  final Map<String, dynamic> address;
  final double price;
  final double rating;
  final Map<String, dynamic> services;
  final List<dynamic> photos;

  HotelInfo(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.price,
      required this.rating,
      required this.services,
      required this.photos});

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}
