import 'package:sqflite/sqflite.dart';
import 'package:starwars_project/data/open_db.dart';

class InfoDao {
  static const String taskdatabase = 'CREATE TABLE $tableName('
      '$name TEXT)';

  static const String tableName = 'taskTable';

  static const String name = 'name';

  save(newTask) async {
    final Database dataBase = await getDataBase();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future findAll() async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  Future find(String taskBuscada) async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(
      tableName,
      where: '$name = ?',
      whereArgs: [taskBuscada],
    );
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBase();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.title;
    return taskMap;
  }

  List toList(List<Map<String, dynamic>> taskMap) {
    final List taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final tasks = (eachTask['name']);
      taskList.add(tasks);
    }
    return taskList;
  }
}
