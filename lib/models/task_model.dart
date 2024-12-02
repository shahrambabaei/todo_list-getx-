class TaskModel {
  String? titleTask;
  String? subtitleTask;
  bool? status;

  TaskModel(
      {required this.titleTask,
      required this.subtitleTask,
      required this.status});


      
  Map<dynamic, dynamic> toJson() {
    return {
      "titleTask": titleTask,
      "subtitleTask": subtitleTask,
      "status": status
    };
  }

  TaskModel.fromJson(Map<dynamic, dynamic> json)
      : titleTask = json["titleTask"],
        subtitleTask = json["subtitleTask"],
        status = json["status"];
}
