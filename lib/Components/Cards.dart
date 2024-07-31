// import 'package:auto_route/auto_route.dart';
// import 'package:estimate_flutter/BLOC/showEstimates/show_estimates_bloc.dart';
// import 'package:estimate_flutter/Utils/app_router.gr.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class Cards extends StatelessWidget {
  final String text;
  final Icon icon;
  const Cards(this.text, this.icon,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 199, 199, 214),
      child: ListTile(
        minTileHeight: 80,
        title: Text(text,style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
        trailing: ElevatedButton(
          onPressed: () { 
              // context.read <ShowEstimatesBloc>().add(EstimateMinimizeicon());
          },
          child: icon,
          ),
        )
      );
  }
  
}