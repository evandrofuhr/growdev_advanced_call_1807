import 'package:call_1807/models/state.dart';
import 'package:call_1807/utils/db_helper.dart';

class AppStateRepository {
  final _table = 'appstate';
  final _dbHelper = DBHelper();

  Future<AppState> getCurrent() async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(_table);
    if (result.isNotEmpty) {
      return AppState.fromDatabase(result.first);
    }
    return null;
  }

  Future<void> save(AppState appState) async {
    final db = await _dbHelper.getDatabase();
    await db.transaction((txn) async {
      await txn.delete(_table);
      await txn.insert(_table, appState.toMap());
    });
  }

  Future<void> clear() async {
    final db = await _dbHelper.getDatabase();
    await db.delete(_table);
  }
}
