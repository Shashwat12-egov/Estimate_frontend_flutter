import 'package:digit_flutter_components/widgets/atoms/digit_text_area_form_input.dart';
import 'package:estimate_flutter/mapping.dart';
// import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';

class FormTextArea extends StatelessWidget {
  final String label,helpText,screen;
  const FormTextArea(this.label,this.helpText,this.screen,{super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: DigitTextAreaFormInput(
            label: label,
            controller: TextEditingController(),
            helpText: helpText,
            onChange: (value) {
              dynamic correctfield=nameChange[label];
              if(screen=="Estimate") {
                globalEstimate[correctfield]=value;
              }
              else if(screen=="Address") {
                globalAddress[correctfield]=value;
              }
              else {
                globalEstimateDetails[correctfield]=value;
              }
            },
        )
        ),
      );
  }
}