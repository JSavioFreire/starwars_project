import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:starwars_project/data/info_db.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(path,
      onCreate: ((db, version) => db.execute(InfoDao.favdatabase)),
      version: 1);
}
