import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class AddressformScreen extends StatefulWidget {
  final String heading;
  const AddressformScreen(this.heading,{super.key}); 

  @override
  State<AddressformScreen> createState() => _AddressformScreenState();
}

class _AddressformScreenState extends State<AddressformScreen> {
  late FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'Tenant Id': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Door Number': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Address Line2': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'Address Line1': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'City': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
    });
  }

  void _onFormSubmit() {
    if (form.valid) {
      // Access the value from the form
      final String tenantId= form.control('Tenant Id').value;
      final String revisionNumber= form.control('Door Number').value;
      final String name= form.control('Address Line1').value;
      final String referenceNumber= form.control('Address Line2').value;
      final String businessService= form.control('City').value;

      globalAddress["tenantId"]=tenantId;
      globalAddress["doorNo"]=revisionNumber;
      globalAddress["addressLine1"]=name;
      globalAddress["addressLine2"]=referenceNumber;
      globalAddress["city"]=businessService;

    context.read <PopulateClassBloc>().add(SavingAddressFormData());
    AutoRouter.of(context).push(EstimatedetailsRoute(heading: "Estimate Details"));
    } else {
      form.markAllAsTouched();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: DigitTheme.instance.colorScheme.secondary,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 254, 252, 252), // Change your color here
          ),
          title: Center(
          child: Text(widget.heading,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 253, 252, 252)),)),
        ),
        body:SingleChildScrollView(
          child: ReactiveForm(
            formGroup: form,
            child: const Column(
              children: [
                FormTextField("Tenant Id","e.g. pb.amritsar"),
                FormTextField("Door Number","e.g. String"),
                FormTextField("Address Line1","e.g. Ejipura"),
                FormTextField("Address Line2", "e.g. Kormangala"),
                FormTextField("City", "e.g. Bangalore"),
              ],
            ),
          ),
        ),
       bottomNavigationBar:   DigitButton(
          onPressed: _onFormSubmit,
          label: 'Next',
          type: ButtonType.primary,
        )
    );
  }
}