import 'package:flutter/material.dart';
import 'package:master_plan/models/plan.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();

  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Plan of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._plan;
  }
}
