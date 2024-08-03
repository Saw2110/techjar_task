import 'package:sqflite/sqflite.dart';
import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/posts/posts.dart';

class PostsDatabase {
  Database? db;

  PostsDatabase._privateConstructor();

  static final PostsDatabase instance = PostsDatabase._privateConstructor();

  Future<int> insertData(PostsModel data) async {
    db = await DatabaseHelper.instance.database;
    return await db!.insert(
      DatabaseDetails.postTable,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future deleteData() async {
    String myQuery = '''  DELETE FROM ${DatabaseDetails.postTable} ''';
    db = await DatabaseHelper.instance.database;
    return await db!.rawQuery(myQuery);
  }

  Future<List<PostsModel>> getPostList() async {
    String myQuery = '''SELECT * FROM ${DatabaseDetails.postTable}  ''';
    db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> mapData = await db!.rawQuery(myQuery);

    return List.generate(mapData.length, (i) {
      return PostsModel.fromJson(mapData[i]);
    });
  }
}
