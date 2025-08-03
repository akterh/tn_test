import 'package:flutter/material.dart';
import 'package:tn_test/core/app/app_context.dart';
import 'package:tn_test/features/screens/map/view/map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          GetContext.to(MapViewScreen());
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              Colors.blue.withOpacity(.5), // Optional for OutlinedButton
        ),
        child: Text("Explore Map"),
      ),
    );
  }
}
