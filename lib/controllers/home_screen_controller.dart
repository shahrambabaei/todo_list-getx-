import 'package:get/get.dart';
import 'package:todo_list/models/task_model.dart';

class HomeScreenController extends GetxController {
  RxList<TaskModel> taskList = <TaskModel>[].obs;

  HomeScreenController() {
    taskList.add(
        TaskModel(titleTask: "shahram", subtitleTask: "baba", status: true));
  }

  addTask(TaskModel taskModel) {
    taskList.add(taskModel);
  }
}
