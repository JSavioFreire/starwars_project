import 'package:sqflite/sqflite.dart';
import 'package:starwars_project/data/open_db.dart';
import 'package:starwars_project/model/info_model.dart';

class InfoDao {
  static const String favdatabase = 'CREATE TABLE $tableName('
      '$name TEXT)';

  static const String tableName = 'favTable';

  static const String name = 'name';

  save(InfoModel newFav) async {
    final Database dataBase = await getDataBase();
    Map<String, dynamic> newFavMap = toMap(newFav);
    return await dataBase.insert(tableName, newFavMap);
  }

  Future findAll() async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  Future find(String favBuscada) async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(
      tableName,
      where: '$name = ?',
      whereArgs: [favBuscada],
    );
    return toList(result);
  }

  delete(String favName) async {
    final Database dataBase = await getDataBase();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [favName],
    );
  }

  Map<String, dynamic> toMap(eachfav) {
    final Map<String, dynamic> favMap = {};
    favMap[name] = eachfav.name;
    return favMap;
  }

  List toList(List<Map<String, dynamic>> favMap) {
    final List favList = [];
    for (Map<String, dynamic> eachfav in favMap) {
      final favs = (eachfav['name']);
      favList.add(favs);
    }
    return favList;
  }
}
