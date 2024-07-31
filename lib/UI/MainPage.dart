import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  height: 100,
                  child: DigitButton(
                    label: "Create Estimates",
                    onPressed: () {
                      AutoRouter.of(context).push(EstimateFormRoute(heading: "Create Estimate"));
                    },
                    type: ButtonType.primary,
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 50),
                  child: DigitButton(
                    label: "Search Estimates",
                    onPressed: () {
                      
                    },
                    type: ButtonType.primary,
                  ),
                ),
              ],
            ),
          )
      );
  }
}
