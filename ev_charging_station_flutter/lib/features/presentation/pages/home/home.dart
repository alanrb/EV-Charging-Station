import 'package:ev_charging_station_flutter/features/domain/model/station.dart';
import 'package:ev_charging_station_flutter/features/presentation/pages/home/widget/station_item_view.dart';
import 'package:ev_charging_station_flutter/features/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MethodChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('multiple-flutters');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setData") {
      } else if (call.method == "station_show_details") {
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Styles.spaceM.top,
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2),
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  return StationItemView(
                    station: StationModel.empty,
                    onStationClicked: (station) {
                      _channel.invokeMethod<void>(
                          "station_show_details", station.toJson());
                    },
                  );
                }, childCount: 10),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    SizedBox(
                      height: Styles.spaceM.top,
                    ),
                    SizedBox(
                      height: Styles.spaceM.top,
                    )
                  ]))
            ],
          ),
        )
      ),
    );
  }
}
