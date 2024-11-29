import 'package:get/get.dart';
import 'package:todo_list/pages/add_task_screen.dart';
import 'package:todo_list/pages/home_screen.dart';

class Routes {
  static List<GetPage> get pages =>
      [GetPage(name: "/homeScreen", page: () => const HomeScreen()),
      GetPage(name: "/addTaskScreen", page: () => const AddTaskScreen())
      
      
      
      ];
}
