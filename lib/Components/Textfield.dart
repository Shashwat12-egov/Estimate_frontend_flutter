import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
// import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class FormTextField extends StatelessWidget {
  final String label,helpText,screen;
  const FormTextField(this.label,this.helpText,this.screen,{super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: DigitTextFormInput(
            label: label,
            controller: TextEditingController(),
            helpText: helpText,
            charCount: true,
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
        ),
      ),
    );
  }
}