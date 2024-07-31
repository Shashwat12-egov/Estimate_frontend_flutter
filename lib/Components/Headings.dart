import 'package:flutter/material.dart';

class Headings extends StatelessWidget {
  final String heading;

  const Headings(this.heading,{super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(heading),
    );
  }
}