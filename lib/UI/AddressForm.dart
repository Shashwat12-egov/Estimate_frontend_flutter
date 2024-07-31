import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:estimate_flutter/Components/PrimaryButtons.dart';
import 'package:estimate_flutter/Components/Textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddressformScreen extends StatelessWidget {
  final String heading;
  const AddressformScreen(this.heading,{super.key}); 

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
        body:const SingleChildScrollView(
          child: Column(
            children: [
              FormTextField("Tenant Id","e.g. pb.amritsar","Address"),
              FormTextField("Door Number","e.g. String","Address"),
              FormTextField("Address Line1","e.g. Ejipura","Address"),
              FormTextField("Address Line2", "e.g. Kormangala","Address"),
              FormTextField("City", "e.g. Bangalore","Address"),
          ],
                ),
        ),
      bottomNavigationBar: const Primarybuttons("Estimate Details"),
    );
  }
}