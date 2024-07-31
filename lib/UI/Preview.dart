import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:estimate_flutter/mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PreviewScreen extends StatefulWidget {
  final String heading;
  const PreviewScreen(this.heading,{super.key}); 

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late final dynamic jsonString;
  @override
  void initState() {
    final blocdata=context.read <PopulateClassBloc>();
    jsonString=blocdata.state.estimateData.toJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final estimate = jsonString;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCard('Estimate', [
              _buildRow('Tenant ID', estimate['tenantId']),
              _buildRow('Revision Number', estimate['revisionNumber']),
              _buildRow('Business Service', estimate['businessService']),
              // _buildRow('Project ID', estimate['projectId']),
              // _buildRow('Proposal Date', DateTime.fromMillisecondsSinceEpoch(estimate['proposalDate']).toLocal().toString()),
              // _buildRow('Status', estimate['status']),
              // _buildRow('WF Status', estimate['wfStatus']),
              _buildRow('Name', estimate['name']),
              _buildRow('Reference Number', estimate['referenceNumber']),
              // _buildRow('Description', estimate['description']),
              // _buildRow('Executing Department', estimate['executingDepartment']),
            ]),
            _buildCard('Address Details', [
              _buildRow('Tenant ID', estimate['address']['tenantId']),
              _buildRow('Door No', estimate['address']['doorNo']),
              _buildRow('Address Line 1', estimate['address']['addressLine1']),
              _buildRow('Address Line 2', estimate['address']['addressLine2']),
              _buildRow('City', estimate['address']['city']),
            ]),
            _buildCard('Estimate Details', [
              for (var detail in estimate['estimateDetails'])
                ...[
                  _buildRow('SOR ID', detail['sorId']),
                  _buildRow('Name', detail['name']),
                  _buildRow('Category', detail['category']),
                  _buildRow('Description', detail['description']),
                  _buildRow('UOM', detail['uom']),
                  // _buildRow('UOM Value', detail['uomValue'].toString()),
                  const Divider(),
                ],
            ]),
          ],
        ),
      ),
      bottomNavigationBar: DigitButton(
          label: 'Submit',
          onPressed: () {
            resetdata();
            context.read <PopulateClassBloc>().add(SendingDatatoBackend());
            AutoRouter.of(context).popUntil((route) => route.isFirst);
          },
          type: ButtonType.primary,
      )
    );
  }

  // Helper method to create a Card widget with a title and list of rows
  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  // Helper method to create a row with label and value
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
  
}