import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/models/task_model.dart';

class HomeScreenController extends GetxController {
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  int index = 0;

  @override
  void onInit() {
    final box = GetStorage();
    ever(taskList, (value) {
      box.write("taskList", taskList.toJson());
    });

    
    if (box.read("taskList") != null) {
      var list = box.read("taskList");
      for (var item in list) {
        taskList.add(TaskModel.fromJson(item));
      }
    }

    super.onInit();
  }

  addTask(TaskModel taskModel) {
    taskList.add(taskModel);
  }
}
