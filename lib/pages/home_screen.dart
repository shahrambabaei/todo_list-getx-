import 'package:flutter/material.dart';
import 'package:todo_list/constant.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/add_task_screen_controller.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: kLightBlueColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.bookmark,
                        color: kLightBlueColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "All",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        "${controller.taskList.length} Tesks",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height * .65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Obx(() {
                  if (controller.taskList.isEmpty) {
                    return Center(
                      child: Text(
                        "Empty",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  } else {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                        itemBuilder: (context, index) {
                          var task = controller.taskList[index];
                          return ListTile(
                            onLongPress: () {
                              Get.defaultDialog(
                                  title: "آیا از حذف این تسک اطمینان دارید؟",
                                  titleStyle: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 20),
                                  titlePadding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  content: const SizedBox(),
                                  cancel: TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "خیر",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontSize: 16,
                                                color: Colors.red),
                                      )),
                                  confirm: TextButton(
                                      onPressed: () {
                                        controller.taskList.removeAt(index);
                                        Get.back();
                                      },
                                      child: Text("بله",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.green))));
                            },
                            onTap: () {
                              controller.index = index;
                              Get.find<AddTaskController>().isEditing.value =
                                  true;
                              Get.find<AddTaskController>()
                                  .taskController!
                                  .text = task.titleTask!;
                              Get.find<AddTaskController>()
                                  .noteController!
                                  .text = task.subtitleTask!;
                              Get.toNamed("/addTaskScreen");
                            },
                            title: Text(
                              task.titleTask.toString(),
                            ),
                            subtitle: Text(
                              task.titleTask.toString(),
                            ),
                            trailing: Checkbox(
                                activeColor: kLightBlueColor,
                                side: const BorderSide(
                                    color: Colors.black45, width: 1.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                value: task.status,
                                onChanged: (value) {
                                  controller.taskList[index].status =
                                      !task.status!;
                                  controller.taskList[index] = task;
                                }),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: controller.taskList.length);
                  }
                }),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kLightBlueColor,
          onPressed: () {
            Get.find<AddTaskController>().isEditing.value = false;
            Get.find<AddTaskController>().taskController!.text = "";
            Get.find<AddTaskController>().noteController!.text = "";
            Get.toNamed("/addTaskScreen");
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
