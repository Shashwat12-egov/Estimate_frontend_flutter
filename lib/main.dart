import 'package:estimate_flutter/BLOC/populateclasses/populate_class_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './Utils/app_router.dart';


Future<void> main() async {
  runApp(MyEstimate());
}

class MyEstimate extends StatelessWidget {
  MyEstimate({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopulateClassBloc(),
        ),
      ],
    child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),);
  }
}
