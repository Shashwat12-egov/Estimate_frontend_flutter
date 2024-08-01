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
      )
    });
  }

   void _onFormSubmit() {
    final blocdata=context.read <PopulateClassBloc>();
    final estimateDetailscount=blocdata.state.estimateData.estimateDetails?.length;

    if(estimateDetailscount==0) {
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
      AutoRouter.of(context).push(PreviewRoute(heading: "Preview"));
    }
  }

  void _onAdd() {
    if (form.valid) {
      // Access the value from the form
      final String sorId= form.control('sorId').value;
      final String category= form.control('Category').value;
      final String name= form.control('Name').value;
      final String uom= form.control('uom').value;

      globalEstimateDetails["sorId"]=sorId;
      globalEstimateDetails["name"]=name;
      globalEstimateDetails["category"]=category;
      globalEstimateDetails["uom"]=uom;

      context.read <PopulateClassBloc>().add(EstimateDetailsCount());
      context.read <PopulateClassBloc>().add(SavingEstimateDetailsFormData());
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
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: DigitButton(
                        onPressed: _onAdd,
                        label: 'Add',
                        type: ButtonType.primary,
                      )
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