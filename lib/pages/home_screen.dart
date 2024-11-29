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
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onLongPress: () {
                            controller.taskList.removeAt(index);
                          },
                          onTap: () {},
                          title: Text(
                            controller.taskList[index].titleTask.toString(),
                          ),
                          subtitle: Text(
                            controller.taskList[index].titleTask.toString(),
                          ),
                          trailing:
                              Checkbox(value: true, onChanged: (value) {}),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: controller.taskList.length);
                }),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kLightBlueColor,
          onPressed: () {
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
