import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  TextEditingController? taskController;
  TextEditingController? noteController;
  RxBool isEditing = false.obs;


  @override
  void onInit() {
    taskController = TextEditingController();
    noteController = TextEditingController();
    super.onInit();
  }
}
