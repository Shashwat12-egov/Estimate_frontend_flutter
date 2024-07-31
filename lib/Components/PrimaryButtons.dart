import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Primarybuttons extends StatelessWidget {
  final String toPage;
  const Primarybuttons(this.toPage,{super.key}); 

  @override
  Widget build(BuildContext context) {
    return DigitButton(
        label: 'Next',
        onPressed: () {
          if(toPage=="Address Details") {
            if(globalEstimate["tenantId"]=="" || globalEstimate["revisionNumber"]=="") {
              context.read <PopulateClassBloc>().add(IsValiddata());
            }
            else {
              context.read <PopulateClassBloc>().add(SavingEstimateFormData());
              AutoRouter.of(context).push(AddressformRoute(heading: toPage));
            }
          }
          if(toPage=="Estimate Details") {
            context.read <PopulateClassBloc>().add(SavingAddressFormData());
            AutoRouter.of(context).push(EstimatedetailsRoute(heading: toPage));
          }
          if(toPage=="Preview") {
            AutoRouter.of(context).push(PreviewRoute(heading: toPage));
          }
        },
        type: ButtonType.primary,
      );
  }
}