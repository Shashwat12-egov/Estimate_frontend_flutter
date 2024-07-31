import 'package:estimate_flutter/Components/Cards.dart';
import 'package:flutter/material.dart';

class MinimizedView extends StatelessWidget {
  const MinimizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Cards("Create Estimates"),
      ],
    );
  }
}
  