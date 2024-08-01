import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormTextField extends StatelessWidget {
  final String label,helpText;
  const FormTextField(this.label,this.helpText,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ReactiveTextField<String>(
              formControlName: label,
              decoration: InputDecoration(
                labelText: label,
                helperText: helpText,
                border: const OutlineInputBorder(),
              ),
              validationMessages: {
                ValidationMessage.required: (error) => 'This field is required',
              },
            ),
          ),
      ),
      ],
    );
  }
}