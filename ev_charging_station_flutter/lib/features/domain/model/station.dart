import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'station.g.dart';

@JsonSerializable()
class StationModel extends Equatable {
  static const empty = StationModel(
      id: -1,
      title: "Electric Vehicle Charging Station",
      thumb: "https://storage.googleapis.com/f1-cms/2021/06/152fc08c-20210602_090454.jpg",
      address:
          "15 Đường 3/2, Phường 11, Quận 10, Thành phố Hồ Chí Minh, Vietnam",
      connection: 7,
      lat: 10.7910177,
      long: 106.6423981,
      speed: "10Kw/h");

  factory StationModel.fromJson(Map<String, dynamic> json) =>
      _$StationModelFromJson(json);

  /// Connect the generated [_$StationModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StationModelToJson(this);

  const StationModel(
      {required this.id,
      required this.thumb,
      required this.title,
      required this.address,
      required this.connection,
      required this.speed,
      required this.long,
      required this.lat});

  final int id;
  final String thumb;
  final String title;
  final double long;
  final double lat;
  final String address;
  final int connection;
  final String speed;

  @override
  List<Object?> get props =>
      [id, thumb, title, long, lat, address, connection, speed];
}
