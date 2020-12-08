import 'package:moor/moor.dart';
import 'package:todo/utils/extension/date_extension.dart';

class Tasks extends Table {
  // 可空类型
  IntColumn get completeDate => integer().nullable()();
  TextColumn get completeDateStr => text().nullable()();
  TextColumn get content => text().nullable()();

  // 为空自动生成默认值
  IntColumn get date => integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();

  // 为空自动生成默认值
  TextColumn get dateStr => text().clientDefault(() => DateTime.now().format())();

  // 主键
  IntColumn get id => integer().autoIncrement()();

  // 为空自动生成默认值
  IntColumn get priority => integer().withDefault(Constant(0))();

  // 为空自动生成默认值
  IntColumn get status => integer().withDefault(Constant(0))();

  // 为空自动生成默认值
  TextColumn get title => text()();

  IntColumn get type => integer().withDefault(Constant(0))();
  IntColumn get userId => integer()();
}
