import 'package:manager/F1/messageModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MessageHelper {
  Future<Database> initializeDb() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'message.db'), version: 1,
        onCreate: (database, version) async {
      await database.execute(
          "CREATE TABLE chat(id INTEGER PRIMARY KEY AUTOINCREMENT,uid TEXT, photourl TEXT, colorcode TEXT)");
    });
  }

  Future<int> inserChat(Chat chat) async {
    final Database db = await initializeDb();
    return await db.insert("chat", chat.toMap());
  }

  Future<List<Chat>> retriveChat() async {
    final Database db = await initializeDb();
    final List<Map<String, Object>> queryResult = await db.query("chat");
    return queryResult.map((e) => Chat.fromJson(e)).toList();
  }
}


//  TEXT,photourl TEXT,bookmarkedmsg TEXT,lastmsg TEXT TEXT NOT NULL,participants
