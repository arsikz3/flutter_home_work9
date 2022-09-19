// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) => HotelInfo(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      address: json['address'] as Map<String, dynamic>,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      services: json['services'] as Map<String, dynamic>,
      photos: json['photos'] as List<dynamic>,
    );

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };
