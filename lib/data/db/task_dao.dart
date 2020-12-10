/*
 * @Author: your name
 * @Date: 2020-12-10 23:05:53
 * @LastEditTime: 2020-12-10 23:58:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/db/task_dao.dart
 */
import 'package:moor/moor.dart';
import 'package:todo/data/db/task_database.dart';
part 'task_dao.g.dart';

@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<TaskDatabase> with _$TaskDaoMixin {
  TaskDao(TaskDatabase db) : super(db);

  /// 获取全部
  Future<List<Task>> get getAllTasks => select(tasks).get();

  ///imit查询来限制返回的结果数量
  ///offset偏移量
  Future<List<Task>> getTasks(int limit, {int offset}) {
    return (select(tasks)..limit(limit, offset: offset)).get();
  }

  /// 获取单个数据
  /// 没必要用list
  Future<Task> getTaskById(int id) {
    return (select(tasks)..where((t) => t.id.equals(id))).getSingle();
  }

  Future updateTask(Task entry) {
    return update(tasks).replace(entry);
  }

  Future<void> createOrUpdateUser(Task entry) {
    return into(tasks).insertOnConflictUpdate(entry);
  }

  /// 批量插入
  Future<void> insertMultipleTasks(List<Task> entries) async {
    await batch((batch) {
      batch.insertAll(tasks, entries);
    });
  }

  Future deleteTaskById(int id) {
    return (delete(tasks)..where((t) => t.id.equals(id))).go();
  }

  Future deleteTask(Task entry) {
    return delete(tasks).delete(entry);
  }

  /// 表中数据改变，会发生一个流
  Stream<List<Task>> watchEntriesInCategory() {
    return select(tasks).watch();
  }
}
