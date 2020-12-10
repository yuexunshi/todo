// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int completeDate;
  final String completeDateStr;
  final String content;
  final int date;
  final String dateStr;
  final int id;
  final int priority;
  final int status;
  final String title;
  final int type;
  final int userId;
  Task(
      {this.completeDate,
      this.completeDateStr,
      this.content,
      @required this.date,
      @required this.dateStr,
      @required this.id,
      @required this.priority,
      @required this.status,
      @required this.title,
      @required this.type,
      @required this.userId});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Task(
      completeDate: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date']),
      completeDateStr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date_str']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      date: intType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      dateStr: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_str']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      priority:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}priority']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      type: intType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || completeDate != null) {
      map['complete_date'] = Variable<int>(completeDate);
    }
    if (!nullToAbsent || completeDateStr != null) {
      map['complete_date_str'] = Variable<String>(completeDateStr);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<int>(date);
    }
    if (!nullToAbsent || dateStr != null) {
      map['date_str'] = Variable<String>(dateStr);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int>(priority);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<int>(type);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      completeDate: completeDate == null && nullToAbsent
          ? const Value.absent()
          : Value(completeDate),
      completeDateStr: completeDateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(completeDateStr),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      dateStr: dateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(dateStr),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      completeDate: serializer.fromJson<int>(json['completeDate']),
      completeDateStr: serializer.fromJson<String>(json['completeDateStr']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<int>(json['date']),
      dateStr: serializer.fromJson<String>(json['dateStr']),
      id: serializer.fromJson<int>(json['id']),
      priority: serializer.fromJson<int>(json['priority']),
      status: serializer.fromJson<int>(json['status']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<int>(json['type']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'completeDate': serializer.toJson<int>(completeDate),
      'completeDateStr': serializer.toJson<String>(completeDateStr),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<int>(date),
      'dateStr': serializer.toJson<String>(dateStr),
      'id': serializer.toJson<int>(id),
      'priority': serializer.toJson<int>(priority),
      'status': serializer.toJson<int>(status),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>(type),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Task copyWith(
          {int completeDate,
          String completeDateStr,
          String content,
          int date,
          String dateStr,
          int id,
          int priority,
          int status,
          String title,
          int type,
          int userId}) =>
      Task(
        completeDate: completeDate ?? this.completeDate,
        completeDateStr: completeDateStr ?? this.completeDateStr,
        content: content ?? this.content,
        date: date ?? this.date,
        dateStr: dateStr ?? this.dateStr,
        id: id ?? this.id,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        title: title ?? this.title,
        type: type ?? this.type,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('completeDate: $completeDate, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('dateStr: $dateStr, ')
          ..write('id: $id, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      completeDate.hashCode,
      $mrjc(
          completeDateStr.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  date.hashCode,
                  $mrjc(
                      dateStr.hashCode,
                      $mrjc(
                          id.hashCode,
                          $mrjc(
                              priority.hashCode,
                              $mrjc(
                                  status.hashCode,
                                  $mrjc(
                                      title.hashCode,
                                      $mrjc(type.hashCode,
                                          userId.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.completeDate == this.completeDate &&
          other.completeDateStr == this.completeDateStr &&
          other.content == this.content &&
          other.date == this.date &&
          other.dateStr == this.dateStr &&
          other.id == this.id &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.title == this.title &&
          other.type == this.type &&
          other.userId == this.userId);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> completeDate;
  final Value<String> completeDateStr;
  final Value<String> content;
  final Value<int> date;
  final Value<String> dateStr;
  final Value<int> id;
  final Value<int> priority;
  final Value<int> status;
  final Value<String> title;
  final Value<int> type;
  final Value<int> userId;
  const TasksCompanion({
    this.completeDate = const Value.absent(),
    this.completeDateStr = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.id = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.userId = const Value.absent(),
  });
  TasksCompanion.insert({
    this.completeDate = const Value.absent(),
    this.completeDateStr = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.id = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    @required String title,
    this.type = const Value.absent(),
    @required int userId,
  })  : title = Value(title),
        userId = Value(userId);
  static Insertable<Task> custom({
    Expression<int> completeDate,
    Expression<String> completeDateStr,
    Expression<String> content,
    Expression<int> date,
    Expression<String> dateStr,
    Expression<int> id,
    Expression<int> priority,
    Expression<int> status,
    Expression<String> title,
    Expression<int> type,
    Expression<int> userId,
  }) {
    return RawValuesInsertable({
      if (completeDate != null) 'complete_date': completeDate,
      if (completeDateStr != null) 'complete_date_str': completeDateStr,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (dateStr != null) 'date_str': dateStr,
      if (id != null) 'id': id,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (userId != null) 'user_id': userId,
    });
  }

  TasksCompanion copyWith(
      {Value<int> completeDate,
      Value<String> completeDateStr,
      Value<String> content,
      Value<int> date,
      Value<String> dateStr,
      Value<int> id,
      Value<int> priority,
      Value<int> status,
      Value<String> title,
      Value<int> type,
      Value<int> userId}) {
    return TasksCompanion(
      completeDate: completeDate ?? this.completeDate,
      completeDateStr: completeDateStr ?? this.completeDateStr,
      content: content ?? this.content,
      date: date ?? this.date,
      dateStr: dateStr ?? this.dateStr,
      id: id ?? this.id,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      title: title ?? this.title,
      type: type ?? this.type,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (completeDate.present) {
      map['complete_date'] = Variable<int>(completeDate.value);
    }
    if (completeDateStr.present) {
      map['complete_date_str'] = Variable<String>(completeDateStr.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (dateStr.present) {
      map['date_str'] = Variable<String>(dateStr.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('completeDate: $completeDate, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('dateStr: $dateStr, ')
          ..write('id: $id, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _completeDateMeta =
      const VerificationMeta('completeDate');
  GeneratedIntColumn _completeDate;
  @override
  GeneratedIntColumn get completeDate =>
      _completeDate ??= _constructCompleteDate();
  GeneratedIntColumn _constructCompleteDate() {
    return GeneratedIntColumn(
      'complete_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completeDateStrMeta =
      const VerificationMeta('completeDateStr');
  GeneratedTextColumn _completeDateStr;
  @override
  GeneratedTextColumn get completeDateStr =>
      _completeDateStr ??= _constructCompleteDateStr();
  GeneratedTextColumn _constructCompleteDateStr() {
    return GeneratedTextColumn(
      'complete_date_str',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedIntColumn _date;
  @override
  GeneratedIntColumn get date => _date ??= _constructDate();
  GeneratedIntColumn _constructDate() {
    return GeneratedIntColumn(
      'date',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().millisecondsSinceEpoch;
  }

  final VerificationMeta _dateStrMeta = const VerificationMeta('dateStr');
  GeneratedTextColumn _dateStr;
  @override
  GeneratedTextColumn get dateStr => _dateStr ??= _constructDateStr();
  GeneratedTextColumn _constructDateStr() {
    return GeneratedTextColumn(
      'date_str',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().format();
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  GeneratedIntColumn _priority;
  @override
  GeneratedIntColumn get priority => _priority ??= _constructPriority();
  GeneratedIntColumn _constructPriority() {
    return GeneratedIntColumn('priority', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn('status', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn('type', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        completeDate,
        completeDateStr,
        content,
        date,
        dateStr,
        id,
        priority,
        status,
        title,
        type,
        userId
      ];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('complete_date')) {
      context.handle(
          _completeDateMeta,
          completeDate.isAcceptableOrUnknown(
              data['complete_date'], _completeDateMeta));
    }
    if (data.containsKey('complete_date_str')) {
      context.handle(
          _completeDateStrMeta,
          completeDateStr.isAcceptableOrUnknown(
              data['complete_date_str'], _completeDateStrMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('date_str')) {
      context.handle(_dateStrMeta,
          dateStr.isAcceptableOrUnknown(data['date_str'], _dateStrMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority'], _priorityMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as TaskDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
