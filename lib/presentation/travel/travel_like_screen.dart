import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class TravelLikeScreen extends StatelessWidget {
  const TravelLikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('like'),
          ],
        ),
      ),
    );
  }
}
