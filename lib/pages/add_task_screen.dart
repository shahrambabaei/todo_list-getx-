import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/constant.dart';
import 'package:todo_list/controllers/add_task_screen_controller.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddTaskController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Newtask",
                      // controller.IsSelected.value ? "EditTask" : "Newtask",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              const Text("What arre you planing?"),
              TextFormField(
                maxLines: 8,
                controller: controller.taskController,
                cursorColor: kLightBlueColor,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300))),
              ),
              TextFormField(
                maxLength: 30,
                controller: controller.noteController,
                cursorColor: kLightBlueColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.bookmark),
                    hintText: "Add note",
                    border: InputBorder.none,
                    counter: SizedBox()),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                        elevation: 0, backgroundColor: kLightBlueColor),
                    onPressed: () {
                      Get.find<HomeScreenController>().taskList.add(TaskModel(
                          titleTask: controller.taskController!.text,
                          subtitleTask: controller.taskController!.text,
                          status: false));
                      Get.back();
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
