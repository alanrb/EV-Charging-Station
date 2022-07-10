import 'package:ev_charging_station_flutter/features/presentation/styles.dart';
import 'package:flutter/material.dart';

class ErrorIconView extends StatelessWidget {
  const ErrorIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.broken_image_outlined, color: Styles.colorAccent);
  }
}