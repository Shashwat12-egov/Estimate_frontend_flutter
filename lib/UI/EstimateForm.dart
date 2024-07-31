// import 'package:estimate_flutter/Components/Cards.dart';
// import 'package:estimate_flutter/Components/TertiaryButtons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Components/PrimaryButtons.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';


// ignore: must_be_immutable
@RoutePage()
class EstimateFormScreen extends StatefulWidget {
  final String heading;
  const EstimateFormScreen(this.heading,{super.key}); 

  @override
  State<EstimateFormScreen> createState() => _EstimateFormScreenState();
}

class _EstimateFormScreenState extends State<EstimateFormScreen> {
  late FormGroup form;
  List <String> fields=["Tenant Id","Revision Number","Business Service","Name","Reference Number"];

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'Tenant Id': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Revision Number': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Name': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'Reference Number': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'Business Service': FormControl<String>(
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
      final String revisionNumber= form.control('Revision Number').value;
      final String name= form.control('Name').value;
      final String referenceNumber= form.control('Reference Number').value;
      final String businessService= form.control('Business Service').value;

      globalEstimate["tenantId"]=tenantId;
      globalEstimate["revisionNumber"]=revisionNumber;
      globalEstimate["name"]=name;
      globalEstimate["referenceNumber"]=referenceNumber;
      globalEstimate["businessService"]=businessService;

      print(globalEstimate);
    context.read <PopulateClassBloc>().add(SavingEstimateFormData());
    AutoRouter.of(context).push(AddressformRoute(heading: "Address Details"));
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
          child:ReactiveForm(
          formGroup: form,
          child: const Column(
            children: [
                FormTextField("Tenant Id","e.g. pb.amritsar"),
                FormTextField("Revision Number","e.g. EST/2022-23/010-001"),
                FormTextField("Business Service","e.g. ESTIMATE, REVISION-ESTIMATE"),
                FormTextField("Name", "e.g. Construct new schools"),
                FormTextField("Reference Number", "e.g. File-18430283"),
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