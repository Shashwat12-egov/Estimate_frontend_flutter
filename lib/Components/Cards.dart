import 'package:auto_route/auto_route.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:estimate_flutter/Models/CardItem.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Cards({super.key});

  final List<CardItem> items = [
    CardItem(title: 'Create Estimates', icon: Icons.create, color: Colors.red),
    CardItem(title: 'Search Estimates', icon: Icons.search, color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate the number of cards that can fit in a row based on screen width
            const double cardWidth = 300; // Fixed card width
            // final int crossAxisCount = (constraints.maxWidth / cardWidth).floor();

            return Center(
              child: Wrap(
                spacing: 40.0, // Horizontal spacing between cards
                runSpacing: 40.0, // Vertical spacing between cards
                children: items.map((item) {
                  return SizedBox(
                    width: cardWidth,
                    height: 300,
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 40,
                            color: item.color,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          DigitButton(
                            width: 200,
                            label: "Press Here",
                            onPressed: () {
                              if(item.title=="Create Estimates") {
                                AutoRouter.of(context).push(EstimateFormRoute(heading: "Create Estimate"));
                              }
                              else {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${item.title} button pressed'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                            type: ButtonType.secondary,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      );
  }
}