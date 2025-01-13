import 'task_count_model.dart';

class TaskCountByStatusModel {
  String? status;
  List<TaskCountModel>? taskByStatusList;

  TaskCountByStatusModel({this.status, this.taskByStatusList});

  TaskCountByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskByStatusList = <TaskCountModel>[];
      json['data'].forEach((v) {
        taskByStatusList!.add(TaskCountModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.taskByStatusList != null) {
      data['data'] = this.taskByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


