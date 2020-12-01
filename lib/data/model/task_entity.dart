class TaskEntity {
/*
{
  "completeDate": 1606665600000,
  "completeDateStr": "2020-11-30",
  "content": "asdasd",
  "date": 1606665600000,
  "dateStr": "2020-11-30",
  "id": 24877,
  "priority": 0,
  "status": 1,
  "title": "我的第一个",
  "type": 1,
  "userId": 82504
} 
*/

  int completeDate;
  String completeDateStr;
  String content;
  int date;
  String dateStr;
  int id;
  int priority;
  int status;
  String title;
  int type;
  int userId;

  TaskEntity({
    this.completeDate,
    this.completeDateStr,
    this.content,
    this.date,
    this.dateStr,
    this.id,
    this.priority,
    this.status,
    this.title,
    this.type,
    this.userId,
  });
  TaskEntity.fromJson(Map<String, dynamic> json) {
    completeDate = json["completeDate"]?.toInt();
    completeDateStr = json["completeDateStr"]?.toString();
    content = json["content"]?.toString();
    date = json["date"]?.toInt();
    dateStr = json["dateStr"]?.toString();
    id = json["id"]?.toInt();
    priority = json["priority"]?.toInt();
    status = json["status"]?.toInt();
    title = json["title"]?.toString();
    type = json["type"]?.toInt();
    userId = json["userId"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["completeDate"] = completeDate;
    data["completeDateStr"] = completeDateStr;
    data["content"] = content;
    data["date"] = date;
    data["dateStr"] = dateStr;
    data["id"] = id;
    data["priority"] = priority;
    data["status"] = status;
    data["title"] = title;
    data["type"] = type;
    data["userId"] = userId;
    return data;
  }
}
