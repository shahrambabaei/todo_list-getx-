import 'package:get/get.dart';
import 'package:todo_list/controllers/add_task_screen_controller.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      HomeScreenController();
    });
    Get.put((AddTaskController()));
  }
}
