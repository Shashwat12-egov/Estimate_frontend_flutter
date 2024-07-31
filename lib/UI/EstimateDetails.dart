import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Components/Addbutton.dart';
// import 'package:estimate_flutter/Components/Addbutton.dart';
// import 'package:estimate_flutter/Components/Cards.dart';
import 'package:estimate_flutter/Components/PrimaryButtons.dart';
import 'package:estimate_flutter/Components/TextArea.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class EstimatedetailsScreen extends StatefulWidget {
  final String heading;
  const EstimatedetailsScreen(this.heading,{super.key}); 

  @override
  State<EstimatedetailsScreen> createState() => _EstimatedetailsScreenState();
}

class _EstimatedetailsScreenState extends State<EstimatedetailsScreen> {
  late FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'sorId': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Name': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: true ? [Validators.required] : [],
      ),
      'Category': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'uom': FormControl<String>(
        value: '', // Initial value
        // ignore: dead_code
        validators: false ? [Validators.required] : [],
      ),
      'Description': FormControl<String>(
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

      print(globalAddress);
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
        body:BlocBuilder <PopulateClassBloc,PopulateClassState>(
      buildWhen: (previous,current)=> previous.estdcount!=current.estdcount,
        builder: (context, state) {
          return SingleChildScrollView(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                children: [
                  const FormTextField("sorId","e.g. 251c51eb-e970-4e01-a99a-70136c47a934"),
                  const FormTextField("Name","e.g. Estimate Details"),
                  const FormTextField("Category","e.g. Overhead, SOR, non-SOR"),
                  const FormTextField("uom", "e.g. Kilogram, meter, number"),
                  const FormTextArea("Description", "e.g. text","Estimate Details"),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Addbutton("Add", "Estimate Details")
                  ),
                  Text("Added Estimate Details: ${state.estdcount}")
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar:   DigitButton(
          onPressed: _onFormSubmit,
          label: 'Next',
          type: ButtonType.primary,
        )
    );
  }
}