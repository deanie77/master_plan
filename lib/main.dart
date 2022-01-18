import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() {
  runApp(PlanProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
