/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 10:48:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/db/task_database.dart
 */
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/db/task_dao.dart';
import 'package:todo/utils/extension/date_extension.dart';
part 'task_database.g.dart';

class Tasks extends Table {
  // 可空类型
  IntColumn get completeDate => integer().nullable()();
  TextColumn get completeDateStr => text().nullable()();
  TextColumn get content => text().nullable()();

  // 为空自动生成默认值
  IntColumn get date =>
      integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();

  // 为空自动生成默认值
  TextColumn get dateStr =>
      text().nullable().clientDefault(() => DateTime.now().format())();

  // 主键
  IntColumn get id => integer().nullable().autoIncrement()();

  // 为空自动生成默认值
  IntColumn get priority => integer().nullable().withDefault(Constant(0))();

  // 为空自动生成默认值
  IntColumn get status => integer().nullable().withDefault(Constant(0))();

  TextColumn get title => text()();

  IntColumn get type => integer().withDefault(Constant(0))();

  IntColumn get userId => integer().nullable()();
}

@UseMoor(tables: [Tasks], daos: [TaskDao])
class TaskDatabase extends _$TaskDatabase {
  // we tell the database where to store the data with this constructor
  TaskDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
