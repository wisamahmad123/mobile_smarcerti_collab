//  widgets/analytics_container.dart
import 'package:flutter/material.dart';

class AnalyticsContainer extends StatelessWidget {
  const AnalyticsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: const Image(
        image: AssetImage('assets/images/static.png'),
      ),
    );
  }
}
