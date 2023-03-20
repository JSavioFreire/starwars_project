import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:starwars_project/data/info_db.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(path,
      onCreate: ((db, version) => db.execute(InfoDao.taskdatabase)),
      version: 1);
}
