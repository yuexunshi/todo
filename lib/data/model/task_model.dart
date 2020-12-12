import 'package:todo/data/db/task_database.dart';

class TaskModel {
/*
{
  "curPage": 1,
  "datas": [
    {
      "completeDate": null,
      "completeDateStr": "",
      "content": "",
      "date": 1607270400000,
      "dateStr": "2020-12-07",
      "id": 24902,
      "priority": 0,
      "status": 0,
      "title": "SSSS",
      "type": 0,
      "userId": 82504
    }
  ],
  "offset": 0,
  "over": true,
  "pageCount": 1,
  "size": 20,
  "total": 4
} 
*/

  int curPage;
  List<Task> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  TaskModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });
  TaskModel.fromJson(Map<String, dynamic> json) {
    curPage = json["curPage"]?.toInt();
    if (json["datas"] != null) {
      var v = json["datas"];
      var arr0 = List<Task>();
      v.forEach((v) {
        arr0.add(Task.fromJson(v));
      });
      datas = arr0;
    }
    offset = json["offset"]?.toInt();
    over = json["over"];
    pageCount = json["pageCount"]?.toInt();
    size = json["size"]?.toInt();
    total = json["total"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["curPage"] = curPage;
    if (datas != null) {
      var v = datas;
      var arr0 = List();
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["datas"] = arr0;
    }
    data["offset"] = offset;
    data["over"] = over;
    data["pageCount"] = pageCount;
    data["size"] = size;
    data["total"] = total;
    return data;
  }
}
