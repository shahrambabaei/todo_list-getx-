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
    var controller = Get.find<AddTaskController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      controller.isEditing.value ? "EditTask" : "Newtask",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
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
                      if (controller.isEditing.value) {
                        var task = Get.find<HomeScreenController>()
                            .taskList[Get.find<HomeScreenController>().index];
                        task.titleTask = controller.taskController!.text;
                        task.subtitleTask = controller.taskController!.text;
                        Get.find<HomeScreenController>().taskList[
                            Get.find<HomeScreenController>().index] = task;
                      } else {
                        Get.find<HomeScreenController>().taskList.add(TaskModel(
                            titleTask: controller.taskController!.text,
                            subtitleTask: controller.taskController!.text,
                            status: false));
                      }

                      Get.back();
                    },
                    child: Text(
                      controller.isEditing.value ? "Edit" : "Add",
                      style: const TextStyle(
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
    
  }
}
