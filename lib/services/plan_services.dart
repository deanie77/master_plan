import 'package:master_plan/repositories/in_memory_cache.dart';
import 'package:master_plan/repositories/repositories.dart';
import 'package:master_plan/models/data_layer.dart';

class PlanServices {
  final Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    _repository.update(plan.toModel());
  }

  void delate(Plan plan) {
    _repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    return _repository
        .getAll()
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
  }

  void addTask(Plan plan, String description) {
    final id = plan.tasks.last.id;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }
}
