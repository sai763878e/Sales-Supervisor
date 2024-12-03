import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AppDatabase {
  static Database? singleInstance;

  static Future<Database> get instance async {
    singleInstance ??= await openDatabaseFromAsset();
    return singleInstance!;
  }

  static Future<Database> openDatabaseFromAsset() async {
    var dbPath = "";
    try {
      // Get the directory for storing the database
      final documentsDirectory = await getApplicationDocumentsDirectory();
      dbPath = "${documentsDirectory.path}/empform.sqlite";

      // Check if the database already exists to avoid overwriting it
      if (!await File(dbPath).exists()) {
        // If not, copy it from the assets folder
        ByteData data = await rootBundle.load('assets/database/empform.sqlite');
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(dbPath).writeAsBytes(bytes);
      }
    } catch (e) {
      if(kDebugMode) print(e);
    }
    // var databaseFactory = databaseFactoryFfi;

    // Open and return the database
    return await /*databaseFactory.*/openDatabase(dbPath);
  }

  static Future<int> insertOrUpdateRow(Database db, Map<String, dynamic> row,
      String tuidColName, String tableName) async {
    String id = row[tuidColName];
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: '$tuidColName = ?',
      whereArgs: [id],
    );

    if (result.isEmpty) {
      // Insert if not exists
      return await db.insert(tableName, row);
    } else {
      // Update if exists
      return await db.update(
        tableName,
        row,
        where: '$tuidColName = ?',
        whereArgs: [id],
      );
    }
  }
}
