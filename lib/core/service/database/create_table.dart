import 'package:sqflite/sqflite.dart';

import 'database_const.dart';

class CreateTable {
  Database db;
  CreateTable(this.db);

  /// Post List Info
  postListTable() async {
    await db
        .execute(''' CREATE TABLE if not exists ${DatabaseDetails.postTable} (
                                                ${DatabaseDetails.userId} TEXT,
                                                ${DatabaseDetails.id} TEXT,
                                                ${DatabaseDetails.title} TEXT,
                                                ${DatabaseDetails.body} TEXT
                                                ) ''');
  }

  /// Comment List Info
  commentListTable() async {
    await db.execute(
        ''' CREATE TABLE if not exists ${DatabaseDetails.commentTable} (
                                                ${DatabaseDetails.postId} TEXT,
                                                ${DatabaseDetails.id} TEXT,
                                                ${DatabaseDetails.name} TEXT,
                                                ${DatabaseDetails.email} TEXT,
                                                ${DatabaseDetails.body} TEXT
                                                ) ''');
  }
}
