import 'package:sqflite/sqflite.dart';
import 'package:techjar_task/core/core.dart';

import '../comments.dart';

class CommentDatabase {
  Database? db;

  CommentDatabase._privateConstructor();

  static final CommentDatabase instance = CommentDatabase._privateConstructor();

  Future<int> insertData(CommentModel data) async {
    db = await DatabaseHelper.instance.database;
    return await db!.insert(
      DatabaseDetails.commentTable,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future deleteData() async {
    String myQuery = '''  DELETE FROM ${DatabaseDetails.commentTable} ''';
    db = await DatabaseHelper.instance.database;
    return await db!.rawQuery(myQuery);
  }

  Future deleteDataAccordingToPost({required String postId}) async {
    String myQuery =
        '''  DELETE FROM ${DatabaseDetails.commentTable} WHERE ${DatabaseDetails.postId}=="$postId" ''';
    db = await DatabaseHelper.instance.database;
    return await db!.rawQuery(myQuery);
  }

  Future<List<CommentModel>> getComments() async {
    String myQuery = '''SELECT * FROM ${DatabaseDetails.commentTable}  ''';
    db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> mapData = await db!.rawQuery(myQuery);

    return List.generate(mapData.length, (i) {
      return CommentModel.fromJson(mapData[i]);
    });
  }

  Future<List<CommentModel>> getCommentsAccordingToPost({
    required String postid,
  }) async {
    String myQuery =
        '''SELECT * FROM ${DatabaseDetails.commentTable} WHERE ${DatabaseDetails.postId}=="$postid" ''';
    db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> mapData = await db!.rawQuery(myQuery);

    return List.generate(mapData.length, (i) {
      return CommentModel.fromJson(mapData[i]);
    });
  }
}
