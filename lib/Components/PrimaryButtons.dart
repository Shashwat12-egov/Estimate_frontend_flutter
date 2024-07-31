import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
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
          final blocdata=context.read <PopulateClassBloc>();
          final estimateDetailscount=blocdata.state.estimateData.estimateDetails?.length;
          if(toPage=="Address Details") {
            if(globalEstimate["tenantId"]=="" || globalEstimate["revisionNumber"]=="") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Fill the required details (Tenant Id and Revision Number)'),
                  duration: Duration(
                      seconds:
                          2), // The duration for which the snackbar is displayed
                ),
              );
            }
            else {
              context.read <PopulateClassBloc>().add(SavingEstimateFormData());
              AutoRouter.of(context).push(AddressformRoute(heading: toPage));
            }
          }
          if(toPage=="Estimate Details") {
            if(globalAddress["tenantId"]=="" || globalAddress["doorNo"]=="") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Fill the required details (Tenant Id and Door Number)'),
                  duration: Duration(
                      seconds:
                          2), // The duration for which the snackbar is displayed
                ),
              );
            }
            else {
              context.read <PopulateClassBloc>().add(SavingAddressFormData());
              AutoRouter.of(context).push(EstimatedetailsRoute(heading: toPage));
            }
          }
          if(toPage=="Preview") {
            if(globalEstimateDetails["sorId"]=="" || globalEstimateDetails["name"]=="") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Fill the required details (sorId and Name)'),
                  duration: Duration(
                      seconds:
                          2), // The duration for which the snackbar is displayed
                ),
              );
            }
            else if(estimateDetailscount==0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Click on Add button to add details'),
                  duration: Duration(
                      seconds:
                          2), // The duration for which the snackbar is displayed
                ),
              );
            }
            else {
              AutoRouter.of(context).push(PreviewRoute(heading: toPage));
            }
          }
        },
        type: ButtonType.primary,
      );
  }
}