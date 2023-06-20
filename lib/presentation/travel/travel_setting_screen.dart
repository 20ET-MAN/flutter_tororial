import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TravelSettingScreen extends StatelessWidget {
  const TravelSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('setting'),
    );
  }
}
