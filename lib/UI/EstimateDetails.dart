import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/Components/Addbutton.dart';
// import 'package:estimate_flutter/Components/Addbutton.dart';
// import 'package:estimate_flutter/Components/Cards.dart';
import 'package:estimate_flutter/Components/PrimaryButtons.dart';
import 'package:estimate_flutter/Components/TextArea.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EstimatedetailsScreen extends StatelessWidget {
  final String heading;
  const EstimatedetailsScreen(this.heading,{super.key}); 

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
          child: Text(heading,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 253, 252, 252)),)),
        ),
        body:BlocBuilder <PopulateClassBloc,PopulateClassState>(
      buildWhen: (previous,current)=> previous.estdcount!=current.estdcount,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const FormTextField("sorId","e.g. 251c51eb-e970-4e01-a99a-70136c47a934","Estimate Details",true),
                const FormTextField("Name","e.g. Estimate Details","Estimate Details",true),
                const FormTextField("Category","e.g. Overhead, SOR, non-SOR","Estimate Details",false),
                const FormTextField("uom", "e.g. Kilogram, meter, number","Estimate Details",false),
                const FormTextArea("Description", "e.g. text","Estimate Details"),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Addbutton("Add", "Estimate Details")
                ),
                Text("Added Estimate Details: ${state.estdcount}")
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: const Primarybuttons("Preview"),
    );
  }
}