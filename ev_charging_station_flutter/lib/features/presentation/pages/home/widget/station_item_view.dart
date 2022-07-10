import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_charging_station_flutter/features/domain/model/station.dart';
import 'package:ev_charging_station_flutter/features/presentation/styles.dart';
import 'package:ev_charging_station_flutter/features/presentation/widget/error_icon.dart';
import 'package:flutter/material.dart';


class StationItemView extends StatelessWidget {
  const StationItemView({Key? key, required this.station, required this.onStationClicked}) : super(key: key);

  final StationModel station;
  final void Function(StationModel) onStationClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onStationClicked(station);
        },
        child: Card(
          elevation: 4,
          shadowColor: Styles.showdownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: Styles.space,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 3,
                        imageUrl: station.thumb,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                        const ErrorIconView(),
                      ),
                    ),
                    SizedBox(width: Styles.space.left),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            station.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.cardTitle,
                          ),
                          SizedBox(height: Styles.spaceS.top),
                          Text(
                            station.address,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.cardSubTitle,
                          ),
                          SizedBox(height: Styles.spaceS.top),
                          const Text(
                            '3.5 Km/50min',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.cardSubTitle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Styles.space.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      station.connection.toString(),
                      style: Styles.cardSubTitle,
                    ),
                    Text(
                      station.speed.toString(),
                      style: Styles.cardSubTitle,
                    ),
                    const Text(
                      '500,00 VND/Kw',
                      style: Styles.cardSubTitle,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
