// import 'package:estimate_flutter/Components/Cards.dart';
// import 'package:estimate_flutter/Components/TertiaryButtons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:estimate_flutter/Components/PrimaryButtons.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
@RoutePage()
class EstimateFormScreen extends StatefulWidget {
  final String heading;
  const EstimateFormScreen(this.heading,{super.key}); 

  @override
  State<EstimateFormScreen> createState() => _EstimateFormScreenState();
}

class _EstimateFormScreenState extends State<EstimateFormScreen> {
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
        body:const SingleChildScrollView(
            child: Column(
              children: [
                FormTextField("Tenant Id","e.g. pb.amritsar","Estimate",true),
                FormTextField("Revision Number","e.g. EST/2022-23/010-001","Estimate",true),
                FormTextField("Business Service","e.g. ESTIMATE, REVISION-ESTIMATE","Estimate",false),
                FormTextField("Name", "e.g. Construct new schools","Estimate",false),
                FormTextField("Reference Number", "e.g. File-18430283","Estimate",false),
              ],
            ),
          ),
           bottomNavigationBar: const Primarybuttons("Address Details"),
      );
  }
}