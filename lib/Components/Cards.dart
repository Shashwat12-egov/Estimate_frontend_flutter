// import 'package:auto_route/auto_route.dart';
// import 'package:estimate_flutter/BLOC/showEstimates/show_estimates_bloc.dart';
// import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class Cards extends StatelessWidget {
  final String text;
  const Cards(this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 199, 199, 214),
      child: DigitButton(
          label: text,
          onPressed: () {
            AutoRouter.of(context).push(EstimateFormRoute(heading: "Create Estimate"));
          },
          type: ButtonType.primary,
        ),
      );
  }
}