import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:estimate_flutter/Components/Cards.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: DigitTheme.instance.colorScheme.secondary,
            title: const Center(
            child: Text('Estimates',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 253, 252, 252)),)),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Cards("Create Estimates"),
                SizedBox(
                  height: 50,
                ),
                Cards("Search Estimates")
              ],
            ),
          )
      );
  }
}
