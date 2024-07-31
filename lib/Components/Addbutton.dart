// import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
// import 'package:estimate_flutter/BLOC/showEstimates/show_estimates_bloc.dart';
// import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Addbutton extends StatelessWidget {
  final String text,currentPage;
  const Addbutton(this.text,this.currentPage,{super.key}); 

  @override
  Widget build(BuildContext context) {
    return DigitButton(
        label: text,
        onPressed: () {
          if(currentPage=="Estimate Details") {
            context.read <PopulateClassBloc>().add(SavingEstimateDetailsFormData());
          }
        },
        type: ButtonType.primary,
      );
  }
}