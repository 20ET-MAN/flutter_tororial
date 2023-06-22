import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class TravelMessageScreen extends StatelessWidget {
  const TravelMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('message'),
          ],
        ),
      ),
    );
  }
}
