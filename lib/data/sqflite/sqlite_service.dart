abstract class SqliteService<T> {
  Future<int> insert(String table, Map<String, dynamic> data);
  Future<int> update(String table, Map<String, dynamic> data, String whereClause, List<dynamic> whereArgs);
  Future<int> delete(String table, String whereClause, List<dynamic> whereArgs);
  Future<List<Map<String, dynamic>>> query(String table, {String? whereClause, List<dynamic>? whereArgs});
}
