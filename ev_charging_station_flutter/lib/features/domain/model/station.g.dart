// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationModel _$StationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StationModel',
      json,
      ($checkedConvert) {
        final val = StationModel(
          id: $checkedConvert('id', (v) => v as int),
          thumb: $checkedConvert('thumb', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          address: $checkedConvert('address', (v) => v as String),
          connection: $checkedConvert('connection', (v) => v as int),
          speed: $checkedConvert('speed', (v) => v as String),
          long: $checkedConvert('long', (v) => (v as num).toDouble()),
          lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$StationModelToJson(StationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumb': instance.thumb,
      'title': instance.title,
      'long': instance.long,
      'lat': instance.lat,
      'address': instance.address,
      'connection': instance.connection,
      'speed': instance.speed,
    };
