class TaskModel {
  String? sId;
  String? title;
  String? description;
  String? status;
  String? createdDate;

  TaskModel({this.sId, this.title, this.description, this.status, this.createdDate});

  TaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
