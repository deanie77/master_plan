import 'package:master_plan/models/task.dart';
import 'package:master_plan/repositories/repositories.dart';

class Plan {
  final int id;
  String name;
  List<Task> tasks = [];

  Plan({required this.id, required this.name});

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount out of ${tasks.length} tasks';

  Plan.fromModel(Model model)
      : id = model.id,
        name = model.data['name'] ?? '',
        tasks = List<Task>.from(model.data['task'] ?? []);

  Model toModel() => Model(id: id, data: {
        'name': name,
        'task': tasks.map((task) => task.toModel()).toList()
      });
}
