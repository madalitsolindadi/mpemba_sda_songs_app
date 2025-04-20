import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  final StreamController<void> _hasChanges = StreamController<void>.broadcast();

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'fruits.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE fruit_dor (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_dor (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE key_pass (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            basedate TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE app_lock (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            lock_date TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE songinfo_dor (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE songinfo_sw (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_sw (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_sw (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE songinfo_amo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_amo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_amo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_bles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_bles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_bles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_chur (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_chur (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_chur (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_comf (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_comf (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_comf (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_fam (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_fam (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_fam (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_family (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_family (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_family (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_ivet (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_ivet (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_ivet (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_kab (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_kab (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_kab (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_new (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_new (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_new (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_path (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_path (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_path (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_senior (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_senior (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_senior (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_tawo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_tawo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_tawo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_tow (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_tow  (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_tow  (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_young (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_young (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_young (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE songinfo_zib (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            song_ref TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_zib (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE fruit_detail_zib (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fruit_id INTEGER,
            description TEXT,
            FOREIGN KEY (fruit_id) REFERENCES fruit (id) ON DELETE CASCADE
          )
        ''');
        await db.insert('key_pass', {'basedate': '2024-12-16'});
        await db.insert('app_lock', {'lock_date': '2025-06-01'});
      },
    );
  }

  Future<void> updateBaseDate(String newBasedate) async {
    final db = await database;
    await db.update(
      'key_pass',
      {'basedate': newBasedate},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<String?> getBasedate() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('key_pass',
        where: 'id = ?',
        whereArgs: [1]); // Assuming settings table has unit price

    return result.isNotEmpty ? result.first['basedate'] : '2024-12-16';
  }

  Future<void> updateLockDate(String lockDate) async {
    final db = await database;
    await db.update(
      'app_lock',
      {'lock_date': lockDate},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<String> getLockDate() async {
    final db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('app_lock', where: 'id = ?', whereArgs: [1]);

    return result.first['lock_date'];
  }

  Stream<void> get onChanged => _hasChanges.stream;

  // Insert a new fruit
  Future<void> insertFruit_dor(String name) async {
    final db = await database;
    await db.insert(
      'fruit_dor',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_dor() async {
    final db = await database;
    return await db.query('fruit_dor');
  }

  Future<List<Map<String, dynamic>>> getFruit_dor(int id) async {
    final db = await database;
    return await db.query('fruit_dor', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_dor(int id, String description) async {
    final db = await database;
    await db.update('fruit_dor', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_dor(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_dor',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_dor() async {
    final db = await database;
    return await db.query('songinfo_dor');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_dor(int id) async {
    final db = await database;
    return await db.query('songinfo_dor', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_dor(int id, String description) async {
    final db = await database;
    await db.update('songinfo_dor', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_dor(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_dor',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_dor(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_dor', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_dor() async {
    final db = await database;
    return await db.query('fruit_detail_dor');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_dor(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_dor', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

// Insert a new fruit
  Future<void> insertFruit_Sw(String name) async {
    final db = await database;
    await db.insert(
      'fruit_sw',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_Sw() async {
    final db = await database;
    return await db.query('fruit_sw');
  }

  Future<List<Map<String, dynamic>>> getFruit_Sw(int id) async {
    final db = await database;
    return await db.query('fruit_sw', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_Sw(int id, String description) async {
    final db = await database;
    await db.update('fruit_sw', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_Sw(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_sw',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_Sw() async {
    final db = await database;
    return await db.query('songinfo_sw');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_Sw(int id) async {
    final db = await database;
    return await db.query('songinfo_sw', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_Sw(int id, String description) async {
    final db = await database;
    await db.update('songinfo_sw', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_Sw(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_sw',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_Sw(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_sw', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_Sw() async {
    final db = await database;
    return await db.query('fruit_detail_sw');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_Sw(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_sw', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_comf(String name) async {
    final db = await database;
    await db.insert(
      'fruit_comf',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_comf() async {
    final db = await database;
    return await db.query('fruit_comf');
  }

  Future<List<Map<String, dynamic>>> getFruit_comf(int id) async {
    final db = await database;
    return await db.query('fruit_comf', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_comf(int id, String description) async {
    final db = await database;
    await db.update('fruit_comf', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_comf(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_comf',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_comf() async {
    final db = await database;
    return await db.query('songinfo_comf');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_comf(int id) async {
    final db = await database;
    return await db.query('songinfo_comf', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_comf(int id, String description) async {
    final db = await database;
    await db.update('songinfo_comf', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_comf(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_comf',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_comf(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_comf',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_comf() async {
    final db = await database;
    return await db.query('fruit_detail_comf');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_comf(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_comf', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

// Insert a new fruit
  Future<void> insertFruit_ivet(String name) async {
    final db = await database;
    await db.insert(
      'fruit_ivet',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_ivet() async {
    final db = await database;
    return await db.query('fruit_ivet');
  }

  Future<List<Map<String, dynamic>>> getFruit_ivet(int id) async {
    final db = await database;
    return await db.query('fruit_ivet', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_ivet(int id, String description) async {
    final db = await database;
    await db.update('fruit_ivet', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_ivet(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_ivet',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_ivet() async {
    final db = await database;
    return await db.query('songinfo_ivet');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_ivet(int id) async {
    final db = await database;
    return await db.query('songinfo_ivet', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_ivet(int id, String description) async {
    final db = await database;
    await db.update('songinfo_ivet', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_ivet(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_ivet',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_ivet(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_ivet',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_ivet() async {
    final db = await database;
    return await db.query('fruit_detail_ivet');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_ivet(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_ivet', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_kab(String name) async {
    final db = await database;
    await db.insert(
      'fruit_kab',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_kab() async {
    final db = await database;
    return await db.query('fruit_kab');
  }

  Future<List<Map<String, dynamic>>> getFruit_kab(int id) async {
    final db = await database;
    return await db.query('fruit_kab', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_kab(int id, String description) async {
    final db = await database;
    await db.update('fruit_kab', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_kab(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_kab',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_kab() async {
    final db = await database;
    return await db.query('songinfo_kab');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_kab(int id) async {
    final db = await database;
    return await db.query('songinfo_kab', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_kab(int id, String description) async {
    final db = await database;
    await db.update('songinfo_kab', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_kab(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_kab',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_kab(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_kab', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_kab() async {
    final db = await database;
    return await db.query('fruit_detail_kab');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_kab(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_kab', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_new(String name) async {
    final db = await database;
    await db.insert(
      'fruit_new',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_new() async {
    final db = await database;
    return await db.query('fruit_new');
  }

  Future<List<Map<String, dynamic>>> getFruit_new(int id) async {
    final db = await database;
    return await db.query('fruit_new', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_new(int id, String description) async {
    final db = await database;
    await db.update('fruit_new', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_new(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_new',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_new() async {
    final db = await database;
    return await db.query('songinfo_new');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_new(int id) async {
    final db = await database;
    return await db.query('songinfo_new', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_new(int id, String description) async {
    final db = await database;
    await db.update('songinfo_new', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_new(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_new',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_new(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_new', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_new() async {
    final db = await database;
    return await db.query('fruit_detail_new');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_new(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_new', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_young(String name) async {
    final db = await database;
    await db.insert(
      'fruit_young',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_young() async {
    final db = await database;
    return await db.query('fruit_young');
  }

  Future<List<Map<String, dynamic>>> getFruit_young(int id) async {
    final db = await database;
    return await db.query('fruit_young', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_young(int id, String description) async {
    final db = await database;
    await db.update('fruit_young', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_young(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_young',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_young() async {
    final db = await database;
    return await db.query('songinfo_young');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_young(int id) async {
    final db = await database;
    return await db.query('songinfo_young', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_young(int id, String description) async {
    final db = await database;
    await db.update('songinfo_young', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_young(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_young',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_young(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_young',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_young() async {
    final db = await database;
    return await db.query('fruit_detail_young');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_young(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_young', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_tow(String name) async {
    final db = await database;
    await db.insert(
      'fruit_tow',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_tow() async {
    final db = await database;
    return await db.query('fruit_tow');
  }

  Future<List<Map<String, dynamic>>> getFruit_tow(int id) async {
    final db = await database;
    return await db.query('fruit_tow', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_tow(int id, String description) async {
    final db = await database;
    await db.update('fruit_tow', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_tow(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_tow',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_tow() async {
    final db = await database;
    return await db.query('songinfo_tow');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_tow(int id) async {
    final db = await database;
    return await db.query('songinfo_tow', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_tow(int id, String description) async {
    final db = await database;
    await db.update('songinfo_tow', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_tow(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_tow',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_tow(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_tow', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_tow() async {
    final db = await database;
    return await db.query('fruit_detail_tow');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_tow(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_tow', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_zib(String name) async {
    final db = await database;
    await db.insert(
      'fruit_zib',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_zib() async {
    final db = await database;
    return await db.query('fruit_zib');
  }

  Future<List<Map<String, dynamic>>> getFruit_zib(int id) async {
    final db = await database;
    return await db.query('fruit_zib', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_zib(int id, String description) async {
    final db = await database;
    await db.update('fruit_zib', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_zib(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_zib',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_zib() async {
    final db = await database;
    return await db.query('songinfo_zib');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_zib(int id) async {
    final db = await database;
    return await db.query('songinfo_zib', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_zib(int id, String description) async {
    final db = await database;
    await db.update('songinfo_zib', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_zib(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_zib',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_zib(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_zib', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_zib() async {
    final db = await database;
    return await db.query('fruit_detail_zib');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_zib(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_zib', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_tawo(String name) async {
    final db = await database;
    await db.insert(
      'fruit_tawo',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_tawo() async {
    final db = await database;
    return await db.query('fruit_tawo');
  }

  Future<List<Map<String, dynamic>>> getFruit_tawo(int id) async {
    final db = await database;
    return await db.query('fruit_tawo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_tawo(int id, String description) async {
    final db = await database;
    await db.update('fruit_tawo', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_tawo(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_tawo',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_tawo() async {
    final db = await database;
    return await db.query('songinfo_tawo');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_tawo(int id) async {
    final db = await database;
    return await db.query('songinfo_tawo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_tawo(int id, String description) async {
    final db = await database;
    await db.update('songinfo_tawo', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_tawo(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_tawo',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_tawo(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_tawo',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_tawo() async {
    final db = await database;
    return await db.query('fruit_detail_tawo');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_tawo(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_tawo', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_path(String name) async {
    final db = await database;
    await db.insert(
      'fruit_path',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_path() async {
    final db = await database;
    return await db.query('fruit_path');
  }

  Future<List<Map<String, dynamic>>> getFruit_path(int id) async {
    final db = await database;
    return await db.query('fruit_path', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_path(int id, String description) async {
    final db = await database;
    await db.update('fruit_path', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_path(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_path',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_path() async {
    final db = await database;
    return await db.query('songinfo_path');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_path(int id) async {
    final db = await database;
    return await db.query('songinfo_path', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_path(int id, String description) async {
    final db = await database;
    await db.update('songinfo_path', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_path(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_path',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_path(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_path',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_path() async {
    final db = await database;
    return await db.query('fruit_detail_path');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_path(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_path', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_senior(String name) async {
    final db = await database;
    await db.insert(
      'fruit_senior',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_senior() async {
    final db = await database;
    return await db.query('fruit_senior');
  }

  Future<List<Map<String, dynamic>>> getFruit_senior(int id) async {
    final db = await database;
    return await db.query('fruit_senior', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_senior(int id, String description) async {
    final db = await database;
    await db.update('fruit_senior', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_senior(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_senior',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_senior() async {
    final db = await database;
    return await db.query('songinfo_senior');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_senior(int id) async {
    final db = await database;
    return await db.query('songinfo_senior', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_senior(int id, String description) async {
    final db = await database;
    await db.update('songinfo_senior', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_senior(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_senior',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_senior(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_senior',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_senior() async {
    final db = await database;
    return await db.query('fruit_detail_senior');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_senior(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_senior', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Delete a fruit by ID
  Future<void> deleteFruit(int id) async {
    final db = await database;
    await db.delete('fruit', where: 'id = ?', whereArgs: [id]);
  }

  // Delete a fruit detail by ID
  Future<void> deleteFruitDetail(int id) async {
    final db = await database;
    await db.delete('fruit_detail', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteFruits() async {
    // Assuming 'your_table_name' is the name of your table.
    const tableName = 'fruit';

    for (int id = 1; id <= 3; id++) {
      final db = await database;
      await db.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      //print('Deleted item with id: $id');
    }
  }

// Insert a new fruit
  Future<void> insertFruit_amo(String name) async {
    final db = await database;
    await db.insert(
      'fruit_amo',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_amo() async {
    final db = await database;
    return await db.query('fruit_amo');
  }

  Future<List<Map<String, dynamic>>> getFruit_amo(int id) async {
    final db = await database;
    return await db.query('fruit_amo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_amo(int id, String description) async {
    final db = await database;
    await db.update('fruit_amo', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_amo(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_amo',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_amo() async {
    final db = await database;
    return await db.query('songinfo_amo');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_amo(int id) async {
    final db = await database;
    return await db.query('songinfo_amo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_amo(int id, String description) async {
    final db = await database;
    await db.update('songinfo_amo', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_amo(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_amo',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_amo(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_amo', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_amo() async {
    final db = await database;
    return await db.query('fruit_detail_amo');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_amo(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_amo', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_chur(String name) async {
    final db = await database;
    await db.insert(
      'fruit_chur',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_chur() async {
    final db = await database;
    return await db.query('fruit_chur');
  }

  Future<List<Map<String, dynamic>>> getFruit_chur(int id) async {
    final db = await database;
    return await db.query('fruit_chur', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_chur(int id, String description) async {
    final db = await database;
    await db.update('fruit_chur', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_chur(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_chur',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_chur() async {
    final db = await database;
    return await db.query('songinfo_chur');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_chur(int id) async {
    final db = await database;
    return await db.query('songinfo_chur', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_chur(int id, String description) async {
    final db = await database;
    await db.update('songinfo_chur', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_chur(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_chur',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_chur(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_chur',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_chur() async {
    final db = await database;
    return await db.query('fruit_detail_chur');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_chur(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_chur', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

// Insert a new fruit
  Future<void> insertFruit_fam(String name) async {
    final db = await database;
    await db.insert(
      'fruit_fam',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_fam() async {
    final db = await database;
    return await db.query('fruit_fam');
  }

  Future<List<Map<String, dynamic>>> getFruit_fam(int id) async {
    final db = await database;
    return await db.query('fruit_fam', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_fam(int id, String description) async {
    final db = await database;
    await db.update('fruit_fam', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_fam(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_fam',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_fam() async {
    final db = await database;
    return await db.query('songinfo_fam');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_fam(int id) async {
    final db = await database;
    return await db.query('songinfo_fam', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_fam(int id, String description) async {
    final db = await database;
    await db.update('songinfo_fam', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_fam(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_fam',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_fam(int fruitId) async {
    final db = await database;
    return await db
        .query('fruit_detail_fam', where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_fam() async {
    final db = await database;
    return await db.query('fruit_detail_fam');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_fam(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_fam', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_family(String name) async {
    final db = await database;
    await db.insert(
      'fruit_family',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_family() async {
    final db = await database;
    return await db.query('fruit_family');
  }

  Future<List<Map<String, dynamic>>> getFruit_family(int id) async {
    final db = await database;
    return await db.query('fruit_family', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_family(int id, String description) async {
    final db = await database;
    await db.update('fruit_family', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_family(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_family',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_family() async {
    final db = await database;
    return await db.query('songinfo_family');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_family(int id) async {
    final db = await database;
    return await db.query('songinfo_family', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_family(int id, String description) async {
    final db = await database;
    await db.update('songinfo_family', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_family(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_family',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_family(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_family',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_family() async {
    final db = await database;
    return await db.query('fruit_detail_family');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_family(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_family', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertFruit_bles(String name) async {
    final db = await database;
    await db.insert(
      'fruit_bles',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getFruits_bles() async {
    final db = await database;
    return await db.query('fruit_bles');
  }

  Future<List<Map<String, dynamic>>> getFruit_bles(int id) async {
    final db = await database;
    return await db.query('fruit_bles', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateFruit_bles(int id, String description) async {
    final db = await database;
    await db.update('fruit_bles', {'name': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit
  Future<void> insertSongInfo_bles(String info) async {
    final db = await database;
    await db.insert(
      'songinfo_bles',
      {'song_ref': info},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all fruits
  Future<List<Map<String, dynamic>>> getSongInfos_bles() async {
    final db = await database;
    return await db.query('songinfo_bles');
  }

  Future<List<Map<String, dynamic>>> getSongInfo_bles(int id) async {
    final db = await database;
    return await db.query('songinfo_bles', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateSongInfo_bles(int id, String description) async {
    final db = await database;
    await db.update('songinfo_bles', {'song_ref': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  // Insert a new fruit detail
  Future<void> insertFruitDetail_bles(int fruitId, String description) async {
    final db = await database;
    await db.insert(
      'fruit_detail_bles',
      {'fruit_id': fruitId, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve fruit details by fruit ID
  Future<List<Map<String, dynamic>>> getFruitDetails_bles(int fruitId) async {
    final db = await database;
    return await db.query('fruit_detail_bles',
        where: 'fruit_id = ?', whereArgs: [fruitId]);
  }

  Future<List<Map<String, dynamic>>> getAllSongs_bles() async {
    final db = await database;
    return await db.query('fruit_detail_bles');
  }

  // Update a fruit detail
  Future<void> updateFruitDetail_bles(int id, String description) async {
    final db = await database;
    await db.update('fruit_detail_bles', {'description': description},
        where: 'id = ?', whereArgs: [id]);
    _hasChanges.add(null);
  }

  Future<void> insertAllSongInfo_family() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_family(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_family() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Call to Worship (Sing)',
      'Call to Worship (Ulemu)',
      'Kunja Kuli Kucha Kodi?',
      'The Wonder of All',
      'Ningawa',
      'Banja Lachikhristu',
      'Pakakhala Chikondi',
      'Duwa',
      'Ndidzakondwa',
      'He Will Come',
      'Perekani Mitima Yanu',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_family(fruit);
    }
  }

  Future<void> insertAllSongs_family() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'Sing to the glory\nGlory glory glory to the Lord\nSing to the glory\nGlory glory glory to the King\nAmen',
      "Ulemu ukhale kwa inu Mbuye,\nndichigonjetso masiku onse\nInu mukhale mmitima yathu,\nmulamulire ku nthawi zonse\nAmen",
      "1. Kunja kuli kuca kodi?\nMlonda, tandiuze ’ne.\n"
          "Kodi nthanda yaturuka?\nKodi kunja kwacatu?\n"
          "Ukuona kodi kuti kwacadi?\n"
          "Ukuona kodi kuti kwacadi?\n\n"
          "2. Tifunsitse za ulendo,\nKodi ulikuthadi?\n"
          "Tayandikatu ku doko,\nKodi tingaoneko?\n"
          "Tingaone dziko lakumwambako?\n"
          "Tingaone dziko lakumwambako?\n\n"
          "3. Tipfuuletu kolimba,\nKunja kuli kucatu;\n"
          "Nthanda iri kuturuka,\nIoneka mwambamo.\n"
          "Kondwerani, tayandika kwathuko;\n"
          "Kondwerani, tayandika kwathuko.\n\n"
          "4. Tiri nao mau ace,\nOtitsogolera ’fe.\n"
          "Tithamangetu dzolimba,\nKuti tikafikeko.\n"
          "Pfuulani mokondwera m’mtimamo\n"
          "Pfuulani mokondwera m’mtimamo.",
      "1. There's a wonder of\nsunset at evening,\nthe wonder as sunrise I see\n"
          "But the wonder of wonders\nthat thrills my soul,\nis the wonder that God loves me\n\n"
          "CHORUS:\n"
          "All the wonder of it all,\nthe wonder of it all,\njust to think that God loves me\n"
          "All the wonder of it all,\nthe wonder of it all,\njust to think that God loves me\n\n"
          "2. There's a wonder of\nspring time and harvest,\nthe sky, the stars, the sun\n"
          "But the wonder of wonders\nthat thrills my soul,\nis the wonder that's only begun\n",
      "1. Ningawa mphwayi chala\nYehova waliko\n"
          "wakunipwererera mwe\nnyengo zonseswiii\n"
          "Niimbenge zakutemwa\nnalusungu lake\n"
          "chifukwa ndiyopela\nwakupwererera\n\n"
          "CHORUS:\n"
          "Ohh namulenji namuhanya\nmise nausiku\n"
          "walimaso pa ine\nkunivikilila\n"
          "Niimbenge zakutemwa\nnalusungu lake\n"
          "chifukwa ndiyopela\nwakupwererera\n\n"
          "2. Nanga chalu chinitinkhe\nniwererengecha\n"
          "chifukwa nkhumanya\nkuti Naye wakasugzika\n"
          "Pakuti wakatota\nname nitondenge\n"
          "chifukwa ndiyopela\nwakupwererera\n",
      "1. Banja la chikhristu\nlokondweretsa\n"
          "Banja lachikhristu laulemu\n"
          "Banja lachikhristu\nlodalitsidwaaa\n"
          "Chifukwa muzonse\nadalila Ambuye\n\n"
          "CHORUS:\n"
          "Kondanani\nmuzinthu Zonse\n"
          "Mmavuto mtendere\nnsadzalekanen\n"
          "Sangalatsanani\nnthawi zonse ee\n"
          "Kufikila imfa\nidzalekanitsenu\n\n"
          "2. Mamuna akonde\nmkazi wake\n"
          "Mkazinso amvere\nmamuna wake\n"
          "Chotero Ambuye\ndzadalitsanu uu\n"
          "Kufikila imfa\nidzalekanitsenu\n\n"
          "3. Mamveramvera\namapasulan\n"
          "Ndikulalata\nkumachotsa ulemu\n"
          "Banja ndi awiri\nwina osokoneza AA\n"
          "Kufikila imfa\nidzalekanitsenu\n",
      "1. Pakakhala chikondi\nbanja likondwa\n"
          "Pakakhala Chimwemwe\nbanja likondwa\n"
          "Mtendere ukhalitsa\nmasiku awo onse\n"
          "Akhala mumtendere\nakakondana\n\n"
          "CHORUS:\n"
          "Ndichikondi ×2\n"
          "Banja limasangalala\nndichikondi\n"
          "Ndichikondi ×2\n"
          "Banja limasangalala\nndichikondi\n\n"
          "2. Mnyumba muli chikondi\nakakondana\n"
          "Mulibenso madano\nakakondana\n"
          "Ana onse akondwa\nnamveranso makolo\n"
          "Moyo wawo ukondwa\nakakondana\n\n"
          "3. Mulungu akondwera\nakakondana\n"
          "Dziko lonse likoma\nakakondana\n"
          "Zonse zowazingazo\nzimawakondweretsa\n"
          "Mulungu akondwera\nakakondana\n",
      "1. Duwa lopambana\nndilo Yesuyo\nMtimanga mutiwe\nduwalo labwino\nMutipatuletu monga inuyo\nkuti ndionetsere\ninu mdzukoli\n\n"
          "CHORUS:\n"
          "Sop: Duwa\nAll: lopambana\nSop: lopambana\nAll: lopambana\nYesu mutiwe mkati\nmtima mwangamo\n\n"
          "2. Wochiritsa ndiinu\nnthenda zonsezi\nMukhalitse\nmmaganizowo athuwo\nTikuyamikani\nmfumu yathunu\nUlemerero ngwanu\nnthawi zonsezo",
      "1. Ndidzakondwa nkadzafika\nmmwamba\nntawoloka nyanja yamandala\nZovuta zonse zapadziko lino\nzitatha nditawomboledwa\n\n"
          "CHORU\nSop: Dziko\nAll: lamtendere\nSop: chisoni\nAll: kulibeko\nDziko lachimwemwe\nkukondwa kosaleka\nSop: Dzaimba Halleluya\nnditawomboledwa\n\n"
          "2. Ndzakomana nawo\nwokondedwa\nomwe ndalekana nawo\nmuimfa\nNdidzakhala ndi Yesu\nthawi zonse kumwamba\nnditawomboledwa",
      "1. We know not the hour\nof the Master's appearing\nyet signs all foretell\nthat the moment is nearing\nWhen he shall return\n'tis a promise most cheering\nbut we know not the hour\n\n"
          "CHORUS:\n"
          "He will come...\nlet us watch and be ready\n"
          "He will come...\nHalleluya hallelujah\nHe will come in the clouds\nof His father's bright glory\nbut we know not the hour\n\n"
          "2. We'll watch and we'll pray\nwith our lamps\ntrimmed and burning\nwe'll work and will wait\ntill the Master's returning,\nwe'll sing and rejoice\nevery omen descerning\nbut we know not the hour\n\n(He will come once then adzatu twice)",
      "1. Perekani mitima yanu,\nndipo mukhulupirire\nAdzatsogolera nonsenu\nopandanso matakazo\n\n"
          "2. Tamverani zomwe\nMzimu anena,\nakatenga nonsenu\nAdzatipatsa chigonjetso\ntikondwerera mwa Yesu\n\n"
          "3. Kodi simukudziwa kuti,\nndinu  kachisi wa Mulungu\nNdikuti Mzimu wake\nugona mwa inu,\nndipo ali opatulika\n\n"
          "4. Ana anu adzanenera,\nanyamata naona masomphenya\nAkulu adzalota maloto,\nndikadzatsanulira Mzimu wanga",
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_family(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_comf() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_comf(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_comf() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'NDAMVA MBUYE',
      'TSIKULO AKADZA YESU',
      'PAMENE DZIKOLI',
      'NDINALITU (BIBLE)',
      'GANIZA',
      'NDIKAONETSETSA',
      'KALIPO KAPHIMBA',
      'KULI DZIKO',
      'POONA',
      'ANADZA YESU',
      'CALL TO WORSHIP',
      'KODI YESU',
      'OLO MUNDINENE',
      'POPITA ANALONJEZA',
      'PODZATHA PA DZIKOLI',
      'NTHAWI ZINA',
      'IF I COULD GO',
      'OWERENGA',
      "CHIKONDI CHA MULUNGU",
      "AISRAERI",
      "NDAIMILIRA PAGOMBE",
      "N’DZALIMBIKA",
      'LADZANSO TSIKU LAKUPUMULA',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_comf(fruit);
    }
  }

  Future<void> insertAllSongs_comf() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      '''1. Ndamva Mbuye nthawi zonse ndataya ine chikondicho
Ngakhale ndimasochera mmapemphero Ambuye anditsatane.

CHORUS:
Ndibwerera kumoyo wosathawo
Mapemphero a Mbuye wanga anditsata mdziko lonseli.

2. Mchipululu ndi mmapiri ndayendamo mdziko lonse
Ngakhale ndimasochera mmapemphero Ambuyea nditsatane''',
      '''1. . Tsikulo akadza Yesu tidzayenda mumisewu yagolidi mmwambamo
Dzaoloka panyanjayo ndikuimba nyimbo zachikondi cha Yesu (taomboledwa)

2. Tikadzafika kumwambako tidzayenda monyadila ndikuimba ndi angelo
Dzaonana ndiokondedwa omwe tinalekana nawo padzikoli (linolapansi)

3. M’bale wanga siya tchimo popeza nthawi yatha Yesu adza posachedwa
Pobwera adzatipeze tonse tili okonzeka siya tchimo (lapamsanga)''',
      '''1. Sop: Pamene dzikolil ikupita kwawo
Alt: Ndianthu ambiri aiwala Mbuye
Ten: Monga nthawi ya Nowa anthu akuchimwa
Bass: Ali kudya kumwa chomwecho lero

CHORUS:
Adzalangidwa ndithu ndi moto tsiku ilo Yesu adzabwera
Tsono iwe m’bale wanga pereka mtima angofuna kuti upulumuke.

2. Sop, Alt, Ten: Tamvera m’bale wanga nthawi ikalipo imfa yake Yesu anapereka
Bass: Pereka mtima wako nthawi ikalipo angofuna kuti upulumuke

CHORUS:
Udzakondwera nudzadya naye tsiku ilo Yesu adzabwera
Tsono iwe m’bale wanga pereka mtima angofuna kuti upulumuke''',
      '''1. Sop: Ndinalitu osochera komamunandibweza
Mawu anu ndiwo nyali yakumapazi anga
All: awuuu uuuuuuu awuuu uuuuuuu

CHORUS:
Zikomo Mbuye wanga zikomoTate wanga Kamba ka Baibulo.

2. Ndinalitu osamvera koma munandibweza
Mawu anu ndiwo nyali yakumapazi anga.

3. Ndinalitu oochimwa koma munandibweza
Mawu anu ndiwo nyali yakumapazi anga''',
      '''1. Ganiza za moyo wako dziwa ndiwobwereka
Ndiwaka nthawi kochepa tsiku lina adzaufuna
‘sanyadenawo ‘satumbwe nawo podzikondweretsa n’dza m’dziko
Ganiza bwino mozama tsiku lamdima lisanadze.

CHORUS:
Wakufa sadziwa kanthubii wakufa saganiza
wakufas alingalira wakufa salankhula.

2. Konza lero mlandu wako panga ubwenzi ndi Yesu
Mlole Iye alamulire moyo wako nthawi zonse
Poti sudziwa tsiku la imfa mwina udzafa pangozi
Pena kuphedwa nd’achiwembu konza moyo usanafe''',
      '''1. Ndikaonetsetsa (ine) zachikondi cha Mbuye (wanga)
Anandifera inee Yesu u wanga.

CHORUS:
Ngati pali bwenzi londikonda ine ndi Yesu
Kodi mukudziwa aa amandikonda.

2. Tsiku lina (ine) ndinadwala (ine) anandichiza Mbuye wangayo
Mbuye wangayo ali ndi ine
Kodi mukudziwa aa amandikonda''',
      '''1. Dzanja la Mbuye sili lofupika maso ake sali akhungu
Khutu la Ambuye silogontha kuti sangamve pemphero
Koma kalipo kaphimba.

CHORUS:
Mudzapemphera osayankhidwa mudzasala kudya osamveredwa
Mudzayesa kugwira ntchito osapeza phindu
Koma kalipo kaphimba.

2. Pamene Yona nazemba Yehova nakwerachombo chaku Tarisi
Chozizwitsa chinadza tipange mayere kuti tipeze vutolo
Koma kalipo kaphimba''',
      '''1. Kuli dziko labwino mmwamba lakuwala koposa dzuwa
Ndi Atate akonza malo pokhalira ife komweko.

CHORUS:
(Bwinoli) bwinoli iii tipita
(Bwinoli) bwinoli ii tipita
(Ohhh bwinoliii) bwinoli iii tipita
Tikomana kudziko lija aaaaaa tikomana kudziko lija
Aaaa tikomana kudziko lija.

2. Tidzaimba komweko nyimnbo za abwino omvera Yesu
Sitidzamvatu zisoninso tidzakondwa masiku onse''',
      '''1. Poona zovuta za mdzikoli moyo wanga ukhumba mzindawo
Omwe Mbuye wanga waukonza ndikakhalako.

CHORUS:
Ndipita kwathu kulibe zowawa angelo ayimba ndikakhalako.

2. Khomo lakumwamba n’lotseguka kwa yense wokhulupira iye
Tenor: Nzakondwa podzaimba nyimbozo
All: Ndikakhalako''',
      '''1. Anadza Yesu ku Betisaida anampeza munthu osaonayo
Nagwiradzanja lawakhunguyo napita naye kunja kwa mudzi x2.

CHORUS:
Anaika malovu mmaso naikanso manja paiye
Uona chani Yesu anamfunsa ndiona anthu ngati mitengo x2.

2. Anaikanso manja paiye chifukwa sanapenyetsetsadi
Anachiritsidwa napenyetsadi naona zones moyeneratu.

CHORUS:
Anaika malovu mmaso naikanso manja paiye
Uona chani Yesu anamfunsa ndiona zones moyeneratu ×2
Ending: Ndiona anthu ngati mitengo ndiona zones moyeneratu.''',
      '''MBUYE MUNDIPATSE

Mbuye mundipatse chisomo chanu
Nditumikile Inu nthawi zonsezo
Aaameen.


YANG’ANANI KWA YESU

Yang’anani kwa Yesu, ee! yang’anitsitsani ‘ye!
Ndipo za pa dziko zizimadi, pakuona kuwala kwake
Aaameen.


USAMANONG’ONA

Usamanong’ona nkachisi muno
Udzikhala chete, kumvetseratu
Sop: Nyang’ama
All: nyang’ama poyenda muno
Sop: Popeza
All: Ndi mnyumba ya Mlungu wathu
Aaameen.
''',
      '''1. Kodi iii Yesu asamalira n’kasowa chimwemwe
Inde asamala
Ndikapsinjika ndikuda nkhawa njira yonse yaitali
Inde asamala

CHORUS:
Ndidziwa amasamala inde ndikavutika
Ndithu masana ndi usiku amandisamalirane

2. Kodi ii Yesu asamalitsa muusiku oopsa
Inde asamala
Pamene kwada zoopsa zadza andisamalabe kodi
Inde asamala''',
      '''1. Olo mundinene mundinyoze n’khale mundiseke
Olo munditukwane eee n’khale mundizunze
Sindidzasiya kulalika uthengawu mpaka Iye adzabwera

CHORUS:
Mpaka Iye adzabwera mpaka Iye adzabwera aaa
Sindidzasiya kulalika uthengawu mpaka Iye adzabwera

2. Olo mundichotse sukulu ngakhalenso ntchito
Olo muphe ananga eee n’khale mun’thetsere banja
Sindidzasiya kulalika uthengawu mpaka Iye adzabwera''',
      '''1. Sop: Ambuye pa ntanda paja, anafa imfa yomvetsa chisoni
Kupulumutsa iwe ndi ine, kuti ukalowe mwamba

CHORUS:
Popita analonjeza, ndikupita kukakonza malo
Kuti komwe ine ndikakhale, nanuso mukakhaleko

2. Tennor: Zili kwa iwe m’bale wanga, kusankha njra imodzi
Ya Yesu kapena ya satana, khomo ndilosatseka''',
      '''1. Podzatha pa dzikoli, ine n’dzayimba
Alleluya, alleluia
Podzavala korona ine n’dzayimba
Sop: Alleluya
All: Alleluya kwa mfumuyo x2

CHORUS:
Alleluya yimbani, kuyimbira mfumuyo
Sop: Mphamvu yake imveke ponsepo
All: oh! Oh! Oh! Tikupita kumwamba, tikapumula
Sop: Tidzakondwa
All: Nthawi zones x2

2. Mwamba mulibe matenda, malironso kulibe
sop: Tidzayimba nd’angelo mwambamo
All: oh! Oh! Oh! Tidzakhala muyaya, pamodzi ndi Yesuyo
Sop: Tidzakondwa
All: Nthawi zones x2''',
      '''1. Nthawi zina ndikakhala m’dzikoli ndimadzifunsa
Pamavuto omwe ndidutsamo kodi asamalane
Banja langa kutha ntchito yanga kutha
Kodi asamalane

CHORUS:
Umfotokozeretu Yesu vuto lako nkhawa zako
Fotokoza fofokoza
Adzakupatsawe zosowa Yesu bwenzi lokonda

2. Ndikakumbuka nthano ya Hannah, Loti ndi Lazaro
Anapemphera kwa Yesu Mbuye ndipo anayankhidwa
Usakaikile usadele nkhawa dziwa asamalawe''',
      '''1. If I could go beyond the blue
I wonder how my mind could dream
If I renew redemption life
surely someday I’ll ever beyond the blue

CHORUS:
Surely someday I’ll fly away on the wings of glory
To see my savior’s face of truth
Sure someday I’ll ever beyond the blue

2. When we shall see our father’s face
Then we shall enter heaven’s land
Then we shall walk in harmony
Surely someday I’ll ever beyond the blue''',
      '''1. Owerenga Khala mmaso, poti nthawi yafika
Yomwe Yesu ananena zakudzanso kwake

CHORUS:
Ndiona njala, nthenda, imfa, nkhondo, anthu kudzikonda aaa aa
Nanga iwe mbale uonanji? Yesu akubwera

2. M’mene tiona zizindikirozi kodi m’bale wakonzeka?
Popeza Yesu adzatenga olungama okha''',
      '''1. Chikondi cha Mulungu, chindidabwitsa
Kupeleka mwana wake, kundifera ine

CHORUS:
Alto: oh! oo!
Nanga iwe m’bale utani, idza upumule
Ona Yesu wakufera, bwera upumule x2

2. Konzekera tsikulo, layandikatu
Yesu Mbuye akubwera kudzatenga ife x2''',
      '''1. Aisarayeli potuluka mu iguputo
Analipo ena atinkenawo
Nalephera kukafika dziko lija
Limene Mbuye wawo nawakonzera x2

CHORUS:
Sop: oh yendanibe
Yendanibe
Tiyendebe pamodzi tiyendebe
Podziwa kuti nthawi yatsala pang’ono ng’ono
Mpaka tikafike dziko lakwathu x2

2. Tisayese Mlungu dala monga Isarayeli
Pamene tili pa ulendo wathu onka mwamba
Ngakhale paulendowu zovuta zilipobe
Mopilira tikafike kumwamba x2''',
      '''1. Ndaimilira pagombe, ndiyang’anitsitsa
Ku kenani wabwinoyo, komwe ndidzalowa x2

CHORUS:
Bass: Tidza
Tidzapumula, mdziko londwa, Kuoloka pagombe lija
Bass: Tidza
Tidzayiba nyimbo ya mose
Ndikukhala ndi Yesu nthawi zonse x2

2. Pamadambo akuluwo, ‘dzawala tsikulo
Khristu adzalamulira, nadzachotsa mdima x2''',
      '''1. N’dzalimbika mwa Khritsu, n’dzamvetsera mauwo
Yesu atsogoleye, awalire njirayo x2

CHORUS:
Mongatu Yohaneyo, mongaso Pauloyo
N’dzalimbika osagwa, n’dzayedabe ndi Khristu x2

2. Imfa ikuthamanga, Mwambanso tayandika
Msanga tipumuladi, zowawa zidzathanso x2''',
      '''1. Ladzanso tsiku kalupumula, lodzalitsidwa ndi Mlunguyo
Iye napuma ntchito zakezo, ndipo afuna tipumulenso

2. Tiyeni tonse pa sabatali, timveretu kufuna kwakeko
Tsono poyimba ndi kupemphera, iye adzakondwera nafetu

3. Mbuye mutchere khutu lanulo, mumve pemphero la tiana ‘fe
Kumbukirani lonjezanolo, mupulumutse otaikawo

4. Inu Atate wakumwambako, ndinu wakutitchinjiriza ‘fe
Ndinu wakutitsogoleranso, tikuongani nthawi zonsezo''',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_comf(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_fam() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_fam(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_fam() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_fam(fruit);
    }
  }

  Future<void> insertAllSongs_fam() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_fam(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_kab() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_kab(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_kab() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_kab(fruit);
    }
  }

  Future<void> insertAllSongs_kab() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_kab(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_new() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_new(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_new() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_new(fruit);
    }
  }

  Future<void> insertAllSongs_new() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_new(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_path() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_path(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_path() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_path(fruit);
    }
  }

  Future<void> insertAllSongs_path() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_path(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_tow() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_tow(info);
    }
  }

  Future<void> insertAllSongInfo_tawo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_tawo(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_tow() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_tow(fruit);
    }
  }

  Future<void> insertAllSongs_tow() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_tow(id, song);
      id++;
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_tawo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_tawo(fruit);
    }
  }

  Future<void> insertAllSongs_tawo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_tawo(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_young() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_young(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_young() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_young(fruit);
    }
  }

  Future<void> insertAllSongs_young() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_young(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_zib() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_zib(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_zib() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_zib(fruit);
    }
  }

  Future<void> insertAllSongs_zib() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_zib(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_bles() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_bles(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_bles() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
      'Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_bles(fruit);
    }
  }

  Future<void> insertAllSongs_bles() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
      'You can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_bles(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_chur() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'CS#186',
      'Camp Meeting Song: 2011.',
      'Lord Lead Me on: Radiant Joy #130',
      ' CS#98',
      '''Am I a Soldier of the Cross?
       Arranged by M. W. B. Blake.''',
      'Camp Meeting Song 2017',
      'Camp Meeting Song 2018',
      'Camp Meeting Song 2019',
      'The Sunlight of Love :fossetts #80.',
      'CS#48',
      'Must I Go, Empty Handed?\nReformation Hymnal #310',
      'CS#93',
      ''' Is there a man?
   Handel’s Saul, CHORUS: 57''',
      'CS#245',
      'CS#296',
      'CS#194',
      'CS#178',
      'CS#158',
      'CS#204',
      'CS#266',
      ' CS#267',
      'CS#268',
      'CS#217',
      'CS#269',
      ' CS#226',
      "Where’re Thou Goest\nNAC Hymn Collection #78",
      'CS#77',
      'CS#201',
      "I’m a Pilgrim\nOld SDA Hymnal#666",
      " Glorious Things of Thee\nOld SDA Hymnal#304",
      'Camp Meeting Song 2022',
      'Camp Meeting Song 2020',
      "Sang by 'One Joy' of Chiwembe",
      "More like the Master\nsoul stirring songs & hymns# 320",
      'Camp Meeting Song: 2013.',
      'NAC Hymn Collection#12.',
      'Camp Meeting Song: 2021.',
      'Camp Meeting Song: 2024.',
      'Camp Meeting Song: 2023',
      'Dorcas #74',
      'Dorcas #76',
      'Dorcas #28',
      'Dorcas #83',
      'Dorcas #105',
      'Hymn & Tune #1404.',
      'Matchless Gift #42.',
      'Camp Meeting Song: 2025',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_chur(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_chur() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Tabwera M’nyumbayi ',
      'Owomboledwawo',
      'Pakuda Njira Yanga ',
      'Mombolo Akhale Nane',
      'Kodi Ndine Msirikali?',
      'Kuli Dziko M’mwamba',
      'Yesu Analonjeza Adzabweranso',
      'Yesu Mbuye Adza Posachedwa',
      'Chikondi Cha Mulungu',
      'Chimwemwe Podzatha Ntchitoyi',
      'Kodi Ndipite Chabe?',
      'Sabata Nla Kupuma',
      'Ndani Munthu?',
      'Dzina Lokhalo La Yesu',
      'Mbuye, Tsogolereni',
      'Pakakhala Chikondi',
      'Mmamawa Kapena Poturuka Dzuwa',
      'Masika A Dziko Ayandikatu',
      'M’dziko La Alendo',
      'Yesu Nditsata Inu',
      'Tisonkhanitse Zabwino',
      'Mbuye, Nyanja Yakalipa',
      'Mbuye! Chikondicho',
      'Mpulumutsi Wozizwitsa Ndi Yesu',
      'Pang’onong’ono Kukopedwa',
      'Ndipita Mbuye',
      'Kufunatu E! Ndi Mtina Wonse',
      'Mtima Wanga Unaopa Yehova ',
      'Ndine Mlendo',
      'Ndinva Za Ulemerero',
      'ndani Apite?',
      'Akudza Posachedwa',
      'Polowa ndi Yesu',
      'Ine Ndifuna',
      'Sindidera Nkhawatu Za mawazo',
      'How lovely is Zion',
      'Ndzayenda Naye',
      'Tatanganidwa ndi Zamdziko',
      "Yesu m'busa akufuna nkhosa",
      'Ndionetse Yesu',
      'Ndikaganiza',
      'Kodi Tikhala Mfupi?',
      'Chinsisi cha Ukwati',
      'Uthenga Wabwino',
      'Jerusalem my Glorious Home',
      'Living in the Sunshine',
      'Adzamvetsetsa',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_chur(fruit);
    }
  }

  Future<void> insertAllSongs_chur() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      '''1.  Tabwera m’nyumbayi, Pa maso panupo;
    Idzani Mbuye Mkhaletu pamodzi nafenso.

3.  Ndi Mzimu wanuyo Atithangatebe
    Kumvera mau anuwo, Tikhale anudi.

4.  Muticotseretu Zoipa zathuzo;
    Mukadzafika tsikulo, Mtitenge kwanuko.
''',
      '''1.	Owomboledwawo adzayimba uko nyimbo za chimwemwe mmwambamo;
nyimbo zokomazo kutamanda mbuye Yesu mpulumutsi wawo.

CHORUS:
 Sop:  Ndidzamtamanda Yesu Mbuye pa tsiku la chimwemwelo;
  mdziko lomwe kulibe imfa ndi zowawa zonse.

Others:
Ndidza-mta-ma Yesu Mbuye pa tsiku la chimwemwelo mmwambamo.
La chimwemwe imfa kulibe; imfa ndi zowawa zonse (kwathuko).

2. Ngakhale tiyimba mdziko lapansiri zisoni ziri ponseponse;
akadza Yesuyo tsiku la chimwemwe tidzakhala wosafanso.

3.	Ndikasiya tchimo kusunga lamulo ndzakhala ndi Yesu kosatha.
Mbuye ndisungeni kukhala wanudi mpaka tsiku la chimwemwe.
''',
      '''1.	Pakuda Njira Yanga ndiwona kutalika;
Yesu Mbuye..........Ntsogozeni..........
Iwale njira yanga mwa chisomo chanucho;
Mbuye wanga..........Ntsogozeni (nthawi zonse)

CHORUS:
Ntsogozeni.........nthawi zonse.........Ndiyendetu..........mchiyerocho..........
Nkana 'bwenzi..........andisale..........Yesu Mbuye.......... ntsogozeni.
                                   
2.	Mudziko lobvutali mopanda chembekezo.
Yesu Mbuye..........Ntsogozeni..........
Ndikhulupira Inu mpaka ndzanke kumwamba;
Mbuye wanga..........Ntsogozeni (nthawi zonse)
''',
      '''1.  Mombolo akhale nane, Kwenda ndekha sinditha
Akhale pafupi nane, Ang’wire m’dzanja lake.

CHORUS:
Sindidzaopa nthenda (E! nthenda), Akanditsogolera (tsogoza)
Ndzapita wosang’ung’uza, Kutsa mapazi ’ke.

  2.  Mombolo akhale nane, Nd’yende m’njira ya moyo;
  Kupyola mayeso onse, Ndikumenyana nkhondo.

  3.  Mombolo akhale nane, Kuti andisogoze;
  Kufikira nditafika, Ku tsidya lina lija.
''',
      ''' (Verses 1&2; for Sop & Tenor)
1.	Kodi Ndine Msirikali wa Yesu Mbuyeyo.
Ndirekeranji kunena za dzina lakero.

2.	Kodi ndinganke ku mwamba muntendere mokha;
Pomwe ena nazunzika kamba kamphothoyo.

(All)
3.	Tsono ndimenya nkhondoyo Mbuye mlimbitse 'ne;
Ndzalimba mzowawa zonse potsamira Inu.

CHORUS:
Nkangonjetsa nkhondo ndzabvala kolona (Oo) bvala kolona 
(Oo) bvala kolona.
Nkangonjetsa nkhondo ndzabvala kolona mu Yerusalemuyo.
Kolona.........Wamoyo..........Mphotho yopambanayo.
Nkangonjetsa nkhondo ndzabvala kolona mu Yerusalemuyo.
''',
      '''1.	Kuli dziko m’mwamba kopanda usiku,
n’dzakhalako mu’lemerero (m’mwamba).
Komwe n’dzapumula ndi oyera mtima;
n’dzakhala ndi Mbuye komweko (konko).

CHORUS:
N’dzakhala ndi Mbuye komweko (uko),
m’dziko lokongola lowala (m’mwamba).
Ndi owomboledwa pagombe lodala;
n’dzakhala ndi Mbuye komweko (m’mwamba).

2.	Nyimbo zizanveka zochiza mitima
ndi chikhamu chosaneneka (m’mwamba),
powona nkhope ya Mbuye wachisomo;
n’dzakhala ndi Mbuye komweko (konko).

3.	Ndigwirabe ntchito mpaka n’peze mphotho, 
ya ulemerero wosatha (m’mwamba).
Kwathu kwa muyaya pagombe lodala;
n’dzakhala ndi Mbuye komweko (konko).
''',
      '''1.	Yesu analonjeza adzabweranso
Kudzatenga omkonda Iye
Akakhale komwe kulibe zowawa
Ochita chifuniro Chake.

CHORUS:
Posachedwa aonekera m’mitambo
Konzeka kukomana Naye
Odala ochita chifuniro Chake. 
Adzakhala Naye muyaya. 

2.	Ubvomereze tchimo ndikulisiya
Adzakuchitira chifundo
Yesu polola kukhomedwa pamtanda
Kunali kukukonda iwe. 

3.	Zochitika mdziko lapansi zinena
Yesu abwera posachedwa
Mtima wako pereka kwa Yesu lero
Pamene ukali ndi moyo
''',
      '''1.	Yesu Mbuye adza posachedwa kulamula dziko (kosatha) 
Tikonzeke kukomana naye pobweranso iye (pakudza)

CHORUS: 
Sop:
Akudza posachedwa kulamula dziko 
chimwemwe chopambana pakubwera iye 

Others:
Akudzatu posachedwa kulamula dziko (kosatha)
chimwemwetu chopambana pakubwera iye (pakudza)


2.	Ngakhale achedwa kubwerako kudzalamulira (kosatha)
konzekabe kukomana naye pobweranso iye (pakudza)

3.	Ndiwe wotani pakudza iye kulamula dziko (kosatha) 
kodi wakonzeka kumgwadira pobweranso iye (pakudza)
''',
      '''1.	Chikondi cha Mulungu chiwala mnjira mwanga;
Mdima wonsewo uthawa.
(Mdima wonsewo utha, mdima uthawa )
Ndiyimba za Chikondi chogonjetsa uchimo;
Ee ndiyimba nthawi zonse
(Ee ndiyimba nthawizo, nthawi zonsezo)

CHORUS:
Tenor:
Ndikondwa ndi-ne wa-ke, pansi pa mtimanga.
Chikondi cho-da-bwi-tsa chakopa ine, kopa inedi.
Sindzasochera, sindzayendanso njira za uchimo, za uchimo.
Ndikondwa ndi-ku-pi-ta kwathu ku mwambako; kwa muyaya.
Others:
Ndikondwa kuti ndine wa Yesu pansi pa mtimanga.
Chikondi chake choposa zonse chakopa inedi.
(Sindidzaso-che-ra-nso)
Sindzasochera, sindzayendanso njira za uchimo. 
Ndikondwa kuti ndiri kupita kwathu ku mwambako.(kwa muyaya.)

2.	Kuchokera mmwambamo chikondi chiwalabe;
Chitsogoza 'ne mchiyero.
(Chitsogoza 'ne mchiyero, nthawi zonsezo)
Nkokoma nanga kuyenda ndi Yesu bwenziro;
Ponka kwathu kwatsopano (Ponka kwathu kwatsopa, kwatsopanoko.)
''',
      '''1.	Chimwemwe podzatha ntchitoyi, podzasonkhana okukha,
Alikudza ndi zipatso, ku Yerusalemuko.

CHORUS:
Kudzakhala chimwemwedi,
Chimwemwe cha nthawi zonse,
Chifukwa nthawi yafika,
Yosonkhana okunkha.

(Bass & Tenor)
Chimwemwe posacedwa,
Chimwemwe cha muyaya,
Chifukwa nthawi yafika, 
Yosonkhana okunkha.

2.	Tidzayimba nyimbo zabwino, tidzayamika mokondwa,
Tidzatama Khristu Mfumu, mu mzinda watsopano.

3.	Chimwemwe chitidikirako, Ku malo a chikhuduwo;
Yesu ali kuwakonza, mu Mzinda watsopano.
''',
      '''1.	Kodi ndipite chabetu pokomana ndi Mbuye?
Wosagwira ntchito yake wopandanso kanthuyi?

CHORUS:
Kodi ndipite chabetu pokomana ndi Mbuye?
Popanda wopulumuka kodi ndipite chabe?

2.	Kumwalira sindiopa adzandiwukitsa 'Ye.
Pokomana ndi Mbuyeyo kodi ndipite chabe?

3.	Akhristu nonse dzukani gwirani ntchito lero.
Bwenzani wosocherawo mukadali ndi moyo.
''',
      '''1.	Sabata nla kupuma, ndi la chimwemwecho,
Ndi tsiku lotonthoza, lokometsetsatu;
Akuru ndi ang’ono, tigwade tonsefe,
Tiyimbe kwa Woyera Wa nthawi zonsezo.

2.	Sabata liri ngati chochinjiriza ’fe,
Ndi monga ngati munda wotupa mdambomo;
Litsitsimutsa m’yoyo ya akutopawo,
Popuma pa sabata tiona mwambamo.

3.	Ndi tsiku lakusinkha, ndi la chikondicho,
Lakuyanjana nazo za mwambamwambamo;
Tipeze zakukoma zoposa zinazo,
Tifuna kupumula kosatha mwambamo.''',
      '''1.	Ndani munthu mntchito zake akondwetsa Mlungu yekha;
Adani ake agonja, adani ake agonja; pokopeka ndi chikondi
akhumba kuchita bwino.

CHORUS:
Bass: Mkwiyo nukhala chikondi chiko-ndi mkwiyo nukhala chikondi.
Tenor & Alto: Mkwiyo nukhala chiko-ndi mkwiyo nukhala chikondi.
Soprano: Mkwiyo chiko-ndi mkwiyo nukhala chikondi.


2.	Khala monga Yesu Mbuye kondweretsa Mlungu yekha;
Adani ako agonja, adani ako agonja; pokopeka ndi chikondi
akhumba kuchita bwino.

Ending 
Mkwiyo wawo, mkwiyo wawo nusungunuka chikondi;
Akhumba kuchita bwinoooo…''',
      '''1.	Dzina lokhalo la Yesu, Ndilo dzina lokoma;
Likondwetsa ‘ngelo m’mwamba, Ndi Akhristu tonsefe.

CHORUS:
Dzina, dzina, Palibe longa la Yesu,
Dzina, dzina, Palibe longa la Yesu.

2.	Dzina lokha ndi la Yesu, Pamene ndibvutika;
Dzina lokha ndi la Yesu pamene ndikondwera.

3.	Ndikufuna kudzamwona, Podza mu’lemerero,
Ndidzamve Wachita bwino, Ndidzakondwererako.

4.	Ngat’afuna n’gwire ntchito, M’munda wake wa mpesa,
Kuli bwino Yesu yekha, ‘Dalitse ntchito zanga.

5.	Ngat’afuna kuti ndife, Akhudze thupi langa,
Kukhale bwino ndi Yesu, Ndikhulupira mwa ‘Ye.''',
      '''1.	Mbuye, tsogolereni, Bwino, bwino panjira;
Ndipezemo mtendere, Ndidzakhala wokondwa.

CHORUS:
Mkatsogola ndiopa kuatika (a Mbuye)
Poti moyo uzunza (zunza), Tsogolereni Mbuye (a Mbuye).

2.	Thanthwe langa ndi Inu, Ndikabvutika m’moyo;
Mukakhala pafupi, sindimaopa kanthu.

3.	Mtsogole mpaka komwe, Kudzathera zobvuta;
Dzikola la usana, Misozi adzacotsa.''',
      '''1.	Pakakhala chikondi, Banja likondwa; 
Pakakhala chimwemwe, banja likondwa
Mtendere ukhalitsa, Masiku awo onse;
akhala mu mtendere, Akakondana.

CHORUS:
Chikondi mbanjamo;
Akhala mu mtendere,
akakondana.

2.	M’nyumba muli cimwemwe, Akakondana;
Mulibenso madano, Akakondana.
Ana onse akondwa, Namveranso makolo;
Moyo wao ukondwa, Akakondana.

3.	Yesu mndilandire ‘ne, Ndidzakondadi;
Munandifera ine, Ndidzakondadi
Ndidzapumla ndithu, Wopanda nkhawa konse;
Mwa chifundo chanucho, Ndidzakondwadi''',
      '''1.	Mmamawa kapena poturuka dzuwa,
Ambuye Yesuyo ‘dzafika ndi mphamvu
Ndi ulemerero wokuru kutenga
Anthu ace mu ace mu dzikoli.

CHORUS:
Yesu, Mbuye wathu, ‘Dzayimba mokondwa liti?
“Khristu adza, Khristu adza, Aleluya amen,
Aleluya amen.”

2.	Kapena usana kapena madzulo,
Kapena usiku pamene Ambuye,
Dzafika mu ulemerero kutenga
Anthu ake mu dzikoli.

3.	Tidzakondwa ngati tidzanka osafa,
Opanda kudwala, chisoni maliro;
Kungokwatulidwa podzadza kutenga
Anthu ake mu dzikoli.''',
      '''1.	Masika a dziko ayandikatu, Aitana Mbuye okololawo;
Ndi minda yeyera pa dziko lonse, Ndi mwini zotuta wayandikanso.

CHORUS:
Dzanitu msanga, Tengatu zotuta; Mdzatitenge ‘fe, Kwathuko.

Alto, Tenor, & Bass;
Idzanitu angelo, msangatu; Tengereni zotuta mmwambamo.
Mudzatengetu ife, kunkatu, Kwathu mmwambamo.

2.	E, tsiku lopanda misozi konse, Layandika kudza mothamangatu;
Akubalalika ndi uchimowo, Mwasonkhetu nthawi isanathei.

3.	Ikomatu ntchito ya chikondicho, Kasupe wosaphwa wa kumwambako;
Chikonditu ndicho chiitana ‘fe, Chigwiritsa ntchito, Chibalitsatu.''',
      '''1.	M’dziko la alendo, Komwe ukhala,Imva kuitana, “Mwana wanga!”

CHORUS:
Bwera wosocera! Bwerera Kwanu!Wasocera Kutali; “Bwera kwanu!”

2.	Wasocereratu;Subwera kodi?Wakhulukidwa, “Mwana wanga!”

3.	Gome lilindira, Suiwalika!Udzadye upume, “Mwana wanga!”''',
      '''1.	Yesu nditsata Inu, Ndamva mundiitana; Nkonda Inu, ndidzadi, Munditsogolere.

CHORUS:
Ndikutsatani, ndikutsatani, Ndikutsatani komwe muntsogoza.

2.	Timaso tiphophonya, Mapazi asocera; Ndifooka mwinamo, Mundilimbikitsa.

3.	Zisoni zindipinga, Ndipusa ndi zoipa, Ndidzalimbikitsidwa, Potsatira Inu.''',
      '''1.	Tisonkhanitse zabwino, Mnjira mwathu monsemo;
Tisunge tirigu yekha, Titaye zacabezo;
Tipeze zokondweretsa Mmadalitso a lero,
Mwa chipiriro tichotse Minga yokhumudwitsa.

CHORUS:
Ufese zachifundo, Ufese zachifundo
Ufese zachifundo, Zomwe tidzakolola.

2.	Sitisamala maluwa Ndi mbalame poyimba,
Mpaka mbalame ndiponso maluwa zitachoka;
Dzuwa sitirisamala Pa nthawi ya cilimwe,
Akafikanso mazizi Nthawiyo tilifuna.

3.	Mwana akachita ngozi Poswa chikho chomwera
Kodi mukalipa ko’psa Poturutsa tsinyalo?
Mukadziwa kuti mawa Adzakhala wakufa,
Kodi pakukwiya naye Mupsa Mtima leroli?

4.	Poganizira za m’mbuyo Za zomwe tinachita,
Za mauwo okalipa Okhumutsidwa ena,
Ndi nchito zosaganiza; Izi zitikumbutsa
Kufesatu zachifundo zomwe tidzakolola.''',
      '''1.	Mbuye, Nyanja yakalipa, Mafunde akweretsa!
Mlengalenga nawonso wada; Kodi tifere m’madzi;
Kodi simukusamala, Mugoneranjiko?
Pamene ife tiri ndi mantha, Kodi tifere m’madzi?

CHORUS:
Namondweyo andimvera Ine, bata du! (Bata du!)
Ngakhale Nyanja zikalipe, Ziwanda, anthu, ngakhale zinazo,
Madzi sangamize bwato Mwini Nyanja ndi mtunda ali momwemo;
Zonse zingondimvera Ine; Batu du, bata du! Zonse zingondimvera Ine; Batadi du!

2.	Mbuye bvuto mu mtimamu Landibvuta leroli;
Kuchirimika konse kwatha; Ndipulumutsenitu
Nkhwenkhwe ya tchimo yozunza, Inditsirizitsa;
Ndamuka ine, ndamuka, Mbuye! Dzandipulumutseni.

3.	Mbuye zobvutazo zatha, Kwagwa bata tsopano,
Kwawala ngati kalirole, Ngati ndiri Kumwamba;
Msandisiyenso Ambuye, Tikhale Pamodzi;
Ndikafike ku gombe lodala, Mukandipumulitse.
''',
      '''1.	Mbuye! Chikondicho m’natifera,
Chosandiyenera, ndidza kwanu;
Ndidziperekatu mphatso zanga zonse,
Sindidzamanatu chiri chonse.

2.	Wondipembedzera ndinu nokha
Ndiyembekezera pa Inutu;
Senzeni mtandawo ndiuze chikondi
Kuti ndingachite chinthu china.

3.	Zonse ndiri nazo nzolandira
Monga masikuwa akupita,
Ntchito yacikondi yayambidwa kale,
Otaika ena tikabweze.

4.	Zonse ndiri nazo mwandipatsa,
Ndipatsa kwa Inu Ambuyanga.
Nditafika m’mwamba moyo wanga ngwanu,
Chinthu china nchanu nthawi zonse.''',
      '''1.	Mpulumutsi wozizwitsa ndi Yesu, Mpulumutsi wozizwitsa,
Andibisira moyo wanga m’thanthwe, Ndiona zokondweretsa.

CHORUS:
Andibisira moyo wanga m’thanthwe, aphimba dziko louma;
Moyo wanga aika pobisika, An’phimba ndi dzanja lake.
An’phimba ndi dzanja lake.

2.	Mpulumutsi wozizwitsa ndi Yesu, Anditulira Katundu,
Andichirikiza sindidzasowa,Wondipatsa mphamvu ndiye.

3.	Ndikabvekedwa zowala ndiyera, Kukomana naye m’mwamba,
Ndapulumukadi, m’chikondi chakeN’dzafuula ndi anzanga.''',
      '''1.	Pang’onong’ono kukopedwa; Pang’onong’ono kumlandira,
Wina akutero, “Pita, Mzimu, pita, Ndikaona nthawi n’kuitana.”

2.	Pang’onong’ono, lero idza; Pang’onong’ono usalubze,
Yesu akwitana, angelo mpafupi, Anthu akupempha, Bweranitu.

3.	Pang’onong’ono mwayi wathaa; Pang’onong’ono tsoka ladza!
Kuchedwa simwayi, ndi tsoka loopsa. Ha, adaliradi, Ndachedwatu!''',
      '''Ndipita Mbuye konse komwe mufuna, ndipita Mbuye ku ntchito Yanu.
Ndipita Mbuye konse komwe mufuna, ndipita Mbuye ku ntchito Yanu.
ATB:   Kufuna kwanu,
SAT:   zisoni zanu,
All:   Chimwemwe chanu zikhalenso zaine;
SAT:   Nkana ine ndidedwe ndithu;
ATB:   mpaka imfa ndzatumikira ‘Nu;
(SA: Yesu) Imfa, imfayo; munayigonjetsa (AT: gonjetsa).
Imfayo munayigonjetsa (AT: gonjetsa).''',
      '''1.	Kufunatu E! ndi mtina wonse, Kufuna akusocherawo;
Lalika kuti Yesu anati, Idzani nonse kwa Inetu.

CHORUS:
Pitanitu (inde) konseko konseko, Mukabwere ndi (anthu) osochera;
M’khola lake la (Yesu) Mpulumitsi Nafera ‘Ye anthu (E) ochimwa.

2.	Kufunatu ndi kutsogolera, Anthu ofo’kawo kwa Yesu;
Kutsogolera njira yabwino,Yonka ku moyotu wosatha.

3.	Tidzitero ponka kulalika, Kutsata Yesu tsiku n’tsiku;
Ndi kuthangata ofo’ka onse, Kuwatsogolera kwa Yesu.''',
      '''1.	Mtima wanga unaopa Yehova Ntakanikizidwa pansi ndi chimo;
Ndamulirira Ambye m’thopemo, Anandibvuulamo mwa chifundo.

CHORUS:
Anandibuula m’matope, Nandikhazikitsa pa thanthwe;
Moyo wanga lero uyimba, Matamando Haleluya.

2.	Wandikhazika pa thanthwe lolimba, Ndakhazikitsidwa sindichokapo;
Pano palibe choopsya ndakhala, Chisomo chidzandibveka korona.

3.	Ndidzayimba nsisi mwandichitira, Ndzalimbika mpaka onse amdziwe;
Chipulumutso ndzayimba konseko. Kuti ambiri amvere Mulungu.''',
      '''1.	Ndine mlendo pa dziko lino; ndine wongonera pa ulendowu.
Ndisataye nthawi pa ulendo, Wonka komwe mitsinje siwuma.

CHORUS:
Ndine mlendo pa dziko lino; ndine wongonera pa ulendowu.

2.	Ku ulemerero wowala komwe mtima wanga wonse ufuna.
Dziko lapansi la mdima wokha, ndayendayenda ndatopa nalo.

3.	Kuli mzinda komwe ndipita, komwe momboloyo awalitsako.
Kulibe chisoni ndi zowawa, ngakhale nsonzi ‘pena maliro.''',
      '''1.	Ndinva za ulemerero wa iwetu Ziyoni.
Mlungu anamangira ‘we o’mboledwa akewo.
Pa thantha la kale lomwe anakhazikitsa ‘we.
Ndiwe wamuyaya ndithu wosawonongekai.

2.	Ndinva za madzi a moyo a mu mtsinje wakowo.
O’mboledwa ‘dzamwa mmomo sadzanvanso ludzulo.
Adzadya za mteng’wa moyo nakhala mu mtendere.
Ndi Yesu Mplumutsi wawo ‘dzakhala kwa muyaya.

3.	Yesu Mbuye ndzalowetu mu mzinda wa Ziyoni.
Muthandize ‘ne kukhala mchiyero nthawi zonse.
Zowawa za mdziko lino ndidzalekanenazo.
‘Dzakondwere mu Ziyoni ndi o’mboledwa Anu.''',
      '''1.	Ndani apite m'mundamo, kuyima m'choonadi
Kubweza osocherawo usana nd'usiku.

CHORUS: 
Ndani anke (Ndani anke) Mbuye, nditumeni ( ine)
Ndan'aime (Ndan'aime) Mbuyanga tumeni ( ine). 

2.	Miyoyo ifa mu tchimo, wina a wauze
Za Yesu ndi chikondi 'Ke, A thandiziketu. 

3.	Mbuye, ndakonzeka ine, kunka kolalika
Mtsogozi wa moyo wanga, N'dzamva mau anu.''',
      '''1.	Akudza posachedwa m’bale wakonzeka,
mkwati wayandikira, kudzatenga ake (m’bale).

CHORUS:
Konzani nyali yanu, Yesu akubwera (kubwera).
Lapani ntchimo lero Yesu akubwera.

2.	Tafatsa nalo dziko, Yesu wayandika,
agogoda pakhomo kuti alowemo (Mbuye).

3.	Tidzakomana nawo omwe natisiya,
Yesu ‘dzapukuta mi-sozi ya wolira (Mbuye).''',
      '''1.	Polowa ndi Yesu mulemererowo; zidzakhala zokoma.
Mabvuto n'zowawa zitathetsedwatu; zidzakhala zokoma. 

CHORUS:
Zidzakhala zokoma (zokoma),
wopanda nkhawa konse (konseko).
Kuyimba mokondwa ndi mtima wonsewo;
zidzakhala zokoma (zokoma).

2.	Kuyenda, kucheza ndi Yesu Khristuyo; zidzakhala zokoma.
Kulemekeza Mulungu wamyayayo; zidzakhala zokoma.

3.	Dziko lomwe namondwe sadzawombako; zidzakhala zokoma
Mpaka muyaya Yehova dzasunga 'fe; zidzakhala zokoma.''',
      '''1.	Ine ndifuna kufananadi ndi Yesu Mbuye pakupirira,
Kudzichepetsa, kuchita choonadi,
kudzipereka ku ntchito ya Mlungu.

CHORUS:
Tenganitu mtima wanga wonse;
mutsuketu zochimwa zonsezo.
Ndiyere mbuu Mbuye ndipempha ‘Nu;
(ine) ndikhale wanu ku nthawi zonsezo.

2.	Yesu ndifane, ndikule nanu, za mdziko lino zisandikope.
Ndiwonetsere Inu mzinthu zonse;
anthu awone ukulu wa Mlungu.''',
      '''1.	Sindidera nkhawatu za mawazo sindichita mantha konse.
Ndidziwa Mbuye alamula zonse nkhawa zanga ndizachabe.

CHORUS:
Nkhulupira (nkhulupirira) mwa Yesu yekha.
Ndidalira chikondi chake (chopambanadi).
(Aphimba ‘ne) (m’mabvuto onse) ndi dzanja lakero (andibisa ‘ne).
Nkhulupiraye sintekeseka (ndi mabvuto).

2.	Nkana namondwe wa bvuto awombe nachotsa Chimwemwe chonse;
sinditekeseka ndi za mdzikoli Mbuye alamula zonse.

3.	Ambuye adzanditsogolera ‘ne kupyola m’mabvuto onse.
Sindida nkhawa ndi anamondwewa; n’dziwa Yesu alinane.

4.	Posachedwa Yesu akubweranso, mabvuto onsewa ‘dzatha;
adzanditsogolera ulendo wa kwathu kutseri kwa thambo.''',
      '''All:
How lovely is zion city of our God. 
How lovely is zion city of our God.

Sop & Alt:
Where peace and joy abide in thee.
Where peace abide the city of our God.
Ten & Bass:
Where peace and joy abide in thee (abide).
The city of our God.
Females: 
How lovely, how lovely the city of our God. 
Males: 
How lovely, how lovely the city of our God. 
All:
How lovely is zion city of our God. 
How lovely is zion city of our God.
How lovely is zion the city of our God. 
How lovely is zion the city of our God.
The city of our God.
Quartet:
Where peace and joy abide in thee; how lovely The city of our God.
Others:
How lovely, how lovely the city of our God. ''',
      '''1.	Ndzayenda naye Mbuye wanga, kulikonse komwe adzanditsogolera. 
Ndzayenda naye Mbuye wanga, mumabvuto monse ndzakhala naye.
 
CHORUS: 
Yenda naye mu mtendere, m’mabvuto ndzayenda naye, 
mumabvuto monse ndzakhala naye. 

2.	Ndzayenda naye Mbuye wanga, ndichite kufuna kwa Inu Mbuye wanga.
Ndzayenda naye Mbuye wanga, mumabvuto monse ndzakhala naye. 

3.	Ndzayenda naye Mbuye wanga, mpaka ndikafike kudziko lokomalo.
Ndzayenda naye Mbuye wanga, mumabvuto monse ndzakhala naye.
''',
      '''1.	Tatanganidwa ndi zamdziko, posachedwa Yesu adza,
Abwera ndi khamu la angelo, kudzatenga omkonda iye.

CHORUS:
Sop: Kodi m'bale wakonzeka? Akubwera posachedwa,
        Tilalike kuti adze msanga, akubwera kutenga ake.

Others: Kodi m'bale konzeka? Abwera posachedwa,
        Tilalike kuti adze msanga, akubwera kutenga ake.

2.	Ndakonzeka kukalalika muchigwa ndi mmapirimo,
Kufuna nkhosa zosocherazo, akubwera kutenga ake.

3.	Zizindikiro zakwanadi, owelenga khala maso,
Agogoda kuti alowe mu mtima abwera posachedwa.

4.	Aitana leroli Yesu, akubwera posachedwa,
Mpatse Yesu mtima wako lero, akubwera kutenga ake.''',
      '''1.	Yesu m'busa akufuna nkhosa, Kuzifuna zosocherazo
M'mapiri ndi m'matanthwe monsemo; Afuna zosochera lero.

CHORUS:
Afuna Nkhosa zosocherazo zisatayiketu kosatha
Ndakonzeka kupita ndi Yesu kuzibwenzera m'njira Yake

2.	Yesu afuna zotayikazo, Kuziyitana mchipululu
Azipulumutsa modabwitsa; Afuna zosochera lero.

3.	Yesu m'busa akufuna nkhosa, Zopwetekedwa ndi kuthodwa
Madzi odikha ayitanira; Afuna zosochera lero

4.	Yesu m'busa akufuna nkhosa, zomwe zatayika mu tchimo
Chikondi chowala atumiza; Afuna zosochera lero.''',
      '''1. Ndionetse Yesu moyo wanga, Ndipo ndimuyamikeye.
Ananditulutsa m'machimowo, Ndadalitsidwa ine.

CHORUS:
Sop : 
Ine ndionetsere Yesuyo, Ndinyamule mtanda wangawo;
Ndinyamule tsiku ndi tsiku, Nkana ndikhale osayenera;
Komabe n'dzakhala ndi Mbuye kunthawi zonsezo

ATB: 
Ine ndionetsere Yesu, Ine ndionetsere Yesu;
Ndinyamule mtanda wangawo, Ndinyamule tsiku ndi tsiku
Nkana ndili osayenera, Nkana ndili osayenera;
Komabe n'dzakhala ndi Mbuye kunthawi zonsezo.

2. Ndionetse Yesu moyo wanga, Mfumu ya mafumuvo.
Akhala pakati pangelowo, Namlemekeza lye.

3. Ndionetse Yesu moyo wanga, Ndiyende mchifuniroke.
Ndipo podzabwera mdziko lino, Ine n'dzapita naye.

4. Pakutha moyo wanga mdzikoli, Ndziwa ndidzaukanso.
Yesu popereka mphotho yake, N'dzalandira koronavo.
''',
      '''1. Ndikaganiza za moyo uno
Ndi operewera osachedwa kutha.
Ndafuna-funa mmasitolo onse,
Kugula moyo koma ndalephera.

CHORUS:
Lilipo dziko labwino, zoona lokometsetsa 
komwe tikapeze, moyo wosatha
(Moyo! - Bass), moyo waulere,
(Moyol - Bass), moyo osagula komwe 
tikayimbe Hosana, Hosana.

2. Ndingayende-yende dziko lapansi,
Palibe komwe angandipatse moyo.
Koma kwa Yesu wa chifundoyo,
Ndikokha-kokha angandipatse moyo.

3. Yesu anati ine ndine njira,
Choonadi khomo ndiponso moyo.
Ofuna kudza pambuyo panga,
Adzikanize nasenze mtanda wanga.
''',
      '''1. Kodi tikhala mfupi ndi Mbuye, 
Tsiku ndi tsiku moyo wathuwo?
Anthu awone tikufanana, 
Ndi Mbuye pa mtandapo.

CHORUS:
Dziko likuona Yesu (Ona Yesu), 
Mwa ine kapena iwe (kapena iwe)
Kodi chikondi chako ndichokhulupirika, 
Kodi dziko lionanji (mwa Ine)?

2. Kodi chikondi ndi chofanana, 
Anthu onse ali ndi machimo?
Kodi mavuto tithangatane, 
Kubweza ochimwawo?

3. Ngati mabuku anthu awona, 
Zonse tinena zonse tichita,
Akukopeka mwina kuthawa, 
Yesu bwenzi leroli.
''',
      '''1. Chinsinsi cha ukwati ndi chinsinsi chopambanadi,
Chinsinsi cha ukwati ndi chopambanadi.
Chinsinsi cha ukwati ndi chinsinsi chopambanadi,
Chinsinsi cha ukwati ndi chopambanadi.
Kutenga awiri awa kutenga awiri awa, 
Akhale munthu m'modzi.
Kutenga awiri awa kutenga awiri awa, 
Akhale munthu m'modzi.

2. Chinsinsi cha ukwati chinayamba mu Edenimo,
Chinsinsi cha ukwati lero tachiwona.
Chinsinsi cha ukwati chinayamba mu Edenimo,
Chinsinsi cha ukwati lero tachiwona.
Kutenga mnyamata uyu kutenga msungwana uyu, 
Akhale thupi limodzi
Kutenga mnyamata uyu kutenga msungwana uyu, 
Akhale thupi limodzi

3. Tipempha Mulungu m'mwamba Akhale pakati pawo,
Banja latsopanoli lilalike Yesu.
Tipempha Mulungu m'mwamba akhale pakati pawo,
Banja latsopanoli lilalike Yesu.
Kupyola mwa (Mkwatibwi) kupyola mwa (Mkwati) tikaone chikondi
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaonetu Yesu

4. Ambuye mudalitsetu awiri-wa lero lino.
Kuti chikondi chawo chikhale chosatha.
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaone Chikondi.
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaonetu Yesu.
''',
      '''1. Uthenga wabwino wotu wonena zachisomo,
Yesu natsika kumwamba, Nadza kundifera 'ne.
Chozizwitsa chikondicho, pakudzichepetsatu,
Ulemu kwa Mlungu m’mwamba, Myamikeni Mfumuyo.

CHORUS:
Sop :             
Uthenga wa mtendere wozizwitsa.
ATB:            
Uthengawo wabwinowo wokondedwa wozizwitsa.
Sop :              
Wokweza ochimwawo kumwamba.
ATB :           
Wokwezatu ochimwawo kunka nawo kumwamba-kumwamba.

2. Ndi mau a Mpulumutsi mokondwa aitana,
Khulupira chifundoke tsata njira ya mmwamba.
Angelo adzalandiranu potha moyo m'dzikoli,
Mu'lemerero wa m'mwamba kopanda imfa uko.
''',
      '''All:
Jeru-salem! my glo - rious home! Name ev - er dear to me! 
When, When shall my la - bors have an end,

SA: In joy,. . . In joy, . . . 
TB: In joy and peace,... In joy and peace,
All: In joy…, and peace with thee?

SA:
Oh, when, thou city of my God.. Shall I… thy courts… ascend.
Where con - gre - ga - tions ne'er break up, And Sab - - baths have no end?
There hap - pier bowers than E - den's bloom: No sin, nor sor - row know

TB:
Oh, when,  Shall I,  thy courts, thy courts ascend:
Oh, when,  Shall I,  thy courts, thy courts ascend? 
There hap - pier bowers than E - den's bloom: nor sor - row know

All: 
Blest seats! thro' rude and stormy scenes, 

SA: 
I onward press to you... I onward press to you
TB: 
I onward press... to you, I onward press...to you, 

All:
I onward press to you, Je - ru - sa-lem!
Je - ru - sa-lem! Name ev - er dear to me!

ATB:
Why should I shrink at pain and woe, or feel at death dis - may?
AT:
I've Ca-naan's good - ly land in view,
And realms of endless day
SB:
I've Ca-naan's good - ly land in view,
And realms of endless day

All:
Je-ru-sa-lem my glo - rious home! My soul still pants, My soul
SA:
still pants for thee;...Then...Then shall my la-bors have an end,
When I . . .thy joys, . . .
TB:
Then...Then shall my la-bors have an end,
When I thy joys,... thy joys shall see,

All:
When I thy joys shall see,
(Ten: thy joys) thy joys shall see, Je - ru - sa lem Je – ru-sa-lem! 
Name ev - - er dear to me! Name ev - er dear to me.''',
      '''1.	Liv-ing in the sun-shine of His matchless grace,
Tell-ing how the Sav - ior came and took my place; 
Knowing I shall meet Him in that home a - bove, 
Mine (to keep) for ev - er, He's mine to love.

CHORUS:
 Mine (He is) for ev - er, (Oh yes He’s mine) yes I've made Him mine. 
Mine for (to be a) shelter. in (yes in)storm or shine; 
Mine (He is) for build-ing that (sweet) home a - bove.
Mine (to keep) for- ev - er, He's mine to love. 

2.	Once I was so lone - ly on the toilsome road,
Till the Sav-ior came to share my heav - y load;
Now I am re - joic - ing in the ho-ly Dove,
Mine (to keep) for  ev - er, He's mine to love. 

3.	Oh, it is so won-der-ful to feel His hand.
When the cross is heav -y, seems I can-not stand;
Wonder -ful to feel the Spir-it from a - bove,
Mine (to keep) for ev - er, He's mine to love.''',
      '''1. Popereka mwathunthu ku ntchito, Yolalika, "Ambuye adza".
Musakhumudwe ngati samvera, Mbuye 'dzanena, "wachita bwino."

CHORUS:
Pomaliza paulendo wangawu, N'tagonjetsa nkhondo pa dzikoli
N'dzabwera ndi kholola kwa Mbuyanga, Adzanena, "Wachita bwino."

2. Sanamvere Khristu wopachikwa, Wokhomedwa, Mwana wa M'lungu
Mvani Yesu apemphaa kw a Tate, Kufuna kwanu kuchitidwe.

3. Potha ntchito ya moyo pa dziko, Mudzalandira Mphoto yake
Malo okoma Mbuye wakonza, Adzayamika wachita bwino.

4.  Poyesetsa ngati simungathe, mwapwetekwa pogwira ntchito
Musenze mtanda kunka kwa Yesu, Adzamvetsetsa wachita bwino.
'''
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_chur(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_amo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
      'Reference or key for the song.\nYou can edit this in Edit Song',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_amo(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_amo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Call to Worship 1',
      'Call to Worship 2',
      'Ambuye Adzabweranso',
      'Ndimuuze Yesu',
      'Nsanje',
      'Mlole Yesu Alamulire',
      'Ndiufuna Mwala',
      "M'bukhu La Moyo",
      'Mundikhululukire',
      "M'mene Mbuye Adza",
      "Phwando la Belisezara",
      "Poyenda Ulendo",
      'Yesu Dzamasula ‘we',
      'Pemphero ndi Kiyi',
      'Ndiyimba Mphamvu ya Mulungu',
      'Ambuye Ali Pafupi Kudza',
      'Ndikadakhala Naco Cikhulupiro',
      "Mmanja Mwake",
      "Sitidziwa Nthawi Ya Kudza"
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_amo(fruit);
    }
  }

  Future<void> insertAllSongs_amo() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      "\n\nYou can edit this song in Edit Song...",
      "\n\nYou can edit this song in Edit Song...",
      "1. Ambuye Yesu anapita kumwamba\nkukatikonzera ife malo X 2\n\n"
          "CHORUS:\nS:\nNdipo ananena,kuti ndidzabwera, kudzatenga\nAnthu anga kupita nawo kumwamba\n\n"
          "ATB:\nKuti ndidzabwera,kudzatenga anthu anga,\nKupita nawo kumwamba,\nkuti akakhale uko\nPamodzi ndi Atate\n\n"
          "2. Konzekatu m'bale wanga,\nKukomana naye Mbuye X 2\n\n"
          "3. Iwe m'bale wanga lero uyenera\nKusiya tchimo X 2",
      "1. Ndimuuze Yesu mavuto anga ali\nbwenzi lokoma mtima.Ndimuuze Yesu,\nndimuuze Yesu ndiye angathe kuthandiza.\n\n"
          "CHORUS:\nNdimuuze Yesu, ndimuuze Yesu\nNdiye angathe kuthandiza\n\n"
          "2. Ndimuuze Yesu mayeso anga ali\nbwenzi la nthawi zonse.Mzimu Woyera\nUndithandize kupewa mayeso onsewo\n\n"
          "3.Dziko lifuna kundichimwitsa koma sindisiya\nKonsebi.Ndikakhumudwa andilimbitsa\nNachotsa mavuto onsewo",
      "1. Nsanje ikhoza kukhala chiyambi\nChauchimo kumenyana ndi miseche\nchifukwa cha nsanje\n\n"
          "CHORUS:\nDzani nonse dzani nonse\nMudzayeretsedwetu.Abambo amayi\nTidzakahla pamodzi ndikunena malilime\nPatsiku libwera\n\n"
          "2. Naboti ndi Sitefano anaphedwa\nChifukwa chochitira Yesu umboni\nChifukwa cha nsanje\n\n"
          "3.Masiku anotu Mbuye anthu\nTikusemphana,kukanganila\nMaudindo chifukwa cha nsanje",
      "1.Wolema ndi othodwa idza kwa Yesu\nAnafera otere pamtandapo,\nudzailira nthawi yotere ii\nmlore Yesu alamulewe.\n\n"
          "CHORUS:\nTsegula mtimawo iwe nthawi ndi\nYomweyi leroli, udzailira nthawi yotere\nIiii mlore Yesu alamulewe\n\n"
          "2.Wakahalatu kapolo wa satana\nWakuzunza muzakatu zonsezi, udzailira\nNthawi yotere iii mlore Yesu alamulewe\n\n"
          "3. Pena lero nkukhala lomaliza,\nSudzamvanso uthenga wa Mulungu,\nUdzailira nthawi yotere ii\nmlore Yesu alamulewe.",
      "1. Danieli nalota mwala\nWosemedwa opanda manja\nDanieli nalota mwala\nWogubuduka ku Babulo\nDanieli nalota mwala\n"
          "Wosemedwa opanda manja,\nNugumula maziko a tchimo\n\n"
          "2. Ndiufuna mwala\nwosemedwa opanda manja\nNdiufuna mwala\nWogubuduka ku Babulo\nNdiufuna mwala\nwosemedwa opanda manja\n"
          "Nugumula maziko a tchimo\n\n"
          "3. Yesu ndiye mwala\nWosemedwa opanda manja\nYesu ndiye mwala\nWogubuduka ku Babulo\n"
          "Yesu ndiye mwala\nWosemedwa opanda manja,\nNugumula maziko a tchimo\n\n"
          "4. Ndaupeza mwala wosemedwa opanda manja\nNdaupeza mwala\nWogubuduka ku Babulo\nNdaupeza mwala wosemedwa opanda manja\n"
          "Nugumula maziko a tchimo",
      "1.M'bukhu la moyotu Mbuye lomwe\nMuli kusunga linalembedwamo kodi\nDzina langa m'bukhumo\n\n"
          "CHORUS:\nLilimo dzinalo m'bukhu lanu lamoyo\nTandiuzenitu Mbuye ngati linalembedwa\n\n"
          "2. Lodala dzina limene lalembedwa m'bukhumo\nTandiuzenitu Mbuye ngati linalembedwa\n\n"
          "3. Mayeso akanakhala ofewa kwainetu, ndikudziwa\nKuti dzina langa linalembedwa",
      "1.Tsiku loweruka timakumbukira kupachikidwa\nKwa Mbuye wathuyo X2\n\n"
          "CHORUS:\nB: Mundikhululukire ine!!\n\n"
          "SAT: Mundikhululukire,analira lye\n\nMulungu wanga Mulungu wanga\nMwandisiyiranji?\n\n"
          "2. Mtembo wanu Mbuye unasauka\nN'dzuwa chinali chikondi\ncha Mbuye Wathuyo.X2\n\n"
          "3. Tsiku lachitatu anadzuka m'manda\nKusonyeza kuti wagonjetsa imfa",
      "1. M'mene Mbuye adza kudzatenga ake\nOnani adzyimba\n\n"
          "CHORUS:\nB: Adzanena x2\nAll: Bwanji kodi?\nB: Nanga inu tsopano\n"
          "All: Munali kuti\nAdzanena ndi anthu\nOkhala dzanja lamanja\nLowani nonse x3\nM'chikondwerero\n\n"
          "2. Nduna zazikulu, mafumu aakulu, adzafika\nTsikulo  m'mene Mbuye adza\nkudzatenga ake\nOnani adzyimba",
      "1. Phwando la Belisezara\nZodabwitsa, onani\nDzanja linalemba pakhoma,\nMau osadziwika\n\n"
          "CHORUS:\nAll:\nMulungu anawerenga nayesa inudi\nMwapereweradi napatsa anthu ena\n\n"
          "B:\nZoonzdi\nMwapereweradi napatsa anthu ena"
          "2. Anzeru otchuka onsewo\nSanathe kumasula,\nKoma Danieli wa Mulungu\nyekhayo anakhoza kumasula\n\n"
          "3. Nanga ife tikhoza kumasula\nMau a Mulungu\nyekhayo anatipatsa ife moyo",
      "1. Poyenda ulendo kupyola muchipululu\nYendanibetu (kupyola)\nmmapiri monse\n"
          "Nkana ludzu litigwire\nPoyenda mumchenga\nZitsime ziripodi\n(poyenda musaope)\n\n"
          "2. Zitsime za chikhulupiriro\nNdi chikondi zodabwitsadi\n(zimene) ife timwwemo\n"
          "Yesu ndiye mwini\nopatsa madzi a moyo\nidzani mudzamwedi (poyenda musaope)\n\n"
          "3. Pazitsime zokoma\nza mau a Mulungu\nnzosaphwa konse\n(komatu) nzanthawi zonse\n"
          "Ndiponso nzotumphukiri\nku moyo wosatha\nIdzani musachedwe (poyenda musaope)\n\n"
          "CHORUS:\nSop:\nEe munjira alipo madzi wosatha,\nkumene otopa 'dzamwe mwauleretu\n"
          "Poyendapo kunka mwambamo\nZachikondicho timwe pakasupe\nmoyo wauleretu,\n"
          "Uwu ndimwai wapatsidwa\ntimwe kwauleretu\nmadzi a moyo.\n\n"
          "Ten:\nEe munjirayi madzi a moyo\nEe madzi a moyo wosatha,\nkumene otopa 'dzamwe mwauleretu,\n"
          "Poyendapo kunka mwambamo\nZitsime zachikondicho\nMusaope konse ndipotu,\nmwai wapatsidwa timwe\n"
          "kwauleretu madzi a moyo,\na moyowo\n\n"
          "Baritone:\nEe munjirayi madzi a moyo\nEe madzi a moyo wosatha,\nkumene otopa 'dzamwe mwauleretu,\n"
          "Poyendapo kunka mwambamo\n'Dzani pakasupe\nwa moyo uleretu\nUwu ndimwai wapatsidwa\ntimwe"
          "kwauleretu\nmadzi a moyo,\na moyowo\n\n"
          "Bass:\nEe munjirayi madzi a moyo\nEe madzi a moyo wosatha,\nidzanitu kumene otopa\n'dzamwe mwauleretu,\n"
          "Poyendapo kunka mwambamo\nZitsime zachikondicho kasupeyo\nMusaope konse ndipotu\n"
          "m'sachedwenso, uwu ndimwai\nwapatsidwa timwe kwauleretu\n'Dzamwe madzi a moyo.\n",
      "1.	Omangidwa ‘we ndi tchimo\nYesu dzamasula ‘we\n\n"
          "CHORUS:\nEeh ndidziwa x2\nYesu anga ndimasule inenso\n\n"
          "2.	Namasula ena kale\nAngamasulenso ‘we\n\n"
          "3.	Ofoka apatsa mphamvu\nMatenda achiritsa",
      "1.	Danieli dzenje la mikango\nAna pemphera x2\n"
          "Pemphero ndi kiyi wamwamba x2\n"
          "Danieli dzenje la mikango\nAna pemphera\n\n"
          "2.	Yesu Mbuye munda wa\nGetsemane\nAna pemphera x2\n"
          "Pemphero ndi kiyi wamwamba x2\n"
          "Yesu Mbuye munda wa\nGetsemane\nAna pemphera\n\n"
          "3.	Wophunzira chipinda\ncha pamwamba\nAna pemphera x2\n"
          "Pemphero ndi kiyi wamwamba x2\n"
          "Wophunzira chipinda\ncha pamwamba\nAna pemphera",
      "1.	Ndiyimba mphamvu ya Mlungu,\nwolenga mapiri,\n"
          "Yemwe anapanga zinyanja\nndi mlengalenga;\n"
          "Ndiyimba nzeru imene\ninapanga dzuwa;\n"
          "Mwezi uwala usiku,\nndi nyenyezi zomwe.\n\n"
          "2.	Ndiyimba ubwino Wake,\nWakupatsa kudya;\n"
          "Analenga zonse ndi mau,\nnayamikira.\n"
          "Mbuye munazikhazika\nmozizwitsa ndithu!\n"
          "Zinthu za m’dziko lapansi\nNdi zam’mwamba zomwe.\n\n"
          "3.	Mbeu ndi maluwa omwe,\nzidziwitsa Inu;\n"
          "Mitambo yonse ndi namondwe,\nzimvera Inu.\n"
          "Za moyo zonse\nzimasamalidwa ndi Inu.\n"
          "Tiribe kothawira’ko,\nkoma Kwanu kokha.",
      "1.	Ambuye ali pafupi kudza,\nNdikumva concodi.\n"
          "Ndiponso nyenyezi zikuzima,\nTsopano ndi mbanda kucatu.\n\n"
          "CHORUS:\n"
          "Ee! Tsopano\nndi mbanfa kucatu!\n"
          "Ee! Tsopano\nndi mabanda kuca ndithu!\n"
          "Usiku wathandi!\nUsana wadzanso.\n"
          "Ee! Tsopano\nndi mbanda kucatu!\n\n"
          "2.	Zizindikiro za mlengalenga\nZilalikiradi;\n"
          "Ndi za pa dziko zinena kuti,\nAmbuye wayandikiratu.\n\n"
          "3.	Ndi nthawi yoti kunyada kuthe\nMu mpingo wonsewo,\n"
          "Ukhale wofulumira nchito,\nUkhale woyang’aniratu.\n\n"
          "4.	Pitani msanga kukalalika\nkwa osaukawo:\n"
          "Ndi kwa omveka a dziko lino;\nOnsewo afulumirenso.",
      "1.	Ndikadakhala nacotu\nCikhulupiroco,\nSindinganjenjemeretu\nM’mabvuto monsemo.\n\n"
          "2.	Coti ndikalangidwa ‘ne,\nNdisang’ung’udzatu,\nPopwetekedwa ineyo\nNdikhulupira ‘Ye.\n\n"
          "3.	Comwe ciwala m’mtimanga,\nPokhala m’mdimamo, Cimene siciopatu,\nSicikaikanso.\n\n"
          "4.	Cosasunthika konsetu,\nPokwiya dzikoli,\nMacimo sangakope ‘ne\nAkandidzera ‘ne.\n\n"
          "5.	Mbuye, patseni mphamvuyo,\nCikhulupiroco.\nCinkana pansi panotu\nNdidzakondwerabe.",
      "1. Mbuye wanga dzanditsogolera\n'dzandisungane m'mavuto 'o'psya,\nIye adzandisamalirane,\nmmanja mwake m'manjake.\n\n"
          "CHORUS:\nS:\nMmanja mwake, mmanjake,\nMmanja mwake mmanjake\nNdine wake nkana vuto lidze,\nM'manja mwake mmanjake.\n\n"
          "ATB:\nMmanja mwake, Mmanja mwake\nmmanjake x2\nNdine wake nkana vuto lidze,\nM'manja mwake mmanjake.\n\n"
          "2. M'manja mwake dzandisunga ine,\nndidzanva mau a chikondike!\nMlungu nandiuza ndine wake,\nmmanja mwake m'manjake.\n\n"
          "3. Iye adzasunga moyo wanga,\nwina sanga chotse chikondike\nN'dziwa adzandisamalirabe,\nmmanja mwake m'majake.",
      "1. Sitidziwa nthawi yakudza kwa Mbuye,\nKoma zooneka pa dziko zinena\nAdzabwera msanga, tikondwa,\nkomatu sitidziwa nthawi.\n\n"
          "CHORUS:\nAdzatu! Tikonzeke tilinde!\nAdzatu! Aleluya! Aleluya!\nAdza ndi mphamvu za Tate wace,\nKomatu sitidziwa nthawi.\n\n"
          "2. Ku'nika kulipo kwa anthu a nzeru,\nCo'nadi ciripo mu mau a Mlungu,\nAlembi anena momveka,\nkomatu sitidziwa nthawi.\n\n"
          "3. Tilinde, tipempe ndi nyali zowala,\nTigwirenso ntchito mpakatu abwera\nPoona zozizwa tiyimbe,\nkomatu sitidziwa nthawi.",
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_amo(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_senior() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'CS#174',
      '''The sweetest song I know 
Radiant Joy #133''',
      'May God Depend on you?',
      'Reformation Hymnal #599',
      'SDA Hymnal #687',
      'Camp Meeting Song 2022',
      'Gospel Song Jewels #29',
      'CS#6',
      'CS#90',
      'CS#170',
      'Camp Meeting Song 2023',
      'SDA Hymnal #572',
      'M. Nkhanganya',
      'Matchless Gift #10',
      'Ndinanva Yesu CS#140',
      'Ona Mlendo Ayima',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_senior(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_senior() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Akhristu',
      'Anthu Ayimba',
      'Pachinkhondo',
      'Sing the Wondrous',
      'The Lord',
      'Ndani Apite',
      'Give the World a Smile',
      "Yang'anirani Akhristu",
      'Linda Pempha',
      'Mulungu Mfumunu',
      'Kufuna Nkhosa ',
      'Give Of Your Best',
      'Ine Wochimwa',
      "There’ll Be No Shadows",
      'Ndinanva Yesu',
      'Ona Mlendo Ayima',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_senior(fruit);
    }
  }

  Future<void> insertAllSongs_senior() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      '''1. Akhristu  ali  nachotu   chiyembekezocho
Chimatikondweretsatu  mmavuto  monsemo
Chimatikondweretsatu  mmavuto  monsemo

2. Chinena za mpumulowo  pokhala ndi Khrist
Pamodzi ndi anzangawo tidzakhalitsako
Pamodzi ndi anzangawo tidzakhalitsako

3. Mayeso ndi machimowo kulibe mdzikolo
Misozi ndipo imfanso kulibe komweko
Misozi ndipo imfanso kulibe komweko

4. Masiku athe msangatu Ambuye adzetu
Ndilakalaka kuona dzikolo ndi inu
Ndilakalaka kuona dzikolo ndi inu
''',
      '''1. Anthu ayimba za Khristu osenza nkhawazo
Ayimbanso ndinka kwathu ndamva kuitana
Ayimba nyimbo zatsopano ndizakalezo
Koma chisomo chodabwitsa ndiyo nyimbo ndikonda

CHORUS:
Sop: 
Chisomo chodabwitsacho nyimbo yokomadi,
nyimbo ya nthetemya yoposa zonsezo
ndamva pali kasupe wodzadza ndi mwazi;
koma chisomo chodabwitsa ndiyo nyimbo ndikonda.

Alt: 
Chiisomo chodabwitsacho, nyimbo ya nthetemya
yoposa zonsezo ndamva pali kasupe wodzadza ndi mwazi;
koma chisomo ndiyo nyimbo ndikonda.

Tenor: 
Chisomo chodabwitsacho nyimbo yokomadi,
nyimbo ya nthetemya yoposa zonsezo kasupe wodzadza;
koma chisomo chodabwitsa ndiyo nyimbo ndikonda

Bass: 
Chisomo codabwitsacho nyimbo yokomadi,
nyimbo yoposa zonsezo.
Ndamva pali kasupe wodzadza ndi mwazi;
koma chisomo ndiyo nyimbo ndikonda.


2. Ndiyo nyimbo anayimba anthu akalewo
Nyimbo yochokera mmwamba kusangalatsane
Imveka ngati mtsinje wakayaziyaziwo
Koma chisomo chodabwitsa ndiyo nyimbo ndikonda

3. Ayimba kuti Khristu anatiombolafe
Ali kuseri kwa mitambo ndikafikeko
Ayimbanso za kasupe woyeretsa tchimo
Koma chisomo chodabwitsa ndiyo nyimbo ndikonda''',
      '''1. Pachinkhondo choopsachi, cha zabwino nzoipa
Mmene nkhondo ikuopsa, pomenyana ndi mdani
Mbuye afuna antchito, kodi adalirewe

CHORUS:
Sop: Kodi adalirewe, akufuna omvera
ATB: Ko-di-a-da-li-re-we, a-ku-fu-na- omvera 
All: Imva mzimu anena, adalire pa iwe    

2. Ona magulu a mdima, akudza ndi chimkwiyo
Mphamvu yawo ikulabe, ndimphamvu ya mdimawo
Ima njii pachoona, kodi adalirewe

3. Yesu mmwamba ationa, angelo nathangata
Ndi mtsogozi wathu Yesu, ndipo sitidzagonja
Tidzakhala olimba, kodi adalirewe''',
      '''1. Sing the wondrous love of Jesus sing His mercy and His grace
In the mansions bright and blessed He’ll prepare for us a place

CHORUS:
When we all get to heaven, what a day of rejoicing that will be
When we all see Jesus we’ll sing and shout the victory

2. While we walk the pilgrim pathway clouds will over spread the sky
But when travelling days are over not a shadow not a sigh 

3. Let us then be true and faithful trusting serving everyday 
Just one glimpse of him in glory will the toils of life repay''',
      '''The Lord is in His holy temple      the Lord is in His holy temple
Let all the earth be silent  be silent before Him.
Amen. ''',
      '''1.	Ndani apite m'mundamo, kuyima m'choonadi
Kubweza osocherawo usana nd'usiku.

CHORUS: 
Ndani anke (Ndani anke) Mbuye, nditumeni ( ine)
Ndan'aime (Ndan'aime) Mbuyanga tumeni ( ine). 

2.	Miyoyo ifa mu tchimo, wina a wauze
Za Yesu ndi chikondi 'Ke, A thandiziketu. 

3.	Mbuye, ndakonzeka ine, kunka kolalika
Mtsogozi wa moyo wanga, N'dzamva mau anu.''',
      '''1. Are you giving to the world a smile             (alt & Ten :  sunny smile)
Helping lessen someone’s dreary mile         (alt & Ten : dreary mile)
Do you greet the world with song   as through life you pass along
Cheering those whom you may meet along life’s way

CHORUS: 
Bass : 
Give the world a smile each day……helping someone on life’s way
From the paths of sin bring the wondrous in        to the master’s fold to stay 
Help to cheer the lone the lone and sad         help to make some weary pilgrim glad
Let your life so be that all the world may see the joy of serving Jesus with a smile

Sop : 
Give-the-world-a- bright smile everyday 
Hel-ping-some-one on life’s dreary way……..paths-of-sin           bring-them-in
To-His-fold-yes forever to stay   help to cheer the lone and sad     
Help to make the pilgrim glad            let your life so be that all the world may see the joy of serving Jesus with a smile

Alt &Ten : 
Give-the-world-a-bright smile everyday
Hel-ping-some-one-on life’s dreary way……….paths-of-sin             bring-them-in
To-His-fold-yes forever to stay…….help-cheer-the-sad- the lonely and sad
Help- make- Him- glad make somebody glad
Life so be that all the world may see the joy of serving Jesus with a smile

2. You may be a shining light today    (alt, Ten: yes today)
Pointing souls to heavens glory way   ( alt, Ten: glory way)
If you let your light so shine     that they see the path divine
And you wear a pleasant smile along life’s way

3. Just a bright and sunny smile will win  ( it will win)
Many souls from dreary paths of sin    (paths of sin)
Lift them up on higher plains    where they hear the glad refrains
Of the smiling band of workers on life’s way''',
      '''1. Yang’anirani Akristu, Zammwamba zigwedezeka
Yatsani nyali zanuzo, Kukomana naye Mbuye.

CHORUS:
Onani Yesu adza; Akudza mulemerero,
Adzakhala mfumu yathu, Onani! Ali kudza.

2. Ona lonjezano lace, Wakhululukira cimo,
Mwazi nutsuka minjiro, Nena nthano ya combolo.

3. Mafumu anjenjemera, Imva! Ali kudza ndithu
Nena za cisomo cace, M’mene lipenga lilira.

4. Mitundu yonse idzatha, Khristu wafulumiratu;
Dziko liri kutha ndithu; Mbuye wathu ali kudza.

5. Yesu aitana nonse, Akupembedzera inu;
Kangaza nthawi ikutha, Ungadzatsaletu kunja.''',
      '''1. Dikirani lero nthawi iri kutha;
Mungagwe m’zoipa linda ndi pemphero;
Thupi ndi lofoka mdaniyo ngwa mphamvu;
Dikirani nonse Mkwati ali kudza.

CHORUS:;
Linda pempha, Linda pempha;
Usiku ndi usana dikirani ndi kupemphera.
(Tenor and Bass)
Linda pempha, linda pempha;
Linda pempha, linda pempha;
Usiku ndi usana dikirani ndi kupemphera.

2. Dzukani m’sagone musamakaika;
Mudzalandiratu mpumulo kumwamba;
Linda ndi pemphero, Mpulumutsi wanu,
Anasautsidwa cifukwa ca inu

3. Khulupira Yesu mdani ali pompo
Bvala zida zako mpaka Mbuye adze,
Musacedwe konse lero ndi labwino,
Dikirani nonse ndi kupempheranso.''',
      '''1. Mulungu, Mfumu ’Nu, Ndiribe mphamvutu,
Munandilenga, mundisunga Nthawi zonsezi
Munandilenga, Mundisunga Nthawi zonsezi.

2. Ndiribe winanso, Ndimatsamira ’Nu;
Zabwino zanu zipambana, Ndicitenji ko?
Zabwino zanu zipambana, Ndicitenji ko?

3. Ndipatse ciani ko? Poona zonsezi
Zakhala zanu kale ndithu, Ndidzatani ko?
Zakhala zanukale ndithu. Ndidzatani ko?

4. Mufuna mtimangu, Ndipatsa msangatu.
Ndikhale wanu nthawi zonse, Mndilandire ’ne.
Ndikhale wanu nthawi zonse, Mndilandire ’ne.''',
      '''1. Yesu m'busa akufuna nkhosa           Kuzifuna zosocherazo
Mmapiri ndi mmatanthwe monsemo      Afuna zosochera lero

CHORUS:
Afuna nkhosa zosocherazo       zisataiketu kosatha 
Ndakonzeka kupita ndi Yesu.    Kuzibwezera mnjira yake

2. Yesu afuna zotaikazo.  Kuziitana mchipululu
Azipulumutsa modabwitsa     afuna zosochera lero

3. Yesu m'busa akufuna nkhosa.     Zopwetekedwa ndi kuthodwa
Madzi odikha aitanila.   Afuna zosochera lero

4. Yesu m'busa akufuna nkhosa.    Zomwe zataika mutchimo
Chikondi chowala atumiza.      Afuna zosochera lero''',
      '''1. Give of your best to the master,
Give of the strength of your youth;
Throw your soul's fresh, glowing ardor
Into the battle for truth.
Jesus has set the example -
Dauntless was He, young and brave;
Give Him your loyal devotion,
Give Him the best that you have.

CHORUS:
Give of your best to the master,
Give of the strength of your youth;
Clad in salvation's full armor,
Join in the battle for truth.

2. Give of your best to the Master,
Give Him first place in your heart;
Give Him first place in your service,
Consecrate every part.
Give, and to you shall be given -
God His beloved Son gave;
Gratefully seeking to serve Him,
Give Him the best that you have.''',
      '''1. Ine wochimwa ndaomboledwa
Nthano yanga yozizwitsa
Anditsogolerane kumalo
Khristu andikonzerane

CHORUS: 
Mlungu atsogolerane
Kumwambako nthawi zonse
Mlungu atsogolerane 
Kumwambako

2. Ndidzayenda m'zipata zabwino 
Uko ku dziko lokoma
Dzayenda mu mzinda ndi Ambuye
Mu mzinda wokongo lawo

3. Atsogolera paulendowu
Andibisa mzoopsyamo
Mtendere apatsa m'chembekezo
Chimwemwe nthawi zonsezo.''',
      '''1.
Bass:
There'll be no shad-ows on that glad mor- row,
Sin and sor - row will all be gone, for- ev-er;
We'll be with Je - sus, O happy meet - ing,
When life here is done.

Others:
Be no shad-ows on that mor-row, Sin and sor - row gone 
(AT: will all be gone);
Be with Je- sus, hap - py meet - ing, When life here is done.
(AT: for us done)

CHORUS:
Sop:
There'll be no shad-ows when we get yonder,
No tears of sorrow to dim the eyes halle-lu.
We'll sing the prais-es of Christ our Sav-ior,
In heav'n where come no sad goodbyes.

Others:
Shadows there,… joys to share.
No more tears to dim the eyes, halle-lu.
Praise sing, joy-bells ring,
Come no sad goodbyes. (AT: No goodbyes.)

2.
Bass:
We'll see the Sav - ior, and all the eld - ers,
Loved ones gone before, gone be-fore, O glo-ry; 
There'll be no weep - ing, all will be glo – ry
There for ev - er-more.

Others:
See the Sav - ior, all the eld - ers, Loved ones gone be – fore
(AT: gone be – fore, gone be – fore);
Be no weep - ing, all be glo - ry There for ev-er - more, 
(AT: ev-er - more,)''',
      '''1. Ndinamva Yesu akuti, Idza udzapume
Wolema’we ndi zoipa, Tsamira pa Ine.
Ndinadza kwa Yesu momwe ndinali – wolema;
Mwa iye ndinapumula, Nandikondweretsa.

2. Ndinamva Yesu akuti, Ndipatsa kolere
Madzi a moyo wosatha, Idza udzamwetu
Ndinadza kwa Yesu ndi ’mwa Mu mtsinje wamoyo
Ndipo ndinatsitsimuka, Ndikhala mwa Iye.

3. Ndinamva Yesu akuti, Ndine kuunika;
Yang’ananitsa kwa ine, Ndipo udzakondwa.
Ndinayang’ana kwa Yesu, Mwa Iye ndiwala;
Ndidzayendabe m’ku’nika, Mpaka kumwambako.
''',
      '''1. Ona mlendo ayima pakhomo lotseka, invatu agogoda mofatsa anena

CHORUS:
Ona...ona...wayima pakhomo. Ona...ona...wayima pakhomo (Tenor: o..o..).
(SAT: Ngati wina...) anva mau... nadzatsegula ndidzalowa.

2. Ndi manja olasidwa agogoda khomo, mokondwa ayitana, ayima mofatsa.'''
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_senior(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_ivet() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'CS#205',
      'Chikondi Cha Christu - A. Bodza',
      'Yesu Anapereka Moyo Wake Nsembe\nSalvation has been granted',
      'Going up the Glory Way. Singing * #0',
      'Kodi Wangotambalala',
      'Chikondi Cha Mulungu Wathu',
      'Njirayi ndi Yaitali',
      'Singing*#4',
      'Singing*#59',
      'Chimo Musalole\nKMN#250',
      'Mmene Ine Ndisauka\nKMN#334',
      'Moyo Wanga Dzuka\nKMN#20',
      'Kuwunika Kochoka Mmwamba\nOnward to the Prize-Singing* #29',
      'Ndikonda Yesu\nHow I Love Him (Chords of love 103)',
      'Akatha Mabvuto\nPraising His Love (Singing Star 34)',
      'Muli Nyimbo Mumtimanga\nThe Music of Perfect Love-Singing * #6',
      'Nthawi Zina\nE. Bodza',
      'Moyo Wanga Ufanana',
      'Mmene Ndinali Wochimwa\nGlory, Glory, I’m so Glad-Singing* #5',
      'I Want to See That City\nSinging * #35',
      'Ndanva Za Mzinda\nWonderful City-Singing * #18',
      'Nditama Dzinalo\nAnchored in Jesus’ Love-Singing * #70',
      "There's a Mansion up in Glory\nSinging * #41",
      'Ndirinaye Bwenziro\nBy Homeland Family',
      'Pa Mapazi Ake Yesu\nKMN#164',
      'Okunkhawo - Mrs. Nkhwazi',
      'Kuli Malo - Mrs. Nkhwazi',
      'Nabuka Namondwe - Mrs. Nkhwazi',
      'Nditatha Ntchito\nWill the Angels Take me Home?-Singing * #21',
      'Ndanva Kuli Malo\nWhen We All Get Home-Singing * #24',
      'Pakutaika\nA Touch of His Hand on Mine-Singing * #38',
      'Yesu Mundilankhule\nKMN#152',
      'Tisonkhanitse Zabwino - CS#267',
      'Mmawa Wina Owala\nHeaven’s Jubilee-Singing * 78',
      'Ochenjera Anamanga Nyumba\nC. Kaphirikwete',
      '‘Dzayimba Mokondwa\nWhen We Meet to Part No More-Matchless Gift #131',
      'Kodi uli Kulemedwa?\nCS#239',
      'Nsanga Timaliza Ntchito\nWe are Going Away to Heaven Our Home-Singing*14',
      'Ndinva Mabelu\nI Hear the Bells-Singing*17',
      'Yesu Abwera Nsanga\nWe’ll See Him Coming in the Cloud-Singing*19',
      'Nyimbo Zokoma\nThe Resting Place-Singing*25',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_ivet(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_ivet() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Yesu Ponong’oneza ',
      'Chikondi Cha Christu',
      'Yesu Anapereka Moyo Wake Nsembe',
      'Ndiyimba Nyimbo',
      'Kodi Wangotambalala',
      'Chikondi Cha Mulungu Wathu',
      'Njirayi ndi Yaitali',
      'Ndifuna Mzinda',
      'Lead Me Shepherd',
      'Chimo Musalole',
      'Mmene Ine Ndisauka',
      'Moyo Wanga Dzuka ',
      'Kuwunika Kochoka Mmwamba',
      'Ndikonda Yesu',
      'Akatha Mabvuto',
      'Muli Nyimbo Mumtimanga',
      'Nthawi Zina',
      'Moyo Wanga Ufanana',
      'Mmene Ndinali Wochimwa',
      'I Want to See That City',
      'Ndanva Za Mzinda',
      'Nditama Dzinalo',
      "There's a Mansion up in Glory",
      'Ndirinaye Bwenziro',
      'Pa Mapazi Ake Yesu',
      'Okunkhawo',
      'Kuli Malo',
      'Nabuka Namondwe',
      'Nditatha Ntchito ',
      'Ndanva Kuli Malo',
      'Pakutaika',
      'Yesu Mundilankhule',
      'Tisonkhanitse Zabwino',
      'Mmawa Wina Owala',
      'Ochenjera Anamanga Nyumba',
      '‘Dzayimba Mokondwa',
      'Kodi uli Kulemedwa?',
      'Nsanga Timaliza Ntchito',
      'Ndinva Mabelu',
      'Yesu Abwera Nsanga',
      'Nyimbo Zokoma',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_ivet(fruit);
    }
  }

  Future<void> insertAllSongs_ivet() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      '''Yesu ponong’oneza idzanitu,
mupemphera ife idzanitu,
n’jabwino nthawi ino idzaitu,
yomdziwa Mpulumutsi idzanitu.''',
      '''1.	Chikondi cha  khristu  mwana  wa Mulungu
Natsika  kumwamba kuzafera  dzikoli
Anasiya mpando wa  ulemelero
Ndiangelo  kumwamba  kudzafera  dzikoli
Nalasidwa mthiti  navekedwa minga
Chifukwa  cha  ine  kuombolane e e e
Anapilirabe  nanyamula  mtanda
Kufera pa mtengo kuombolane e e e.

2.	Tsono  tidikira tsiku  lalikuru  Lobewera
Ambuye  kudzatenga  anthu  ake
Manda dzatseguka  wokhawo  ogona
Mwambuye dzauka  kuvala chosafa
Dziko ndilozunza  la dzadza nzoopsa
Ladzadza  mmafunso  nkhawa  mtimamu
Koma Mbuye wathu sazengerezabe
Ndi lonjezo lake la mpumulowo.''',
      '''1.	Yesu anapereka moyo wake nsembe; pa kavaliyo wankhanza;  
Kukonza njira kuti tivale korona; Tama dzinalo.
Bass: Chipulumoso chapereke e edwa.

CHORUS:
Mtameni (Mbuyeyo) chipulumuso chadza (kwaife)
Pita ka (pita ka) uze dziko lonse (kalalike)
Nena lero (kwa achisoniwo) nena lero (unenenso mawa)
Lalika uthenga tibvale korona (kumwamba)
Lalika (uthenga) ndi mphatso ya ulele (kwa ochimwa)
Falitsa (uthenga) panyanja ndi mtunda (kaphunzitse)
Kutaliko (Kwa mitundu yonse) Kutaliko (Zolengedwa zones)
Mtameni (mbuyeyo) chipulumutso chaza.

2.	Yekha yekha nazunzidwa kulipira zonse; Analipira, analipira.
Mulonjezano lake muli chipulumutso. Tama dzinalo.
Bass: Chipulumoso chapereke e edwa.

3.	Kuli mudzi wokonzedwa uko ku nzindawo Mzinda wowala,
mzinda wowala.
Khulupira mchikondike tili pa ulendo. Tama Dzinalo.
Bass: Chipulumoso chapereke e edwa.''',
      '''1.	Ndiyimba nyimbo ya chimwemwe, ndikondwa pakupita kwathuko.
Ndikhulupira Yesu Mbuye, watsuka ine ndayeradi mbuu.

CHORUS:
Ndinka (ndinka) kwathu mmwambamo.
Ndinka (ndinka) dziko lowala.
N’kondwa (n’kondwa) nyimbo poyenda.
Wa-tsuka (Watsuka ‘ne tsuka) ndyeradi mbuu.

2.	Lemero uyembekeza ‘ne, kumalo achimwemwe chosatha.
Nd’okondedwa ‘dzakhalitsako, kwathu kwabwino kwa mtendereko.
''',
      '''1.	Mbuye wathu potsanzikana Ndi akuphunzira ake
Anati Kalarikeni Ku dziko lonse lapansi.

CHORUS:
Sop:
Kodi wangotambalala Tambalala,
Waumitsa mtima wako Yesu afuna antchito,
Koma wangotambalala.

Others:
Tambalala...Koma wangotambalala.

2.	Ma ulosi akukwanitsidwakukwanitsidwa,
a nzeru akuthedwa nzeru;
Owerenga khala m’maso Koma wangotambalala.

3.	Posachedwa akubweranso Kudzatenga oyera mtima,
Kukakhala nawo kumwamba Koma wangotambalala.
''',
      '''1.	Chikondi cha Mulungu wathu Chiposa zones m’dzikoli,
Chotalikira ngati nthanda Chifika pansi panotu;
Makolo athu atachimwa Mulungu nakondabe,
Anatumiza Mwana wake Kudzaombola ife.

CHORUS:
Chikondi chake n’chachikulu Changwiro ndi cha mphavu;
Chidzakhalitsa nthawi zones Oyera dzayimbabe.

2.	Ngakhale anthu angalembe Usana ndi usikunso,
Za Mlungu wathu ndi chikondi pa m’tengo yonse mdzikoli;
Masamba onse akanatha Asanalembe zones,
Za Mlungu wathu ndi Chikondi Kwa ana ake onse.

3.	Pamene ma ufumu onse Adzapasuka tsikulo,
Ochimwa onse adzapempha Miyala iwapsinje ‘wo;
Koma chikondi cha Mulungu Chidzakhalitsa ndithu,
Chisomo cha kupulumutsa Amene amkonda ‘ye.''',
      '''1.	Njirayi ndi yaitali; ndi katundu olemetsa,
Yesu adzatitura Katundu wathu wathu yense.

CHORUS:
Sop:
Kudzakhala Chimwemwe Kudzakhala Chimwemwe Mmawa
mmawa Chimwemwe. Kudzakahala Chimwemwe

Others:
Chimwemwe...Kudzakhala Chimwemwe.


2.	Mmene ife tikulira ndizisoni zosiyana;
Yesu adzapukuta misozi yathu yonse.

3.	Mmene Yesu akubwera kudzatenga olungama,
Kunka nawo kumwamba Kulibe Malirowo.''',
      '''1. Ndifuna mzinda wa kumwamba, komwe wotopa 'pumako. 
Komwe nyumba idikira 'ne, Ee kwathu kwatsopanoko.

CHORUS:  
Ee kwathu kwatsopanoko (kokongola).  
Ee kwathu kwatsopanoko (kokongola). 
Potha ulendou ndirowa mmwambamo,  
Ee kwathu kwatsopanoko. 

2. Ndigwira ntchito ya Mbuyeyo, mpaka chimalizirocho, 
mpaka n'woloke tsidya ilo; Ee kwathu kwatsopanoko.
''',
      '''1. Lead through the fields of sunshine and the pastures green. 
On Thy arms of love and mercy let ever lean.

CHORUS: 
Lead...me lead...me O Thou blessed one. 
Lead...me lead...me, lead me gently on. 

2. Lead me Shepherd through the valleys lest I go astray. 
Lead me kindly Shepherd lead me to the perfect day.
''',
      '''1. Chimo musalole, Limacimwitsa,
Gonjetso limodzi Libweza wina;
Pitabe mtsogolo, Zoipa leka,
Yang’ana kwa Yesu, Adzakusunga.

CHORUS:
Funsa Mbuye thandizo Adzakusunga iwe;
Ali wolola Iye; Adzasunga iwe.

2. Thawani oipa, Ndi otukwana,
Lemekeza Mlungu, Osamamnyoza;
Khala waulemu, Ndi wacifundo,
Yang’ana kwa Yesu, Adzakusunga.

3. Kwa wolakikayo, Korona ‘patsa,
Mwa cigonjetsoco, Kwa opirira;
Mpulumutsi wathu, Adzalimbitsa,
Yang’ana kwa Yesu, Adzakusunga.''',
      '''1. Mnene ine ndisauka Ndi zoipa zangazo
Ndidzapita kwa Mulungu, Adzandilandiratu

CHORUS:;
Mlungu adzalandira, Iye ndiye Tate wanga,
Natumiza Mwana wace, nandifera kalelo.

2. Ngati atsamwali anga sandikonda ine bi.
Ndikhulupirire Mlungu, Iye sandikanai.

3. Pansi pano ndiri mlendo, Kwathu ndi kumwambako,
Mmene adzabwera Yesu Ndidzapita komweko.''',
      '''1. Moyo wanga dzuka limba, Thamanga ndi mphamvu;
Korona wosatha ali, kulindira iwe.

2. Mau a Mulungu wako, Akuitana ‘we;
Dzanja lake likufupa, Ngati ufunitsa.

3. Mtambo wa mboni wozinga, Uyang’anira ‘we;
Iwala zonse za m’mbuyo, Pitabe mtsogolo.

4. Mpulumutsi tikokeni, Tiyambe liwiro;
Tidze pa mapazi anu, Kutula katundu.''',
      '''1.	Kuwunika kochoka mmwamba kuwonetsa kwathuko.
Chembekezo chirimbikitso pogonjetsa tchimolo.

CHORUS:
Ndirimbi...kabe... Chifukwa Cha mphotho,
Ndidi...Kira... Mokhulupika.Ndiriku...pita...
Kwathu kwa bwinoko, Ndidzi...wadi... Ndzawona Yesu.

2.	Ndikhulupira mwa Yesuyo ndipitabe mtsogolo,
Sindiwopatu woyipayo; poyenda nkuwalako.''',
      '''1.	Ndikonda Yesu Mbuyanga 'naplumutsa 'ne.
Ndiyimba kutamanda 'ye Mfumu ya zonse. 

CHORUS:
Ee ndikonda Yesu Mplumutsi wanga
'Nasenza zochimwa zanga ndiyamika 'ye. 

2.	Ndikonda Yesu Mbuyanga 'nandigula 'ne
Ndinetu wopanda mphanvu popanda Iye. 

3.	Ndifuna ndidzam'one 'ye mulemerero
Ndiyendabe ndi Mbuyeyo mwachisomo 'ke.''',
      '''1.	Akatha mabvuto 'dzapeza chimwemwe
mumzinda wokoma wa ku mwamba (ndi Yesu)
'Dzamasuka ndithu ndi chisangalalo
kunthawi zosatha kumtama 'Ye (Mbuyeyo)

CHORUS:
'Dzamasuka   'dzakondwera        
       (masuka)     (kondwera)
po'nana nd'abwenzi ku mwambako(ndi Yesu)
'Dzayimbako    mwa mtendere      
      (komweko)        (kwathu)
 sitidzasochera pomtama 'Ye (Mbuyeyo).

2.	M'bale siya tchimo yenda ndi Mbuyeyo
kuti mlemerero 'dzalowemo (muyaya)
Kopanda nkhawanso pena kusalana 
chimwemwe chokhacho pomtama'Ye (Mbuyeyo)
''',
      '''1.	Muli nyimbo mumtimanga yokhazikikatu yochokera kumwambako 
Pakuyenda munjirayi ikomakomabe inena chikondi chake (cha Yesu)

CHORUS:
Nyimboyo mumtima mwanga (ikoma) 
Ndipeza Chimwemwe ndithu
(Chosathatu)
Ndiyimba nyimbo yokoma (ya mmwamba)
Inena chikondi chake (cha Yesu)

2.	Nyimbo yopatulikayo mumtima mwangamo ikondwetsa nthawi zonse
Nyimbo yauthenga wabwino wa chiplumutso itsogoza mnjira mwanga (mwanga)''',
      '''1.	Nthawi zina zikhala zondigwetsa mphwayi kukhala wosakondwa
ndi wosayamika koma poganiza za Ambuye wanga wandipulumutsa ku ntchimo.
Bass: kubvuto   All: thanthwe langa mndibise ‘ne 

CHORUS:
Bass: Mbuye! 
Alto, Tenor & sop: Ambuye mndibise ‘ne
Bass: Ndibise
Alto, Tenor & sop: Ndibise
Bass: thanthwe langa
Alto, Tenor & sop: Ambuye mndibise ‘ne
Bass: Ndibise
Alto, Tenor & sop: Ndibise
Bass: palibenso wina
Alto, Tenor & sop: Apalibenso wina
Alto, Tenor & sop: wonga ‘Nu
Bass: Mwina
Alto, Tenor & sop: mwina ndigwa mphwayi
Bass: mchisoni
All: mchisoni mwinanso mwachitsogozo chanu Mbuye.
Bass: ndipempha mndibise
Alto, Tenor & sop: Ambuye mndibise
All: Thanthwe langa mndibise ‘ne.

2.	Mwina ndimalephera kupita mtsogolo ndimasowanso mphanvu
ngati salinane koma poganizira za Ambuye wanga wandipulumutsa ku ntchimo.
Bass: kubvuto  All: thanthwe langa mndibise ‘ne''',
      '''1.	Moyo wanga ufanana ndi tsamba la mtengo
lomwe siribwerera kumene lachokera.

CHORUS:
Moyo wanga chonchobe moy wanga chabe bii
moyo wanga ulindira kumene wachokera.

2.	Moyo wanga ufanana ndi madzi a mtsinje
womwe samabwerera kumene achokera.

3.	Moyo wanga ufanana ndi duwa lofota
lomwe siribwerera kumene lachokera''',
      '''1.	Mmene ndinali wochimwa nkhawa bii
Yesu nandipeza ndinakondwera
Chimwemwe cha mdzikoli ndichakutha
Chosatha chiri mwa Yesu yekhayo

CHORUS:
Aleluya ‘lemerero ndikondwa
Yesu ndiye bwenzi lopambanalo
Ndamasuka ku uchimo mwa Yesu
Ndikonda kunena, kuyimba za ‘Ye

2.	Pa Phiri la mdima ndinasochera
Yesu mwachisomo nadza nkuunika
Sindidzaiwala nthawi zonsezo
Nkambakake ndipatsa Yesu zonse

3.	Ndikondwera kugwira ntchito yake
Kuchita mbali yanga yopambana
Kuuza wosochera za Yesuyo
Mpulumutsi wabwino ‘lemu kwa ‘Ye''',
      '''1.	I want to see… that city fair…., 
and with my loved ones live up there.
(And live up there); 
I want to walk… the streets of gold…,
And see their beauty there unfold
(yes, there unfold).

CHORUS:
I want to see… that city fair, 
and with you live… forever there;
I want to know… as I am known…,
And sing with joy… around the throne...

2.	I want to see… the pearly gates, 
and step inside… where Jesus waits;
I want to see… His smiling face…
And live with Him… in that good place…''',
      '''1.	Ndanva za mzinda wokomawo, misewu yake njagolidi;
Ee ndifikako posachedwa (sachedwa).
Komwe Yesu ndiye Mfumuyo, ndidzayimba zomtamanda ‘Ye;
Ee ku mzinda wa ku mwambako (mwambako).

CHORUS: 
Chidzakhala chimwemwecho (Chimwemwe changa);
Powona mzinda wokoma(wo);
(Kwa Yesu) ndzayimba (nyimbo zo)tamanda.
Ndi Iye ndzakhala muyaya (muyaya).

2.	Komwe kulibe za chisoni, nthawi zonse Chimwemwe chokha;
Ee ndifikako posachedwa (sachedwa).
Maso ndi maso ndi Mbuyeyo, kutamanda chisomo Chake;
Ee ku mzinda wa ku mwambako (mwambako).''',
      '''1.	Nditama Dzinalo la Yesu Mbuyanga
Chomboledwere ‘ne nthawi zonse.
(Yesuyo) Asamalira ‘ne ndiyetu bwenziro
chikondi chakecho nchamuyaya.

CHORUS:
Alto:
Ndakhaziki--ka mwa Yesu. Ndikondwa ntha-wi zo-nsezo.
Yesu Mbuye… atsogoza… poyenda kwathuko mnjirayi.

Sop & Tenor:
Ndakhazikika mchikondi cha Yesu. (Ndikondwa)
Ndikondwa nthawitu zonsezo.
Yesu Mbuye… atsogoza… poyenda kwathuko mnjirayi. 

Bass:
Ndakhazikika mwa Yesu.
Ndikondwa nthawi zonsezo.
Yesu Mbuye… atsogoza… poyenda mnji-ra-yi.

2.	Mokondwa ndigwira ntchito ya Mbuyeyo
chifuniro chake nchokomadi.
(Yesuyo) Mmabvuto, mmtendere atsogolera ‘ne
mpaka ndzalowa mu Kenaniyo.''',
      '''1.	There's a mansion up in glory… 
built by hands… that are divine…
And some day… oh, blessed story… 
That bright mansion… will be mine,
it will be mine.

CHORUS:
Blessed home… of love and beauty… 
It the sun… will far outshine…
For my Lord… I'll do my duty… 
And some day… it will be mine…

2.	Oh, the joy… I have in knowing… 
Since from Him… I've ceased to roam…
To that mansion I am going… It is my… 
eternal home, my happy home.

3.	Seems I hear… sweet music ringing… 
Made by those… who for me wait…
Soon I'll join… them gladly singing… 
Just inside… the Eastern gate…''',
      '''1.	Ndirinaye bwenziro lochotsa mantha ndi’mfayo.
Akometsa njirayi pamene ndiyenda.

CHORUS:
Sachite mantha; Yesu alipo, 
achotsa zonse zotchinga njira.
Ife tiri khale; amenya nkhondo, 
nadzagonjetsa adani athuwo.

2.	Uwopanji mnjirayi khulupira mwa Yesuyo;
ndiye njira nchoonadi ndi moyo wosatha.''',
      '''1.	Pa mapazi ake Yesu, ndinva mau akewo!
Ee, pafupi ndi Ambuye, n’khale nthawi zonsezo;
pa mapazi ake Yesu, ndiyang’ana mmbuyomo,
Ee, chikondi chake chonse, chakopadi mtimanga.

2.	Pa mapazi ake Yesu, malo wopambanawo;
ndisiyepo ntchimo langa ndi kupeza mpumulo;
Pa mapazi ake Yesu, ndimalira mtimanga,
pomwe ndimapeza nsisi, tsiku liri lonsero.

3.	Inu Yesu mndidalitse, ndigwadira inuyo;
muyang’anetu pa ine, nane ndikuoneni,
ndikhaletu nawo mtima, monga Yesu Mbuyeyo,
ndionetseretu Yesu, chilungamo changacho.''',
      '''1.	
Sop: Okunkhawo alitu kutiko 
Ten: Amene akunkhatu zabwino
All: kuchoka mudziko loyipali, pochita ndi mawu a Mlunguyo.

CHORUS:
Ndani adze…kudzakunkha…kusonkhani-tsira anthu…
iii kodi ndani atithandizeko, pofunafuna zobala za mmunda.

2.	Anthuni idzani ndi zida zanuzo, 
kudzasonkhanitsa za mmanda wakewo.
Gwiranibe mpaka ambuyeyo adze, 
adzabwera ali kukondwatu.''',
      '''1.	Kuli malo… abwinowo…, kuli malo… okomawo….
Sop: kuli malo awunika Yesu
ATB: mmm
Kuli malo abwino kumwamba.

CHORUS:
Kuli malo abwino kumwamba, matenda ndi maliro kulibe,
Sop: mdimawo kulibe awunika Yesu. 
ATB: mmm
Ndimalo abwino kumwamba.

2.	Okondedwa… mwakonzeka… kudzakomana ndi Yesuyo…? 
Sop: kuli malo awunika Yesu 
ATB: mmm
Kuli malo abwino kumwamba.''',
      '''1.	Nabuka namondwe pa Nyanja, ophunzra ake nabvutika.
Anaiwala mtetezi, kuti ndi mthandizi wa zonse.

CHORUS:
Sop: Uchitanji mantha
ATB: Uchitanji mantha uli ndi Mbuye
Sop: Ukaikiranji
ATB: Ukaikiranji osamuuza Yesu
Sop: Ndiyekhayo amene ali mtetezi
Matenda ndi imfa nakhudzika nalira.

2.	Zobvuta nzambiri mdzikoli, zimatisowetsa mtendere.
Timaiwala mlengi kuti mthandizi wa zonse.''',
      '''1.	Nditatha ntchito zanga mzikoli pakufika chiweruzocho.
Pa usikuwo Mbuye poitana; kodi ‘angelo adzatenga ‘ne?

CHORUS:
kodi ‘angelo oyerawo adzatenga ‘ne? kunka nane mmwamba (ku mwambako)
Kutenga ‘ne mlemerero, ndi Yesu kukankhalitsa muyaya (kwa muyaya).

2.	Ee angelowo adzatenga ‘ne ndikachita bwino mdzikoli.
Komwe ‘dzayimba nyimbo pamodzi kutamanda Yesu mfumuyo.''',
      '''1.	Ndanva kuli malo pakutha dzikoli,
ombo-ledwa ‘dzakondwako (kondwako). 
Kutseri kwa thambo, dziko latsopano,
‘dzako-ndwadii pofikako (fikako).

CHORUS:
‘Dzakwe-za nyi-mbo zo-koma,
mumzinda wabwinowo nda’ngelowo (woyera),
nda’bwenzi ‘dzayimba kutama Yesuyo; 
‘dzako-ndwadii pofikako (fikako).

2.	‘Dzalandira klona wa moyo muyaya, 
ombo-ledwa ‘dzakondwako (kondwako).
Kopanda mabvuto, Chimwemwe chokhacho,
‘dzako-ndwadii pofikako(fikako).''',
      '''1.	Pakutaika ndinasowa thandizo; ndinanva wina ati ndinafera ‘we.
N’kulira kwanga ndinakweza masowo; Iye naplumutsa ‘ne n’chikondi ‘ke.

CHORUS:
Sop: ye—su—yo, Mplu—mu—tsi.

Alto & Tenor:
Yesuyo naplumutsa plumutsa ‘ne;
ku tchimo, ku nkhawa nayeretsa ‘ne.

Bass: 
Yesu, Yesu naplumutsa ‘ne; 
Mplumutsi anayeretsa ‘ne.

All:
N’chisomo chake nyari yanga iwala;
ena aplumuke n’chikondi chake.

2.	Ndinasochera mtali mnjira ya tchimo;
kuwala kunachoka chembekezonso.
Yesu nadzetsa bata ndi kuwalanso; 
Iye naplumutsa ‘ne n’chikondi ‘ke.

3.	Lero powala mnjira mwanga monsemo; 
ndidziwa ndipala kuwala mwa Yesu.
Ndikhala mwa Iye ku nthawi zonsezo; 
Iye naplumutsa ‘ne n’chikondi ‘ke.''',
      '''1.	Yesu mundilankhule mau ofatsawo, 
mndinong’oneze kuti, sulitu wekha ‘we.
Mtima munditsegule; kuti ndinvere ‘Nu, 
Mdzadze mu mtima mwanga, kuti ndikondwedi.

CHORUS:
Mundinong’onezetu, mwansisi zanuzo,
Udzagonjetsa ndithu, udzamasukadi.
Mundilankhule Mbuye, tsiku ndi tsikunso. 
Ndinvetu mau Anu; sulitu wekha ‘we.

2.	Yesu Munene mau ndi ana anuwo, 
Kuyang’anira Inu, muwaphunzitsetu;
Kuti apereketu, moyo kwa Inuyo, 
Udze ufumu wanu, kuti ‘dzaone ‘Nu.

3.	Kale munaonetsa kufuna kwanuko,
Yanga ndidziwe ntchito,ndichite zanuzo;
Ndiremekeze Inu, kwa anthu onsewo, 
Nchite kufuna kwanu, masiku onsewo.''',
      '''1.	Tisonkhanitse zabwino, Mnjira mwathu monsemo;
Tisunge tirigu yekha, Titaye zacabezo;
Tipeze zokondweretsa Mmadalitso a lero,
Mwa chipiriro tichotse Minga yokhumudwitsa.

CHORUS:
Ufese zachifundo, Ufese zachifundo
Ufese zachifundo, Zomwe tidzakolola.

2.	Sitisamala maluwa Ndi mbalame poyimba,
Mpaka mbalame ndiponso maluwa zitachoka;
Dzuwa sitirisamala Pa nthawi ya cilimwe,
Akafikanso mazizi Nthawiyo tilifuna.

3.	Mwana akachita ngozi Poswa chikho chomwera
Kodi mukalipa ko’psa Poturutsa tsinyalo?
Mukadziwa kuti mawa Adzakhala wakufa,
Kodi pakukwiya naye Mupsa Mtima leroli?

4.	Poganizira za m’mbuyo Za zomwe tinachita,
Za mauwo okalipa Okhumutsidwa ena,
Ndi nchito zosaganiza; Izi zitikumbutsa
Kufesatu zachifundo zomwe tidzakolola.''',
      '''1.	Mmawa wina owala ‘dzaona Yesu; akudza mmitambo kudzera ‘we ndi’ne. 
Chimwemwecho nanga pouka ‘lungama; pa ulendo onka kutseri kwa thambo.

CHORUS:
Sop & Bass: 
Nyimbo, nyimbo (nyimbo), za Chimwemwe (mwemwe);
Tsikulo posonkhana olungama. Aleluya (luya), 
lemerero (rero); Pokomana ndi Yesu mlengalenga.

Alto & Tenor: 
Kudzakhala nyimbo, nyimbo za Chimwemwe (mwemwe);         
Tsikulo posonkhana o-lunga-lungama.
Lemu aleluya, lemerero-rero (rero).
Pokomana ndi Yesu mle-ngalenga-lenga.

2.	Nkuthwanima kwa diso ‘dzasandulika; 
olungama a moyo ndi akufanso.
Khamu la angeo ndi olungamawo; 
‘dzatamanda Yesu ku nthawi zosatha.''',
      '''1.	Ochenjera anamanga nyumba pa thanthe, pamene panali polimbaaa;
chinbvula chachikulu ndithudi chinagwa, ndipo nyumba ija inalimba.

CHORUS:
Akapanda kumanga nyumba Yehova; antchito agwira pachabee,
akapanda kusunga mudzi Yehova; alonda alondera chabe.

2.	Opusa anamanga myumba pa mchenga, pamene panalibe thantheee;
chinbvula chachikulu ndithudi chinagwa, ndipo nyumba ija inasweka.''',
      '''1.	‘Dzayimba mokondwa kwa Mlungu; osalekanansoyi.
Chikondi, mtendere mtimamo; osalekanansoyi.

CHORUS:
Osale-kanayi mu dziko lokomalo (komalo).
Kutama Yesuyo; osalekanansoyi.

2.	’Dzanva mau ake chimwemwe; osalekanansoyi.
Kulibe chisoni mdzikolo; osalekanansoyi.''',
      '''1.	Kodi uli kulemedwa ndi zoipazo?
Idza kuno ati Yesu, Pumako.

2.	Ndikamzindikira n’inji Mbuye wangayo?
Ali ndi mabala m’manja mwakemo.

3.	Kodi ali ndi chirema m’mphumi mwakemo?
E! chirembacho cha minga chirimo.

4.	Ndikampeza ndikamtsata ninji pansipo?
Masauko ndi misozi ziripo.

5.	Ndikamfunafuna Iye ndipezenjiko?
Kumariza kwa chisoni chonse.

6.	Ndikampempha anditenge ati bwanji ko?
Ati Yesu “idza msanga, idzatu.”

7.	Kukamtsata, kukampeza ndisaukanji?
Oyera, atumwi, ati idzani.''',
      '''1.	Nsanga timaliza ntchito ndipo ulendo utha; 
tirikupita…kwathu ku mwamba…
Kukakhala ndi Ambuye mumtendere muyaya;
tirikupita…kwathu ku mwamba…

CHORUS:
Alto: Tirikupita…kwathu ku mwamba…
Sop: Ndi Yesu Mbuye…‘dzakhalitsako…
’omboledwa tidzayimba ndi angelo komweko;
tirikupita…kwathu ku mwamba…

2.	Nsanga mapemphero atha mayesero naonso; 
tirikupita…kwathu ku mwamba…
Tisonkhana mwa unyinji ndi kuyimba muyaya; 
tirikupita…kwathu ku mwamba…

3.	Nsanga kudikira kutha tionane ndi Yesu; 
tirikupita…kwathu ku mwamba…
’Dzakhala mu’lemerero kutamanda Mbuyeyo; 
tirikupita…kwathu ku mwamba…''',
      '''1.	Ndinva mabelu akumwamba; pakukhumba kwathuko (kwathuko).
Angel’ayimba mokondwera; wotaik’opezeka; 

CHORUS:
Ndinva mabelu akumwamba (mwamba); anveka mu nyimbozo;
ayimbira ine mokondwa (kondwa); pobadwa mwatsopano.

2.	Ndinva mabelu akumwamba; kutseri kwa mabvuto (mabvuto).
Nthetemya zifika mtimanga, nsanga ndifika kwathu.

3.	Ndinva mabelu akumwamba; kutseri kwa mitambo (mitambo).
Ndikhalabe mwa Yesu Mbuye mpaka ndzalowe mmwamba.''',
      '''1.	Yesu abwera nsanga mmawa winawo; 
‘dzanva lipe-nga loyamba, (pa tsikulo).
Bass: mmwambamo
‘Leme-rero tidzalandira, ‘dzaona Ye-su mmitambo (Ee mmitambo).

CHORUS:
Yesu abwera aleluya akubwera mmitambo;
chimwemwe kwa o’mboledwa (o’mboledwa), Bass: ‘dzakweza
nyimbo, nyimbo podzasonkhana, ‘dzaona Ye-su mmitambo (Ee mmitambo).

2.	Yesu abwera nsanga kutenga ake; 
ndikhamu la angelowo (onyezimawo).
Bass: pamodzi
Tidza-yimba sinnaonenso, ‘dzaona Ye-su mmitambo (Ee mmitambo).''',
      '''1.	Nyimbo zokoma ndiyimbira Yesu Mbuye populumutsa ‘ne.
Ponka ku mwamba Iye nanena ndikaku-konzerani malo.

CHORUS:
Ee malowo…amtendere…omangidwira oyerawo,
ndipitako (pitako), Ee kwathuko, malo opuma amtendere.

2.	Pa ulendo onka ku mwambako, Yesu atsogolera ine.
Zokhumudwitsazo ndizachabe; Yesu potsogolera ine.''',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_ivet(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_Sw() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      'Tune: From Soul Stirring Songs & Hymns.',
      'God is in Our Presence\nTune: OpenHymnal #23.',
      'Glorify Thy Name\nTune: NEH #8',
      'Tune: by Madalitso P. Lindadi.',
      'May no Rash Intruder.\nTune: Handel’s Solomon CHORUS: #64.',
      'Tune: Mrs. Sandram',
      'Tune: NAC Hymn Collection #75.',
      'Tune: by Madalitso P. Lindadi.',
      'Thy Word is a Lamp.\nTune: NAC Hymn Collection #152.',
      'Peace, Joy and Love.\nTune: Gospel song jewels #41',
      'Tune: Khristu Mu Nyimbo #65.',
      'Tune: Matchless Gift #9.',
      'Ask Ye What Great Thing I Know?\nTune: SDA Church Hymnal #273.',
      'Tune: SDA Hymnal #552.',
      'I Would be Ready to Go\nTune: Fossett’s Inspiration #60.',
      'I Know That My Redeemer Lives\nTune: Reformation Hymnal #696.',
      'Our Hearts Sing with Joy\nTune: NAC Hymn Collection #33.',
      'Onward Christian Soldiers.\nTune: Khristu Mu Nyimbo #19',
      'Lead Me to the Rock\nTune: Fossett’s Inspiration #111.',
      'God is Love.\nTune: From Baptist Hymnal.',
      'Thine is The Glory\nTune: SDA Hymnal #171.',
      'Hallelujah What a Promise.\nTune: Matchless Gift #110.',
      'Glory, Praise and Honor.\nTune: NAC Hymn Collection #29.',
      'Strengthen us this day.\nTune: NAC Hymn Collection #44.',
      'My friend Divine.\nTune: Fossett’s Inspiration #94.',
      'Tune: Living Grace #25.',
      'Jesus, Lover of My Soul.\nTune: Hymn & Tune # 1225.',
      'While Shepherds Watched Their Flocks.\nTune: From Soul Stirring Songs & Hymns.',
      'Tune: by Gloria Gather',
      'Breath on Me, Breath of God.\nTune: From Baptist Hymnal.',
      'O little town of Bethlehem.\nTune: NAC Hymn Collection #416.',
      'Jesus, Priceless Treasure.\nTune: SDA Hymnal #239.',
      'Take Me by the Hand.\nTune: Apostolic Hymns #46. ',
      'Joyfully singing.\nTune: NAC Hymn Collection #54. ',
      'Where Charity and Love Prevail.\nTune: NEH #402',
      'Tune: NAC Hymn Collection #7.',
      'Praise to the Lord.\nTune: SDA Hymnal #1.',
      'Christ the Lord is Risen Today.\nTune: Reformation Hymnal #123.',
      'Tune: NEH Complete #517',
      'Ask Not to be Excused.\nTune: Khristu Mu Nyimbo #145.',
      'A Mighty Fortress is Our God.\nTune: From Soul Stirring Songs & Hymns',
      'Conquering Now and Still to Conquer.\nTune: Reformation Hymnal #374.',
      'Be Thou My Vision.\nTune: NEH #235.',
      'Lord of the Sabbath.\nTune: Reformation Hymnal #1.',
      'Tune: Fossett’s Inspiration #119.',
      'Be Still and Know.\nTune: Fossett’s Inspiration #74.',
      'Jesus is Protecting Me.\nTune: Fossett’s Inspiration #27.',
      'I’ll Never Forget His Love.\nTune: Fossett’s Inspiration #30.',
      'Tune: Fossett’s Inspiration #145.',
      'Behold the Lamb of God.\nTune: Handel\'s Messiah part 2, #1.',
      'Tune: Blissful Showers #2.',
      'Again He’ll Come.\nTune: NEH #403',
      'Tune: By B Curtie',
      'Peace amidst our earthly fears.\nTune: NAC Hymn Collection #198',
      'O Sacred Head Now Wounded.\nTune: SDA Hymnal #156.',
      'Angels from the Realms of Glory.\nTune: Open Hymnal #49.',
      'Their sound is gone out into all lands.\nTune: Handel\'s Messiah part 2, #17.',
      'Home Sweet Home.\nTune: NAC Hymn Collection #46',
      'Lord, Lord, come soon!\nTune: NAC Hymn Collection #85',
      'There shines a great light.\nTune: NAC Hymn Collection #185',
      'Turn Your Eyes Upon Jesus.\nTune: SDA Hymnal # 290.',
      'All Things Bright and Beautiful.\nTune: NEH #3',
      'Come, O Sabbath Day.\nTune: SDA Hymnal #387.',
      'Joyful, Joyful we Adore Thee.\nTune: NEH #20',
      'Tune: NAC Hymn Collection #41',
      'Tune: Mrs. Sandram.',
      'Tune: Sacred Thoughts #39.',
      'The fruit of their labours (Isaiah 65:21-23)\nTune: NAC Hymn Collection #174',
      'Beautiful robes',
      'Tune: Majestic Melodies #129',
      'Tune : NAC collection #36',
      'Tune: Reformation Hymnal #291.',
      '''We would see Jesus
Tune: Reformation hymnal #318
''',
      '''Beneath the cross
Reformation hymnal #320
''',
      '''We plough the fields
Reformation hymnal #471
''',
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_Sw(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_Sw() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      'Spirit of the Living God',
      'Mlungu Ali Pano',
      'Tate Tikonda',
      'Pa Ukwati',
      'Ukwati Oyera Taonani',
      'Mbuye Wanga',
      'Holy, Holy, Holy',
      'Ndinachimwa Kwambiri',
      'Mau Anu',
      ' Mtenderewo',
      '\'Tis So Sweet',
      'Working for the Lord',
      'Choposacho Nchani \'Ko?',
      'The Lord\'s My Shepherd',
      'Mbuye Waitana',
      'Ndidziwa Khristu Ngwa Moyo',
      'Tiri Kuyimba Mokondweratu',
      'Akhristu Tiyeni',
      'Nkana anthu akaikire',
      'Mlungu Ndiye Chikondi',
      '\'Lemu Kwa Khristu',
      'Pakuyenda Mdziko Lino',
      'Matamando Onse',
      'Mulimbitse Ife Yesu',
      'Masiku Awala',
      'How Sweet to Trust',
      'Yesu Bwenzi Mtimanga',
      'Abusa Usiku Uja',
      'Shackled',
      'Mudzadze \'Ne Mlungu',
      'Beterehemu Kamzinda',
      'Chuma Chawulere',
      'Mundigwire Dzanja Mbuye',
      'Nyimbo Zofuula',
      'Pomwe Pali Chikondi',
      'Blessed are the Pure',
      'Myamike Mlungu',
      'Khristu Wawuka Lero',
      'Rejoice the Lord is King',
      'Msakane Nchito Ya Mulungu',
      'Mlungu Wathu Ndi wa Mphamvu',
      'Chigonjetso Cha Nthawi Zonse',
      'Mukhale Chiyang\'aniro Changa',
      'Yesu Mbuye wa Sabata',
      'Zizindikiro Za Nthawi',
      'Usafo’ke ndi Mabvuto',
      'Munthawi Ya Mayesero',
      'Nkana Ndiremedwe',
      'No One Ever Cared for Me',
      'Ona Mwana Nkhosa',
      'Trust in God and Sweetly Smile',
      'Pa Phiri la Azitona',
      'They That Trust in the Lord',
      'Mtendere Mumtimamu',
      'Ona Mutu Oyera',
      'Angelo a Mlungu',
      'Mau Anveka',
      'Ndifunitsitsa Kwathuko',
      'Mbuye Yesu; ‘Dzani Msanga',
      'Tiriguyo ndi Namsongole',
      'Kodi Mwalema?',
      'Zonse Zokongolazo',
      'Idza Tsiku Lopuma',
      'Mwa Chimwemwe Tipembedza',
      'This is the day',
      'Kuli mzinda wokongola',
      'I Feel Like Traveling On',
      'Adzamanga Nyumba',
      'Tidzayenda ndi Mbuye',
      'I\'ve Put My Trust in Christ',
      'Moyo Uchokera kwa Inu',
      'Standing on the Promises',
      'Tione Yesu',
      'Pa mtanda wa Yesuyo',
      'Tibyala mminda yathu',
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_Sw(fruit);
    }
  }

  Future<void> insertAllSongs_Sw() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      'Spirit of the Living God\nfall fresh on me. \nSpirit of the Living God\nfall fresh on me. \nBreak me, melt me,\nmould me, fill me. \nSpirit of the Living God\nfall fresh on me.\nAmen.',
      'Mlungu ali pano,\nt’yeni timpembedze;\nndulemu timgwadire ’Ye.\nTipemphere Mlungu,\nkuti akulitse\nchikhulupiriro chathu.\nTimtame, timkweze;\nmodzichepetsatu,\ntimunvere Iye.\nAmen.',
      '1. Tate tikonda, tipembedza Inu.\nTama dzinalo, dziko lonse,\nTama dzinalo, Tama dzinalo,\nTama dzinalo, dziko lonse.\n\n2.  Yesu tikonda, tipembedza Inu.\nTama dzinalo, dziko lonse,\nTama dzinalo, Tama dzinalo,\nTama dzinalo, dziko lonse.\n\n3.  Mzimu tikonda, tipembedza Inu.\nTama dzinalo, dziko lonse,\nTama dzinalo, Tama dzinalo,\nTama dzinalo, dziko lonse.\nAmen.',
      '1. Pa ukwati uja kalero,\nmKana wa Galileya,\nYesu munalitu pomwepo;\nmlendo oyitanidwa.\nPa ukwati wa lerolino\ntipempha mukhale nafenso.\nMukhaletu mboni yathuyo,\nmudalitsetu awiriwo.\n\nCHORUS:\nTikondwera lerotu\nmwamuna ndi mkazi.\nMlungu athandize ‘nu\nkukondwa muyaya.\n\n2.  Mkwati wamkulutu ndi Yesu,\nife mkwatibwi wake.\nMlungu ndiye mboni yathuyo\nndi akumwamba onse.\nUkwati wa mwana wa nkhosa\nuli pafupi, wayandika.\nAngelowo adzaimbira;\nnafenso lero tikuimba.\n\n\n\n',
      'Ukwati oyera taonani,\nfanizo la Yesu\nndi Mpingo wake.\n'
          'Chikondi cha Yesu\npa Mpingo wake\n'
          'Ndi changwiro\nndi chosathanso.\n\n'
          'ATB:\nMwamuna ndi mkazi\nthupi limodzi.\n\n'
          'Mwamunayo ndi Yesu,\nmkazi ndi Mpingo.\n\n'
          'ATB:\nMwamuna ndi mkazi\nthupi limodzi.\n\n'
          'Wina sangamasule\nchomanga Mlungu.\n\n'
          'Yesu sadzalekana\nndi Mpingowo;\n'
          'Mwamuna sadzalekana\nndi mkazi wake\nmpaka muyaya.\n\n\n\n\n',
      '1. Mbuye Wanga ‘Nu mundisunge\nmungaka yanu ndibisalemo.\n\n2. Dzina lanu limabweretsa\nchimwemwecho;\nlimachotsa zokhumudwitsa\nmumtimamo\ninu ndinu thanthwe lolimba\nmwayenera kulandira\nulemerero ndi ulemu.',
      'Holy, holy, holy,\nholy is the Lord;\nHoly, holy, holy,\nholy and adored.\nLord without beginning,\n'
          'Lord without an end;\nEverlasting ruler,\nCounsellor and Friend.\nAmen\n\n\n\n\n',
      'Ndinachimwa kwambiri,\nsinnanvere lamulo;\nndinayenera imfa.\n'
          'Ndirimoyo lero\nchifukwa cha Yesu,\nanakhululukiradi ntchimolo.\n'
          'Ndikhale otani,\npowona chipulumutso chotere?...\n'
          '\"Pita, pita; usakachimwenso.\"\n\n',
      '1. Mau anu mumtima mwanga\nndinawabisa, ndinawabisa;\n'
          'Kuti ndisalakwire Inu,\nkuti ndisalakwire Inu.\n\n'
          '2. Mau anu ndiwo nyali\nya kumapazi anga;\n'
          'S: Nyali...nyali...\n'
          'ATB: Ku mapazi...ku mapazi...\n'
          'All: Ndikuunika\nkwa pa njira panga.',
      '1.	Mtenderewo ndamasulidwa ‘ne;\nzochimwa zanga zakhlulukidwa.\n\n'
          '2.	Chimwemwe chodala chisefuka;\nndapatsa Yesu zanga zonsezo.\n\n'
          '3.	Ndapeza chikondi chodabwitsa;\nchomwe chikhala nthawi zonsezo.',
      '1. ‘Tis so sweet to trust in Jesus,\njust to take Him at His Word;\nJust to rest upon His promise,\njust to know, \"Thus saith the Lord.\"\n\n'
          'CHORUS:\nJesus, Jesus, how I trust Him!\nHow I‘ve proved Him o‘er and o‘er!\nJesus, Jesus, precious Jesus!\nO for Grace to trust Him more!\n\n'
          '(Trio)\n2.  Yes, ‘tis sweet to trust in Jesus,\njust from sin and self to cease;\nJust from Jesus simply taking\nlife and rest, and joy and peace.\n\n'
          '3.  I‘m so glad I learn to trust Thee,\nprecious Jesus, Saviour, Friend;\nAnd I know that thou art with me,\nwilt be with me till the end.\n\n\n',
      '1. Working for the Lord\nwhile time is flying,\n'
          'Taking up our cross,\nourselves denying;\n'
          'To the things of earth\neach moment dying,\n'
          'Tho some things we\ndo not understand.\n\n'
          'CHORUS:\n'
          'Oft the way is rough,\n(or seems as)\ndark as night;\n'
          'We\'re to walk by faith,\n(by faith, and)\nnot by sight\n'
          'We are pilgrims here,\n(just passing)\nthru this land,\n'
          'Trusting when we\ndo not understand.\n\n'
          '2. Faithful we shall be\ntill heads are hoary,\n'
          'Never giving up till\nends earth\'s story;\n'
          'Knowing some day we\'ll\nbehold the glory\n'
          'Of our Lord, and then\nwe\'ll understand.\n\n\n\n',
      '1. Choposacho nchani \'ko\?,\nchindirimbitsa chonchi;\n'
          'Dzinalo lodalalo,\nmphatso ya Mulunguyo;\n'
          'Yesu Wopachikwayo.\n\n'
          '2. Ee maziko ampingo,\nee adzetsanso nyimbo;\n'
          'Wochotsa tchimo langa,\nndi wodzetsa mtendere;\n'
          'Yesu Wopachikwayo.\n\n'
          '3. Zanga zonse \'yaniko\?,\nMoyo Wosatha \'yani;\n'
          '\'Dzandi\'ka kulamanja,\nnd\'angelo mlemerero;\n'
          'Yesu Wopachikwayo.\n\n'
          '4. Choposacho ndiichi,\nchondirimbitsa chonchi;\n'
          'Chikhulupiro mwa\'Ye,\nMpulumutsi wangayo;\n'
          'Yesu Wopachikwayo.\n\n\n\n',
      '1. The Lord’s my shepherd I’ll not want,\nHe makes me down to lie\n'
          'In pastures green He leadeth me\nthe quiet waters by.\n\n'
          '2. My soul He doth restore again,\nand me to walk doth make.\n'
          'Within the paths of righteousness,\ne’en for His Own Name’s sake.\n\n'
          '3. Yea, though I walk in death’s\ndark vale,\nYet will I fear no ill,\n'
          'For Thou art with me, and Thy rod\nand staff me comfort still.\n\n'
          '4. Goodness and mercy all my life\nshall surely follow me:\n'
          'And in God\'s house forever more\nmy dwelling place shall be.\n\n\n\n',
      "1. Mbuye waitana ndimtumikire;\n"
          "S: ndakonzeka kupita.\n"
          "ATB: ndakonze – konzeka kupitako.\n"
          "B: ndipita\n"
          "Komwe anthu asowa chikondi ‘ke.\n"
          "SB: ndakonzeka kupita.\n"
          "AT: ndakonze – konzeka kupitako.\n\n"
          "CHORUS:\n"
          "SB:\n"
          "Ndakonzeka ndi-thu ku-mtsa-tira ‘Ye.\n"
          "Nyali yanga i-wa-li-re ponsepo.\n"
          "Kudzipere-ka ndi-thu o-sakana.\n"
          "Mbuye nditso-go-ze-ni nda-konzeka.\n\n"
          "AT:\n"
          "Ndakonzekera, ndifunitsitsa\nkumtsatira Mbuye Yesu.\n"
          "Nyali yangayo iwaliredi\nanthu ponse, ponsepo.\n"
          "Kudzipereka ndi mtima\nonse osakana, osakana.\n"
          "Tsogolereni komwe mufuna\nndakonzeka kupitako.\n\n"
          "2. Mbuye waitana ndigwire ntchito;\n"
          "S: ndakonzeka kupita.\n"
          "ATB: ndakonze – konzeka kupitako.\n"
          "B: ndipita\n"
          "Posachedwa atenga ‘ne mmwambamo\n"
          "SB: ndakonzeka kupita.\n"
          "AT: ndakonze – konzeka kupitako.\n",
      '1. Ndidziwa Khristu ngwa moyo;\nAtetezera \'ne.\nNsembe yake ndilonjezo\nla chipulumutso.\n\n2.  Khristu ndiye chitsanzotu\ncha wogona mwa \'Ye;\nNdikhala wosamlekayi;\nnkana kufa komwe.\n\n3. Ndidziwa Khristu ngwa moyo,\nposachedwa \'dzanso.\nNkana ine ndimwalire;\n\'dzandiwukitsanso.\n\n\n\n\n',
      '1.\nSA:\nTiri kuyimba mokondweratu;\nkutamanda Mlungu wokonda.\nAlinafetu munyengo zonse;\nchifundo Chake nchamuyaya.\nTiri kuyimba kutamandatu\nMlungu wokonda.\nAlinafetu munyengozonse;\n........ndo Chake nchamuyaya.\nAlinafetu munyengo zonse;\nchifundo Chake nchamuyaya.\n\nTB:\nTiri kuyimba mokondweratu;\nkutamanda Mlungu wokonda.\nAlinafetu munyengo zonse;\nchifundo Chake nchamuyaya.\nAlinafetu munyengo zonse;\nchifundo Chake nchamuyaya.\n\n'
          '2.\nSA:\nTitamandatu Mbuye wathu \'Nu,\ntiyamika ukoma Wanu.\nUlemerero ukhale Wanu\nYesu Mplumutsi, Mfumu myaya.\nTitamandatu, tiyamikatu\nukoma Wanu.\nUlemerero ukhale Wanu\n.........Mplumutsi, Mfumu myaya.\nUlemerero ukhale Wanu\nYesu Mplumutsi, Mfumu myaya.\n\nTB:\nTitamandatu Mbuye wathu \'Nu,\ntiyamika ukoma Wanu.\nUlemerero ukhale Wanu\nYesu Mplumutsi, Mfumu myaya.\nUlemerero ukhale Wanu\nYesu Mplumutsi, Mfumu myaya.\n\n\n',
      '1. Akhristu tiyeni! Nkhondo tigwire,\n'
          'Yesu Mbuye wathu, Atitsogoza,\n'
          'Ona mbuye yekha, Atithandiza;\n'
          'Ndi mbendera yake, tiyitsatira.\n\n'
          'CHORUS:\n'
          'Akhristu tiyeni! Nkhondo tigwire,\n'
          'Yesu Mbuye wathu, Atitsogoza.\n\n'
          '2. Nkhondo ya satana,\nmsanga ithawa,\n'
          'Akhristu tiyeni, tidzapambana;\n'
          'Mphamvu zake zitha, Yesu titama;\n'
          'Yimbani anzathu nyimbo tikweza.\n\n'
          '3. Gulu lalikulu, adza akhristu;\n'
          'Titsatana namwo, ana a Mlungu;\n'
          'Sitipatukana, tonse tikhala,\n'
          'ndi mtima umodzi, timakondana.\n\n\n\n',
      "1. Nkana anthu akaikire\nndi kukana Yesuyo.\n"
          "Akana chiyembekezocho\nndi chipulumutsocho.\n"
          "Thandizo langa ‘Yesu yekha pogonjetsa mayeso.\n"
          "Ndipempha mphanvu nthawi zonse\nkwa thanthwe lolimbalo.\n\n"
          "CHORUS:\nS:\n"
          "Tha-nthwe, Yesuyo, mtetezi\npo-dza namondwe wa bvuto.\n"
          "Ndatetezedwa Ee kwa mdaniyo\npobisala mwa Yesu\n"
          "thanthwe ndi mtsogoziyo.\n"
          "A-yi kukai-kiranso\nYe-su thanthwe mtso-goziyo.\n"
          "Ndiye bwenziro\nnthawi zonsezo;\n"
          "Ee thanthwe loli-mba-lo.\n\n"
          "A:\n"
          "Ndifuna thanthwe lolimbalo\n"
          "podza namondwe wa bvutolo.\n"
          "Nda-te-tezedwa Ee kwa mdaniyo\npobisala mwa Yesu\n"
          "thanthwe ndi mtsogoziyo.\n"
          "A-yi kukai-kiranso\nYe-su thanthwe mtso-goziyo.\n"
          "Ndi-ye bwenziro\nntha-wi zonsezo;\n"
          "Ee thanthwe loli-mba,\nEe lolimbalo.\n\n"
          "T:\n"
          "Tha-nthwe, Yesuyo, mtetezi\npo-dza namondwe wa bvuto.\n"
          "Ndatetezedwa Ee kwa mdaniyo\npobisala mwa Yesu\n"
          "thanthwe ndi mtsogoziyo.\n"
          "A-yi kukai-kiranso\nYe-su thanthwe mtso-goziyo.\n"
          "Ndi-ye bwenziro\nnthawi zonsezo;\n"
          "Ee thanthwe loli-mba,\nEe lolimbalo.\n\n"
          "B:"
          "Tha-nthwe, Yesuyo, mtetezi\npo-dza namondwe wa bvuto.\n"
          "Ndatetezedwa Ee kwa mdaniyo\npobisala mwa Yesu\n"
          "Ee palibe kukaikanso\nYesu thanthwe ndi mtsogoziyo.\n"
          "Ndi-ye bwenziro\nnthawi zonsezo;\n"
          "Ee thanthwe loli-mba-lo.\n\n"
          "2. Munthu samakhala ndi moyo\nndi chakudya chokhai;\n"
          "komatu ndi mau a Mlungu\npamodzi ndiye moyo.\n"
          "Yesu ndiye mau amoyo,\nmpulumutsi wa dziko.\n"
          "Wagonjetsa tchimo ndi ‘mfayo;\nEe thanthwe lolimbalo.\n",
      '1. Chikondi mwachisomotu\n'
          'chiwunikira njira,\n'
          'Chidzetsa Chimwemwe ndithu,\n'
          'Mlungu ndiye Chikondi.\n\n'
          '2. Zina zonse zimanveka,\n'
          'zimasintha, zimatha.\n'
          'Koma \'Ye sasintha myaya,\n'
          'Mlungu aposa zonse.\n\n'
          '3. Tiwona ubwino wake\n'
          '\'nkhale mnthawi za mdima.\n'
          'K\'wala kwake kulimbitsa,\n'
          'Mlungu ndiye Chikondi.\n\n\n',
      '1. \'Lemu kwa Khristu owuka mmanda,\n'
          'ndiye mwini moyo; imfa yagonja.\n'
          'Angelo oyera ochoka mmwamba;\n'
          'Nachotsa mwalawo pa manda paja.\n\n'
          'CHORUS:\n'
          '\'Lemu kwa Khristu owuka mmanda,\n'
          'Ndiye mwini moyo; imfa yagonja.\n\n'
          '2. Kuwuka kwake kwa Yesu Mbuye,\n'
          'Kwachotsa mwa ife\nmantha ndi\'mfayo.\n'
          'Mokondwa tiyimbe chigonjetsocho;\n'
          'Imfa mbola yako iri kutiko.\n\n'
          '3. Tikhulupira mwa Inu Mbuye,\n'
          'Popanda Inuyo tiribe moyo.\n'
          'Mutithandize \'fe kugonjetsatu\n'
          'Mayeso nd\'uchimo;\ntidzanke mmwamba.\n\n\n\n\n',
      '1. Pakuyenda mdziko lino\nyesu satitaya \'fe;\n'
          'Ndipo \'nalonjeza \'dza posachedwa.\n'
          '(\'dzatu, Ee kutenga \'fe mmwamba.)\n'
          'Ngati tikhulupirika\npoyenda mmawu ake;\n'
          'Adzatipatsa \'fe moyo wosatha.\n(wamuyaya.)\n\n'
          'CHORUS:\n'
          'Alto:\nHallelu...jah lonjezolo,...\nkuti si...tidzafanso.\n'
          'Tidzakha...la kwa muyaya...\nmu\'fumu... wa Khristuwo.\n'
          'Mabvuto... adzatheratu,\nndi ziso...ni zonsezo.\n'
          'Hallelu...jah lonjezolo\nkuti si...tidzafanso.\n\n'
          'Others:\nHa-lle-lujah lonjezo lokoma;\nku-ti-tu, Ee sitidzafanso.\n'
          'Ti-dza-khala kunthawi zamyaya\nmu-\'fu-mu wa Khristuwo\nwabwinowo.\n'
          'Ma-bvu-towo, mabvuto kulibe;\nzi-so-ni, zisoni zonsezo.\n'
          'Ha-lle-lujah lonjezo lokoma\nku-ti sitidzafa (sitidzafanso.)\n\n'
          '2. Yesu ananka kwa \'Tate\nkukat\'konzera malo;\n'
          'Ndipo \'nalonjeza \'dza posachedwa.\n'
          '(\'dzatu, Ee kutenga \'fe mmwamba.)\n'
          'Tikalola chisomo \'ke\nnkuyenda monga Iye;\n'
          'Adzatipatsa \'fe moyo wosatha.\n(wamuyaya.)\n\n\n\n\n',
      '1. Matamando onse\nakhale kwa Yesu;\nMpulumutsi; napulumutsa \'fe.\n\n'
          'CHORUS:\n'
          'S:     Ndiye wakuyera,\n'
          'SA:  Wamphanvu zonsezo;\n'
          'All:   Mbuye titamanda \'Nu.\n'
          'Sitidzalekana\nndi Mbuyathu Yesu,\n\'lemu kwa \'Ye; aleluya!\n\n'
          '2. Titamanda Inu,\nnthawitu zonsezo.\nNdi Inuyo sitiwopayi.\n\n\n\n\n',
      '1. Mulimbitse ife Yesu\nEe ndimphanvu yanuyo\n'
          'Kuti tirimbike ndithu\npokana zoipazo\n\n'
          'CHORUS:\n'
          'Mtiphunzitse cho’nadi;\n'
          'Mau anu nchoonadi\n'
          'Mau anu nchoonadi\n\n'
          '2. Amodzi mchikhulupiro,\nchembekozo, chikondi;\n'
          'Ndiro khumbo latonse ‘fe;\nYesu mtidalitse ‘fe\n',
      "1. Masiku awala poyenda\nnjira papatiza.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n"
          "Wandironjeza tsiku lina\nndidzakhala naye.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n\n"
          "CHORUS:\n"
          "Ndikondwa ndapeza bwenzi;\n"
          "anafa kupulumutsa\n(moyo wanga).\n"
          "Nawalitsa njira yanga;\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n\n"
          "2. Ndirumikizana naye\nMfumu yondikonda ‘ne.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n"
          "Ndadzadzidwa mchimwemwe\nndi Madalitso akewo.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n\n"
          "3. Ganizo lokoma ndithu\nkuti ayenda nane.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).\n"
          "Potha ntchito yanga mdziko\nadzayenda nanebe.\n"
          "Ndikondwa ndapeza bwenzi\n(peza bwenzi).",
      '1. Jesus is a friend so true\nHe will lead you safely thru,\n'
          'He will guide you\nto that home above;\n'
          'If you serve Him ev\'ry day\nHe\'ll go with you all the way,\n'
          'He will keep you\nby His grace and love.\n\n'
          'CHORUS:\n'
          'O how sweet......\nto trust the Lord,.....\nTo live each day.......\n'
          'in sweet accord;.......\n'
          'Daily read........\nHis blessed word,........\n'
          'O how sweet to trust\nthe loving Lord.\n\n'
          '2. Jesus died upon the cross\nthat we might not suffer loss,\n'
          'Gave to us a hope of lasting life;\n'
          'If His voice we will obey\nwe\'ll be happy ev\'ry day,\n'
          'We can triumph over sin and strife.\n\n\n\n\n',
      '1. Yesu, Bwenzi ntimanga,\nndithawira kwanuko.\n'
          'Pakuka madziwo,\npakuomba mphepoyo.\n'
          'Mundibise Mbuyanga,\nlikaleka bvutolo,\n'
          'Mnditsogoze bwinotu,\nMndilandire kwanuko.\n\n'
          '2. Pobisala penai,\nndingokangamira \'Nu.\n'
          'Ndiri wosauka \'ne,\nMbuye, msandisiyedi.\n'
          'Wothandiza wanga \'Nu,\nndikukhulupira \'Nu,\n'
          'Mu mapiko anuwo\nMundipfunde inedi.\n\n'
          '3. Khristu, Mukwaniradi,\nMndikhutitse mmtimanga;\n'
          'Msangalatse ifetu,\nobvutika tonsefe.\n'
          'Ine ndi woipadi!\nInu wakuyera mbu;\n'
          'Ine ndi wongengadi,\nwoonadi Inutu.\n\n'
          '4. Nsoni zanu ziinga\nzakuipa zangazo.\n'
          'Mundisunge woti mbe,\nEe! Ndi mwazi wanuwo.\n'
          'Pa chitsime chanucho\nMundimwetse Inudi;\n'
          'Mtima wanga madziwo.\nAdzayendayendabe.\n\n\n\n\n',
      '1. Abusa usiku uja\npa ulonda wawo;\n'
          'Anadza mngelo wa Mlungu\nnd’ulemererowo.\n'
          'Nd’ulemererowo.\n\n'
          '2. Abusa nagwidwa mantha\nndipo mngelo nati:\n'
          '“Msawope ndadza nd’uthenga\nwabwino kwa inu.\n'
          'Wabwino kwa inu.”\n\n'
          '3. Mmudzi mwanu\nlero lino m’fuko la Davide;\n'
          'Mwabadwa Yesu Mplumutsi;\nmu khola la ng’ombe.\n'
          'Mu khola la ng’ombe.\n\n'
          '4. Pompo khamu la angelo\nnayimba nyimboyi:\n'
          '“Ulemu kwa Mlungu mmwamba,\nmtendere kwa anthu.\n'
          'Mtendere kwa anthu.”\n\n\n\n\n',
      '1. Shackled by a heavy burden,\n'
          '\'Neath a load of guilt and shame.\n'
          'Then the hand of Jesus touched me,\n'
          'And now I am no longer the same.\n\n'
          'CHORUS:\n'
          'He touched me, Oh; He touched me.\n'
          'And all the joys that floods my soul.\n'
          'Something happened and now I know,\n'
          'He touched me and made me whole.\n\n'
          '2. Since I met this blessed Saviour,\n'
          'Since He cleansed and made me whole;\n'
          'I will never cease to praise Him,\n'
          'I\'ll shout it while eternity roll.\n\n\n\n\n',
      '1. Mudzadze \'ne Mlungu,\n'
          'Musinthe mtimanga;\n'
          'Kuti ndikonde za Inu,\n'
          'Nkuchita zomwezo.\n\n'
          '2. Mudzadze \'ne Mlungu,\nndikhale wanudi;\n'
          'Uchimo uliwonsewo\nndirekane nawo.\n\n'
          '3. Mudzadze \'ne Mlungu,\n'
          'Ndidzakhale nanu\n'
          'Ku nthawi za muyayazo,\nmu \'fumuwanuwo.\n'
          'Amen.\n\n\n\n\n',
      "1. Beterehemu kamzinda\nkaphee kosanveka,\n"
          "uli mtulotu angelo\nmwa phee phee afika;\n"
          "mdima wako watha kwadza,\nkwadza k’wala kosatha,\n"
          "mantha atha ch’embekezo\nchafikatu lero.\n\n"
          "2. Mwachetechete mphatso\nyoposa iperkedwa.\n"
          "Ndimmomwe Mlungu\nadalitsira anthu onse.\n"
          "Mwaphee phee Khristu\nagogoda mumtimamo,\n"
          "ukadzichepetsa ndithu\numlandira iye.\n\n"
          "3. Yesu Mbuye lowanitu\nmmitima yathuyi.\n"
          "Muchotse tchimo lonsero\ntikhale anudi.\n"
          "Angelo ayimba\nwochimwa aplumuka.\n"
          "M’khale nafe nthawi\nzonse inu Emmanuel.\n",
      '1. Chuma chawulere;\nndiye Yesu Khristu,\nbwenzi langalo.\n'
          'Nthawitu zonsezo;\nndifuna Inuyo\nmundisungetu.\n'
          'Ndine wanu Mbuyanga,\nsindingakuyiwaleni.\n'
          'Ndifuna Inuyo.\n\n'
          '2. S: Yesu mmanja mwanu;\nndipeza mpumulo\nnthawi zonsezo.\n'
          'SA: Ngakhale namondwe\nasawutsa ine;\nmulimbitsa \'ne.\n'
          'All: Mayesero, machimo,\nzowawa zazinga ine;\n'
          'Yesu sataya \'ne\n\n'
          '3. Nkhawa pakuda bii;\nYesu Mpulumutsi\nachotsa mdima.\n'
          'Kwa wokonda Mlungu,\nnkana bvuto lidze;\nalimba mtima.\n'
          'Chondigweracho chigwe;\nmwa Inu ndikondwerabe;\n'
          'Chuma chawulere.\n\n\n\n\n',
      "1. Mundigwire dzanja Mbuye;\nine sindziwa njira.\n"
          "Mdima undizinga ine;\nn’gwireni n’sasochere.\n"
          "Ambiri alowerera\npoyenda opanda ‘Nu;\n"
          "Zondikopa ndi zambiri;\nMbuye ndiyende nanu.\n\n"
          "CHORUS:\n"
          "Ndekha sindingayende;\nMbuye mundigwire dzanjali.\n"
          "Mbuye mundigwire dzanjali.\n\n"
          "2. Njira ndiyenda n’jobvu;\nmmapiri ndi mchigwamo.\n"
          "Thambo lizinga ponsepo;\nkwathu sikuoneka.\n"
          "Mmene ndiyandikira mchigwa\ncha mthunzi wa imfa.\n"
          "Powona chiweruzocho;\nMbuye ndiyende nanu.",
      'Nyimbo zofuula\nt’yimba mwachimwemwe,\n'
          'ulemu, matamando kwa Mlungu.\n'
          'B: Yimbani kwa Mlungu\nana a Ziyoni.\n'
          'T: …Yimbani…\n'
          'A: ……Yimbani kwa Mlungu\n'
          'S: ………Yimbani\n'
          'All:\n'
          'Ana a Ziyoni,\nana a Ziyoni.\n'
          'Ulemu, matamando\nkwa Mlungu.\n'
          'Ulemu, matamando\nkwa Mlungu.\n'
          'Mwa ‘laliki ake\ntadalitsidwa;\n'
          'atitsogoza ‘fe\nkumwambako.\n'
          'Tiyimba nyimbo\nmokondweratu.\n\n'
          'T:\nUlemu, ma-tamando;\naleluya… aleluya,\naleluya, aleluya,\naleluya, aleluya.\n\n'
          'A:\n…Ulemu, ma-tamando;\naleluya… aleluya,\naleluya, aleluya,\naleluya, aleluya.\n\n'
          'S:\n……Ule-mu; aleluya….\naleluya, aleluya,\naleluya, aleluya.\n\n'
          'B:\n.........Aleluya, aleluya,\nulemu, tama; aleluya,\naleluya, aleluya.\n\n\n\n\n',
      "1. Pomwe pali chikondi\nMlungu ali pomwepo.\nChikondi cha Yesu yekha\nchasonkhanitsa ‘fe.\n\n"
          "2. Tiyamika pophunzira\nchikondi cho’nadi.\nMphanvu ndi mtima onsewo\nkukonda Yesuyo.\n\n"
          "3. Tikhululukiranatu\nmonga tirapanso.\nTikondana wina ‘nzake\nmchiyero cha Mbuye.\n\n"
          "4. Chikondi chiribe tsankho\npa mtundu wa anthu.\nPokonda Mlungu yekhayo,\namodzi tikhala.",
      '1. Blessed are the pure in heart\nfor they shall see God;\nthey shall see God.\n'
          'Pure hearts shall see God.\nO blessed are the pure,\nthe pure in heart.\n\n'
          '2. Odala oyera mtima\n\'dzawona Mlungu;\n\'dzawona Mlungu.\n'
          'Oyera mtima \'dzawona Mlungu.\nEe odal\'oyera, yera mtima.\n\n'
          '3. Lola Yesu mmtimako;\nayeretse \'we, kwa wulere.\n'
          'Ukhale wake;\nudzawone Mlungu.\nEe odal\'oyera, yera mtima.\n\n\n\n\n',
      '1. Myamike Mlungu wamphanvu,\nMfumu, Namalenga.\n'
          'Moyo wanga umtamande\npopulumutsidwa.\n'
          'Onse onva tiyeni timyamike,\npamodzi timtamande \'Ye.\n\n'
          '2. Myamike Mlungu\nyemwe alamulira zonse,\n'
          'Aphimba iwe mmapiko ake;\nnasamala.\n'
          'Kodi suwona chikondi chakecho;\napatsa zosowa zako.\n\n'
          '3. Myamike Mlungu\nwopambanitsa moyo wako;\n'
          'Ukoma ndi chifundo\nchake ziri pa iwe.\n'
          'Tangoganiza zomwe angachite\nngati bwenzi lokonda \'we.\n\n\n\n\n',
      '1. Khristu wawuka lero; Aleluya!\nAngelowo anena: Aleluya!\n'
          'Yimbani chigonjetso; Aleluya!\nYimbani dziko lonse. Aleluya!\n\n'
          '2. Khristu Ali Ndi moyo; Aleluya!\nWagonjetsa imfayo; Aleluya!\n'
          'Nafa kuwombola \'fe; Aleluya!\nAnawuka mmandamo. Aleluya!\n\n'
          '3. Khristu Mpulumutsiyo; Aleluya!\nWagonjetsa mandawo; Aleluya!\n'
          'Kutipatsa \'fe moyo; Aleluya!\nWaulere wosatha. Aleluya!\n\n\n\n\n',
      "1. Rejoice the Lord is King!\nYour Lord and King adore;\n"
          "give thanks, O mortals, sing,\nand triumph ever more.\n"
          "Lift up your heart, lift up your voice;\nrejoice; again I say, rejoice.\n\n"
          "2. The Saviour, Jesus, reigns,\nthe Lord of truth and love;\n"
          "when He had purged our stains,\nHe took His seat above.\n"
          "Lift up your heart, lift up your voice;\nrejoice; again I say, rejoice.\n\n"
          "3. Rejoice in glorious hope!\nFor Jesus shall return\n"
          "and take us to eternal rest\nfor which we yearn.\n"
          "We soon shall hear the angel’s voice;\nthe trump of God shall sound, rejoice.",
      '1. Msakane ntchito\nya Mulungu wanuyo,\nmupite komweko\nAfuna Iyeyo.\n'
          'Anaitana ‘nu, Amaitanabe,\nmudzakondweradi\npogwira ntchitoyo.\n\n'
          'CHORUS:\n'
          'Bwerani, (lero),\nmsakane ntchitoyo,\nbwerani, (lero),\n'
          'Kwa Mluungu wanuyo.\n'
          'Msakane ntchito\nya Mulungu wanuyo,\nmupite komweko\nAfuna Iyeyo.\n\n'
          '2. Msakane ntchitoyo,\nimvani leroli; mwakana kalelo,\nmusakanenso bi!\n'
          'Zotuta nzambiri,\nachepa ’nchitowo,\nmukondekondetu\nkukopa anthuwo.\n\n\n\n\n',
      '(Unison)\n'
          '1. Mlungu wathu\nndi wa mphamvu;\nlinga losatekeseka.\n'
          'Ndiye Mpulumutsi wathu;\nku mabvuto onsewo.\n'
          'Tsono satanayo,\nndi kuzama konse,\nalimbana nafe,\nkuyambira kale.\n'
          'Komabe adzagonja.\n\n'
          '2. Nkana dziko ndi ziwanda;\nzide ndi kutipha \'fe.\n'
          'Sitiwopa poti Mlungu;\nApambana mwa ife.\n'
          'Satana \'zunza \'fe;\ntipirira mzonse,\npodziwa kutitu\niye \'dzathedwanso\n'
          'Ndi Yesu Mplumutsi wathu.\n\n'
          '3. Dziko, ziwanda, satana;\nYesu aposa zonsezo.\n'
          'Apatsa mphatso za Mzimu;\nkwa ife munkhondoyi;\n'
          'Kuti tikwanitse\nkuleka za mdziko,\nnkana kufa komwe;\n'
          'Mlungu \'dzadzutsa \'fe\nku moyo wa muyaya.\n\n\n\n\n',
      '1. Chigonjetso cha\nnthawi zonse\nchiri mwa Yesu Mfumu.\n'
          'Atsogoza okhulupira\npakati pa nkhondoyo.\n'
          'Ona alimba ntimabe\natabvala zokoma;\n'
          'Atama dzina la Yesu,\nmokondwa onse ati:\n\n'
          'CHORUS:\n'
          'Siyawamphanvu nkhondoyi,\nSiyawachangu ayi;\n'
          'Koma okhulupirika,\nmwa chisomo cha Mlungu.\n\n'
          '2. Chigonjetso cha\nnthawi zonse\nchiri mwa Yesu Mfumu.\n'
          'Maufumu otchuka onse,\nonse adzatheratu;\n'
          'Koma ankhondo a Mlungu;\nokhulupirikawo;\n'
          'Adzakondwera muyaya\npakutha pa nkhondoyi.\n\n\n\n\n',
      '1. Mukhale chiyang\'aniro changa,\nAlefa, Omega mmoyo mwanga.\n'
          'Pakugonapo ndinso podzuka;\nYesu mukhale kuwala kwanga.\n\n'
          '2. Mukhale chiyang\'aniro changa,\nInetu wanu Inunso wanga.\n'
          'Za mdziko zisandisocheretse;\nYesu mukhale kuwala kwanga.\n\n'
          '3. Yesu Bwenzinu ndikhale wanu\nmumtenderemo nkana mmabvuto;\n'
          'Potha dzikoli ndidzanke mmwamba.\nNdidzakondwere nanu muyaya.\n\n\n\n',
      '1. Yesu Mbuye wa Sabatanu;\nnditama tsiku lanulo.\n'
          'Lipumitsa moyo wanga.\nNdirikonda, ndirisunga.\n\n'
          '2. Tsiku lopatulika ndithu;\nla mtendere ndi chimwemwe.\n'
          'Limasula nkhawa zanga.\nLiwonetsa chiplumutso.\n\n'
          '3. Yesu ndikweze Inu nokha\npa tsiku lakupumali.\n'
          'Ndiganize zanu zokha;\nkuti ndisaliswe konse.\n\n\n\n\n',
      '1. Zizindikiro za nthawi\nyakudza kwake kwa Yesu,\nziri pafupi, pafupi kutha\nposachedwa adza; (adza).\n'
          'Siya zoipa zonsezo\nyanjana naye Yesuyo,\nkuti akadza adzakutenge\nkunka nawe mmwamba;\n(mmwamba).\n\n'
          'CHORUS:\n'
          'Alto:\n'
          'Dziko loipali\nMlungu adzaliwonongadi\nndi moto wonyeka\nkusungunula zithu zonse.\n'
          'Dziko la tsopano\nMlungu adzalilenga ndithu\nndipo womboledwa\nadzakondweramo muyaya.\n\n'
          'Others:\n'
          'Dziko lo...ipali...\nngu...wo...nongadi\nndi moto wonyeka...\nsu...zi...thu zonse.\n'
          'Dziko la... tsopano...\nngu...le...nga ndithu\nndipo wo...mboledwa...\ndza...ko...ndwa muyaya.\n\n'
          '2. Njala, matenda ndi nkhondo.\nAnthu kudzikonda okha,\naneneri onama ambiri\npa dziko lonseri; (nseri)\n'
          'Chatsala chinthu chimodzi;\nkuzunzidwa kwa Akhristu,\nMbuye thandize kukhala Wanu\nmpaka kudza kwanu. (kwanu).\n\n\n\n\n',
      '1. Usafo’ke...ndi mabvuto...\npoti Mlungu...Ali nawe...\ninva mau...ake ati...\n'
          '"Chete dziwa...ndine\nMlungu (ndine Mlungu)."\n\n'
          'CHORUS:\n'
          '"Chete dziwa...ndine Mlungu"...\ninva mau...a Mlunguyo\n(a Mlunguyo).\n'
          'Mumabvuto...tinva mau...\n"Chete dziwa...ndine Mlungu\n(ndine Mlungu)."\n\n'
          '2. Mlungu ali...mbikitsa \'fe...\nAchotsa ma...ntha onsewo...\npodalira...mwa Iyeyo...\n'
          '"Chete dziwa...ndine Mlungu\n(ndine Mlungu)."\n\n\n\n\n',
      '1. Munthawi ya mayesero,\npakuwomba namondwe;\nndipezatu mpumulowo;\nYesu Ateteza \'ne.\n\n'
          'CHORUS:\n'
          '(Yesu) Ateteza \'ne\n(ndipo) Atsogoza \'ne.\nNdikhulupira (Iyeyo);\nYesu Ateteza \'ne.\n\n'
          '2. Wosamala mbalameyo\nasamala inenso.\nMumabvuto, mumtendere;\nYesu Ateteza \'ne.\n\n\n\n\n',
      '1. Nkana ndiremedwe\nndi ntanda wangawo;\nsindzaiwa...la chikondi\n(cha Yesuyo).\n'
          'Nkana ndinyozedwe\nsindisamalayi;\nsindizaiwa...la chikondi\n(cha Yesuyo).\n\n'
          'CHORUS:\n'
          'Tenor:\n'
          'Sindzaiwala Mplumutsi,\nnandifera pa ntandapo,\npa ntandapo.\n'
          'Nasiya ulemu mwambamo...\niwala chikondi cha Yesuyo.\n\n'
          'Others:\n'
          'Sindzaiwala Mpulumutsi.\nNafera pa ntandapo\n(pa ntandapo).\n'
          'Nasiya ulemu mwambamo;\n(sindiza)iwa...la chikondi\n(cha Yesuyo).\n\n'
          '2. Nkana ndisowe chimwemwe\npansi pano;\nsindzaiwa...la chikondi\n(cha Yesuyo).\n'
          'Posachedwa Yesu\nadza ndi chimwemwe;\nsindizaiwa...la chikondi\n(cha Yesuyo).\n\n\n\n\n',
      '1. I would love to tell you\nwhat I think of Jesus,\nsince I found in Him\na friend so strong and true;\n'
          'I would tell you how\nHe changed my life completely,\nHe did something that\nno other friend could do.\n\n'
          'CHORUS:\n'
          'No one ever cared\nfor me like Jesus,\nthere\'s no other friend\nso kind as He,\n'
          'No one else could take\nthe sin and darkness from me.\nO how much He cared for me.\n\n'
          '2. All my life was full of sin\nwhen Jesus found me,\nAll my heart was full\nof misery and woe;\n'
          'Jesus placed His strong\nand loving arms about me,\nAnd He led me in the way\nI ought to go.\n\n'
          '3. Ev\'ry day He comes to me\nwith new assurance,\nmore and more I understand\nHis words of love;\n'
          'But I\'ll never know\njust why He came to save me,\ntill some day I see\nHis blessed face above.\n\n\n\n\n',
      'S:\n'
          '...Ona Mwana Nkhosa...\nOna Mwana Nkhosa...\nWocho-tsa, wocho-otsa\ntchimo-la dzi-iko lonse...\n'
          'Yesu Mpulumutsi, Mpulumutsi\nna-ko-nda dzi-koli.\nIdza-tu kwa Iye...\nsiya tchimo lako\nu-pu-lumuke.\n'
          'Ona Mwana Nkhosa...\nOna Mwana Nkhosa.\nWo-cho-tsa tchimo....\nla dzi...ko lonse...\n'
          'Wo-cho-tsa tchimo....\nla dzi...ko lo...nse...\nla dzi-ko lonse,\nwocho....tsa tchimo\nla dzi-ko lonse.\n\n'
          'A:\n'
          'Ona Mwana Nkhosa,\nMwa-ana wa Mulungu,\nwa Mulungu...\nwochotsa tchimo...\nla dzi-iko lonse.\n'
          'Yesu Mpulumutsi, Mpulumutsi\nnakonda ife, ko-nda dzi-koli\nIdza-tu kwa Iye...\nsiya tchimo lako...\nupu-lumuke.\n'
          'Ona Mwana Nkhosa...\nMwana Nkhosa...\nWocho-otsa tchimo-oo,\ntchimo-oo\nla dzi-ii...koli-ii\nla dzi-ko lonse...\n'
          'Wocho-otsa tchimo-oo,\ntchimo-oo\nla dzi-ii...koli-ii\nla dzi-ko lonse...\nla dzi-ko lonse...\n'
          'wocho-tsa tchimo\nlaa dzi-ko lonse.\n\n'
          'T:\n'
          '...Ona Mwana Nkhosa\nwa Mulungu...\nWocho-otsa tchimo\nla dzi-iko lonse.\n'
          'Yesu Mpulumutsi, nakonda ifetu\nNakonda dzikoli...\nIdzatu kwa Iye...\nsiya tchimo lako...\nupu-lumuke.\n'
          'Ona Mwana Nkhosa...\nMwana Nkhosa.\nWocho-otsa tchimo...\ntchimo-o la dziko-o\nla dzi-ko lose...\n'
          'Wocho-tsa tchimo-oo,\ntchimo-o la tdziko-oo,\nla dzi-ko lonse...\nla dzi-ko lonse...\n'
          'Wocho-tsa tchimo\nlaa dzi-ko lonse.\n\n'
          'B:\n'
          '...Ona Mwana Nkhosa...\nOna Mwana Nkhosa...\nWocho-tsa tchimo...\nla dzi-ko lose...\n'
          'Nakonda ifetu...\nIdzatu kwa Iye...\nsiya tchimo lako...\nupu-lumuke.\n'
          'Ona Mwana Nkhosa...\nMwana Nkhosa.\nWocho-otsa tchimoo...\ntchimo-o la dzikoo...\nla dzi-ko lose...\n'
          'Wocho-tsa tchimoo...\ntchimo-o la tdzikoo...\nla dzi-ko lonse...\nWocho-tsa tchimo\nla dzi-ko lonse.',
      '1. When the path is dreary\nand the skies are gray,\n'
          'When the tempter would\nyour soul beguile,\n(your soul beguile;)\n'
          'All your doubts and troubles\nquickly flee away,\n'
          'When you trust in God\nand sweetly smile.\n(And sweetly smile.)\n\n'
          'CHORUS:\n'
          'Trust in God, (and sweetly smile,)\nTrust and sweetly smile,\n(my brother,)\n'
          'You will find it pays to smile,\n(it pays to smile ;)\n'
          'SA: Whether days are dark or clear,\n'
          'TB: there is naught for you to fear,\n'
          'ALL: Put your trust in God\nand sweetly smile.\n(And sweetly smile.)\n\n'
          '2. In the darkest moment,\nfalter not nor fear,\n'
          'Keep your eyes on Jesus\nall the while,\n(yes all the while ;)\n'
          'He will fill your lonely\nheart with hope and cheer,\n'
          'Put your trust in God\nand sweetly smile.\n(And sweetly smile.)\n\n\n',
      '1. Pa phiri la Azitona kalero,\nophunzira nayan’gana mmwamba;\n'
          'Ndipo angelo nawalimbikitsa;\n“Yesuyo adzabweranso ndithu.”\n\n'
          'CHORUS:\n'
          'Abweranso kutenga olungama,\nabweranso ndi ulemerero;\n'
          'Wa Tate ake,\nkhamu la angelo;\nabweranso mfumu ya mafumu.\n\n'
          '2. Yesu adza mmitambo yonyezima;\nosati kudzanyozedwansoi,\n'
          'Osati kudzanvanso zachisoni,\npena kudzapachikidwansoi.\n\n'
          '3. Tikonzeke tirekane ndi tchimo;\ntikonzeke Yesu akubwera,\n'
          'tikondweretu nkhawa tidzitaye,\ntikondwere (tonse)\ntiyimbetu nyimbo.\n\n'
          'Descant CHORUS:\n'
          '…a-dza ku-tenga olunga-ma,\n…a-dza ndi ulemerero;\n'
          'wa Tate ake, khamu la angelo;\nYe-su mfumu ya mafumu.\n\n\n',
      'They that trust in the Lord\nshall be as mount Zion,\n'
          'Which can not be removed\nbut abideth forever.\n'
          'They that trust in the Lord\nshall be as mount Zion,\n'
          'Which can not be removed\nbut abideth forever.\n\n'
          'As the mountains are round\nabout Jerusalem,\nso the Lord is round\nabout his people\n'
          'From hence forth,\nfrom hence forth\nand even forever.\n'
          'As the mountains are round\nabout Jerusalem,\nso the Lord is round\nabout his people\n'
          'From hence forth,\nfrom hence forth,\nfrom hence forth forever.\n\n'
          'I was glad when they said\nunto me (unto me)\nlet us go into the house\nof the Lord (of the Lord)\n'
          'Our feet shall stand\nwithin thy gates.\nO Jerusalem, O Jerusalem\n'
          'Our feet shall stand\nwithin thy gates.\nOur feet shall stand\nwithin thy gates.\n'
          'Oh pray for (the peace of) Jerusalem,\npray for the peace of Jerusalem.\n'
          'Our feet shall stand\nwithin thy gates.\nOur feet shall stand\nwithin thy gates.\n'
          'Oh pray for (the peace of) Jerusalem,\npray for the peace of Jerusalem,\nof Jerusalem.\n\n'
          'Let the people praise thee,\npraise thee O God.\nLet all the people praise thee,\n'
          'Let them sing for joy,\nlet all the people praise thee,\nand sing for joy,\n'
          'Let the nations (be glad)\n(sing) (for joy),\n'
          'Let the nations (be glad)\n(sing) (for joy),\n'
          'Let the nations be glad\nand sing for joy.\n'
          'Praise the Lord!...\nPraise the Lord!\n'
          'O praise ye the Lord!\n\n\n',
      ' 1.  Mtendere mumtimamu;\npakati pa mabvuto.\nChembekezo mwa Yesu,\nchosatekesekai;\nMlungu anapatsa ‘ne\nchinthu choposa zonse.\n\n'
          '2. Chitonthozo mtimamu;\npakati pa chisoni.\nEe chirimbikitsocho,\nchikhlupiro cholimba;\nMlungu anapatsa ‘ne\nchinthu choposa zonse.\n\n'
          '3. Choonadi ndipeza;\npakati pa mabodza.\nNzeru yoposa onse\naphunzitsi angawo;\nMlungu anapatsa ‘ne\nchinthu choposa zonse.',
      '1. Ona mutu oyera\nnabvekedwa minga,\n'
          'Nanyozedwa koophya\nmmalo mwa ifetu;\n'
          'Nasiya ulemero\nnafa pa mtandapo;\n'
          'Ndakopekadi ndithu;\nYesu nditsata’nu.\n\n'
          '2. Yemweyo kundirenga,\nnadzandiferanso\n'
          'Pokhala onga Mlungu;\nsanazikwezei;\n'
          'Nakhala onga ife;\nnagonjetsa tchimo.\n'
          'Imfa pomlondola ‘Ye;\nnayo inagonja.\n\n'
          '(Variation)\n'
          '3. Chikondi choterechi\nchipambana zonse.\n'
          'Liu labwino nliti\nlomthokozera ‘Ye;\n'
          'Mau sangakwanire,\nntchito zanga zomwe;\n'
          'Ndingopereka moyo,\nYesu mlandire ‘ne.',
      '1. Angelo a Mlungu mmwamba\n‘dzani msanga mdzikoli,\n'
          'Mdayimba pa chirengedwe;\nEe pobadwa Khristunso\n'
          'Idzanitu, lambirani;\nKhristu Mfumu yabadwa.\n\n'
          '2. Anzerunu mleke zonse\nnzeru yoposa yadza,\n'
          'Khumbo la mafuko onse;\nmtsate nthanda yakeyo.\n'
          'Idzanitu, lambirani;\nKhristu Mfumu yabadwa.\n\n'
          '3. Ochimwa ‘nu mlape tchimo\nlekanani ndi nkhawa.\n'
          'Chisomo chagwera tonse\n‘dzani timasuridwe.\n'
          'Idzanitu, lambirani;\nKhristu Mfumu ya zonse.\n\n'
          '4. Akhristu mokhlupirika\n‘dikira kudza kwake;\n'
          'Posachedwa Mbuye Yesu\n‘dzaoneka mmitambo.\n'
          'Idzanitu, lambirani;\nKhristu Mfumu ikudza.',
      'S:\n'
          'Mau anveka… mdziko monse,\n'
          'Mau anveka… mdziko monse,\n'
          'mdziko… monse.\n'
          'Mau anveka mdziko monse,\n'
          'Mau anveka… mdziko… monse.\n'
          '…Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'wakunvayo ooo wanva.\n'
          'Olalika Mbuyeyo mau anveka,\nanveka mdziko monse,\n'
          'Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'Olalika za Yesu\nMbuyeyo o ooooooo,\n'
          'Olalika za Yesu\nMbuyeyo oo oo,\n'
          'Olalika za Yesu\nMbuyeyo ooo,\nonvayo wanva.\n\n'
          'A:\n'
          '…Mau anveka… mdziko monse,\n'
          'mdziko monse, mdziko monse.\n'
          'Mau anveka… anveka,\n'
          'Mau anveka… anveka\nmdziko… monse.\n'
          '………… Olalika za Yesu\nMbuyeyo ooo,\n'
          'wakunvayo wanva.\n'
          'Mau anveka… anveka,\nmdziko monse.\n'
          'Olali…ka za Yesu\nMbuyeyo oooo.\n'
          'Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'Olali…ka za Yesu\nMbu…yeyo ooo,\n'
          'wakunvayo wanva.\n\n'
          'T:\n'
          '……Mau anveka…mau anveka…\nmdziko monse\n'
          'mau anveka… mdziko monse,\nmdziko monse…\n'
          'Mdziko monse.\n'
          'Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'wakunvayo wanva,\nwaku…nvayo wanva.\n'
          'Olalika za Yesu Mbuye…yo,\n'
          'mau anveka… mdziko monse;\n'
          'olali, olalika za Yesu\nMbuyeyo o oo\n'
          'olalika za Yesu.\n'
          'Olalika za Yesu\nMbuyeyo o oo ooo.\n'
          'Olalika za Yesu Mbuyeyo\nwakunvayo wanva.\n\n'
          'B:\n'
          '………..Mau anveka…mau anveka\nmdziko monse,\n'
          'mau anveka… mdziko monse…\n'
          'Mau anveka… mdziko monse.\n'
          '………Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'wakunva-yo wanva,\nwakunvayo o o wanva.\n'
          'Mau anveka mdziko monse.\n'
          'Olalika za Yesu Mbuyeyo….\nolalika za Yesu Mbuyeyo,\n'
          'Olalika za Yesu\nMbuyeyo oo oo ooo,\n'
          'wakunvayo, wakuunva…yo wanva.\n\n\n\n\n',
      '1. Ndifunitsitsa kwathuko\nkowala ndi kokoma,\n'
          'mzinda uwo wokongola\nwakonzedwera ine.\n\n'
          'STB: Dzi-koli la-dza-la ndi mabvuto\n\n'
          'A: njala, nthenda ndi umphawi,\nEe dziko lonse mabvuto.\n\n'
          'All: Ndzapumula kuzonsezi,\nmtenderewo kwa myaya.\n\n\n'
          '2. Poyimba za’lemerero\nwa mzinda wa kwathuko;\n'
          'zowawa za mdzikoli\nsizi-nga kanthui.\n\n'
          'STB: Chi-tontho-zo mma-bvuto monsemo\n\n'
          'A: chitonthozo, mpumulowo\nmmabvuto monse monsemo.\n\n'
          'All: Yesu Mbuye mtsogoze ‘ne\nkufikira kwathuko.',
      '1. Mbuye Yesu, \'dzani msanga,\nnvani kwitana kwa \'na anu.\n'
          'Tatopatu ndi moyo wa mdzikoli,\nmogonjatu tipempha kwa inu;\n'
          '\'Dzani msanga dulani nthawiyi.\n\n'
          '2. Uthengau, wa bwinou,\nmtithandize \'fe kulalika.\n'
          'Mabvalidwe, mau ndi ntchito zathu\nzisonyeze ufumu wanuwo;\n'
          '\'Dzani msanga mtitenge kwathuko.\n\n'
          '3. Mbuye Yesu, \'dzani msanga,\nmtitenge ife ku mwambako.\n'
          'Tifunitsa dziko la tsopanolo,\nkopandatu matenda ndi imfa;\n'
          '\'Dzani msanga mtitenge kwathuko.',
      '1. Tiriguyo ndi namsongole pamodzi,\n'
          'Ee nkhosa ndi mbuzi ziri pamodzi.\n'
          'Akadza m’busayo adzalekanitsa;\n'
          'Zabwino, zoipa; mbali zaokha.\n'
          'Mabvuto, chimwemwe nzosakhazikika;\n'
          'Zisonyesa kutitu palibe mbali.\n'
          'Akadza Yesuyo mbali ‘dzaoneka.\n\n'
          '2. Moyo uno tinadzeratu chisankho;\n'
          'Moyo osathawo kapena imfa.\n'
          'M’bale wanga chisankho ncha yekhayekha,\n'
          'Ufulu tapatsidwa mumtimamo.\n'
          'Mabvuto, chimwemwe nzosakhazikika;\n'
          'Zisonyesa kutitu palibe mbali.\n'
          'Akadza Yesuyo mbali ‘dzaoneka.\n\n'
          '3. Lero kuli chimwemwe, mawa kulira.\n'
          'Lero zachabe, mawa kudya bwino.\n'
          'Ndikhumba kwathu kwa chimwemwe chokhacho,\n'
          'Ndiyendabe ndi Yesu ndzafikeko.\n'
          'Ndzapatsidwa moyo wa mtendere myaya,\n'
          'Ee ku nthawi zosatha ndi anzangawo.\n'
          'Zabwino zokhazo, Ee, zidzaoneka.',
      '1.	Kodi mwalema ndi mabvuto,\nmulibe chiyembekezo?\n'
          'Muli kuwala mwa Yesuyo\nndi moyo wauleretu.\n\n'
          'CHORUS:\n'
          'Yang’anani kwa Yesu,\nEe yang’anitsitsani ‘Ye\n(yang’ana ‘Ye).\n'
          'Ndipo za padziko zizimadi\npakuwona kuwala kwake.\n\n'
          '2.	Anafa ndipo ali moyo\ntiyeni timtsatire ‘Ye;\n'
          'ndipo tchimo lonse lidzatha,\ntidzakhala wogonjetsa.\n\n'
          '3.	Malonjezano ‘Ke n’goona\ntingomkhulupira Iye.\n'
          'Tiralikire mudzikoli\nza chipulumutso chake.',
      'CHORUS:\n'
          'Zonse zokongolazo,\nzokula, zochepa.\n'
          'Zanzeru, zodabwitsa;\nMlungu napanga’zo.\n\n'
          '1. Timaluwa tiphuka,\ntimbalame tiyimba.\n'
          'Awalitsa maluwa,\nmbalame z’uuluka.\n\n'
          '2. Mapiri amitengo,\nmtsinje uyendamo.\n'
          'Dzuwa lirowa kuda,\nmmawa kuwalanso.\n\n'
          '3. Atipatsa ‘fe maso,\ntione tiyamike\n'
          'za ukulu wa Mlungu,\nMlengi wa zonsezo.',
      '1. Idza tsiku lopuma,\nSabata lochiritsa.\n'
          'Kwa otopa onsewo,\nnena liwu lokoma;\n'
          'mupume, mupume.\n\n'
          '2. Thetsa khumbo lotentha,\nlachabe la za mdziko.\n'
          'Kwa ophyinjika n\'tchimo,\nnena liwu lokoma;\n'
          'mupume, mupume.\n\n'
          '3. Thetsa nkhawa ndi mantha,\npukuta misonziyo.\n'
          'Patsa ch\'embe kezocho,\nnena liwu lokoma;\n'
          'mupume, mupume.',
      '1. Mwa chimwemwe tipembedza\nMlungu wa’lemerero.\n'
          'M’tima titsegulira ‘Nu\ndzuwa la chirungamo.\n'
          'Mutichotsere tchimo ndi\nchisoni mumtimamo.\n'
          'Mudzadze ‘fe ndi chimwemwe,\nchimwemwe cha muyaya.\n\n'
          '2. Akasupe ayenda, mitsinje\nndi Nyanja zomwe.\n'
          'Mnkhalango ndi mmapirimo;\nmaluwa wokongola.\n'
          'Dzuwa, mwezi ndi nyenyezi\nzonse zitamanda ‘Nu.\n'
          'Angelo ayimba myaya,\nnafenso pambuyopo.\n\n'
          '3. Wopatsa nd’okhululuka\nndinu nokha Mbuyathu.\n'
          'Mdalitso mupatsa tonse,\nayi ndithu tadala.\n'
          'Inu ndiye Tate wathu,\nYesu mchimwene wathu.\n'
          'Mtiphunzitse ‘fe chikondi,\ntikondwe mwa Inutu.\n\n'
          '4. T’yeni tiyimbe mokodwa\nmonga angelo ayimba.\n'
          'Chikondi chitsogoza ‘fe,\ntakhazikika ndithu.\n'
          'Chitsogolo tikuyenda\nzobvutazo zagonja.\n'
          'Nyimbo za chimwemwe\nzitsogolera ‘fe kwathuko.',
      "This is the day, is the day\nthat the Lord made;\n"
          "let us rejoice and be joyful!\n"
          "How great our rejoicing\nin the presence\nof the righteous;\n"
          "the righteous in God\ngain victory.\n\n"
          "SA:\nHow great our rejoicing,\nhow great our rejoicing.\n"
          "To us shall be victory.\nWe shall be victorious;\n\n"
          "TB:\nThe righteous in God\ngain victory.\n"
          "To us shall be victory.\nWe shall gain vict’ry,\n\n"
          "All:\nWe shall gain vict’ry.\n\n"
          "TB: How great our rejoicing,\nhow great our rejoicing.\n"
          "The righteous\nshall gain vict’ry,\nthey shall gain vict’ry.\n\n"
          "SA:\nThe righteous\nshall be victorious.\n"
          "The righteous\nshall gain vict’ry,\n\n"
          "All:\nthey shall gain vict’ry,\nThe righteous\nshall be victorious.\n"
          "This is the day, is the day\nthat the Lord made;\n"
          "let us rejoice\nand be joyful.\n\n"
          "TB:\nFor the righteous\nshall be victorious,\n"
          "for the righteous in God,\nthey shall be blest,\n\n"
          "SA:\n…victorious…\nthey shall be blest,\n\n"
          "All:\nFor the righteous in God,\n"
          "they shall be blest,\nthey shall be blest.\n\n\n\n\n",
      '1. Kuli mzinda wokongola,\nwowala ndi wabwino\n'
          'komwe Mbuye akhalako\nndi angelo oyera.\n'
          'Afuna okhulupira\nkuti akakhaleko.\n'
          'Tifuna mzinda wabwino\nkomwe tidzakhalitse (tonse).\n\n'
          'CHORUS:\n'
          'tifuna mzinda wokongolawo\nEe womangidwa ndi Mbuye.\n'
          'tifuna mzinda wokongolawo,\nkomwe tidzakhalitse.\n'
          'tifuna mzinda wokongolawo,\nEe womangidwa ndi Mbuye\n'
          'tifuna mzinda wabwino,\nkomwe tidzakhalitse (tonse).\n\n'
          '2. Ulendo wopita kwathu,\nukomana nzobvuta;\n'
          'koma Yesu Mbuye wathu\natitsogolera ‘fe.\n'
          'Atiuza tisafo’ke\ntikhale mmau ake.\n'
          'tifuna mzinda wabwino,\nkomwe tidzakhalitse (tonse).\n\n\n\n\n',
      "1. My heav-'nly home\nis bright and fair,\nI feel like trav - el - ing on;\n"
          "Nor pain, nor death\ncan en- ter there,\nI feel like trav- el - ing on.\n\n"
          "CHORUS:\n"
          "Yes, I feel like traveling on,\n(traveling on)\n"
          "I feel like traveling on,\n(traveling on)\n"
          "My heav-'nly home\nis bright and fair,\n"
          "I feel like trav - el - ing on;\n\n"
          "2. Let oth - ers seek\na home be -low,\nI feel like trav - el - ing on;\n"
          "Which flames de-vour,\nor waves o'er -flow,\nI feel like trav- el - ing on.\n\n"
          "3. The Lord has been\nso good to me,\nI feel like trav-el-ing on;\n"
          "Un - til that bless - ed\nhome I see,\nI feel like trav - el - ing on.",
      'Adzamanga nyumba\nnkukhalamo,\n'
          'nabyala mbeu nkudya\nzokolola.\n'
          'Sadzamanga\nwina nkukhalamo,\n'
          'sadzabyala wina ndi kudya.\n'
          'Sadzagwira ntchito\nmwachabei;\n'
          'poti ndi odala\na Mbuye (ake a Yehova)\n'
          'Ee adzamanga nyumba\nndi kukhalamo.\n'
          'Anthu anga adzakondwa\n'
          'ndi ntchito za manja awo;\n'
          'Ee kwa muyaya.\n\n\n\n\n',
      '1. Tidzayenda ndi Mbuye\nmudziko lowalalo,\n'
          'zakuda sizikalowamo.\n'
          'Kulibe mdima uko\nnkowala nthawi zonse,\n'
          'ndi ulemerero wa Mbuye.\n\n'
          'CHORUS:\n'
          'SA:\n'
          'Zo-kongola, zo-kongola\nzo-bvala zo-mwe dzabvala.\n'
          'Zo-kongola, zo-kongola;\n'
          'Ee poyenda ndi Mbuye;\ntidzabvala zoyera.\n\n'
          'TB:\n'
          'Zokongola tidzabvala,\nZokongola tidzabvala.\n'
          'Zobvala zomwe dzabvala,\nzobvala zomwe dzabvala.\n'
          'Zokongola tidzabvala,\nZokongola tidzabvala;\n'
          'Ee poyenda ndi Mbuye\ntidzabvala zoyera.\n\n'
          '2. Tidzayenda ndi Mbuye\ntitabvala zoyera,\n'
          'Mfumu yokongola dzaona.\n'
          'Dzakhalatu zokoma\nkucheza ndi Mbuyeyo,\n'
          'tidzayimba nyimbo zomtama.\n\n\n\n\n',
      '1. I\'m trusting in my\nbless- ed Saviour,\n'
          'Who came and died\nup-on the tree;\n'
          'Thro wondrous grace\nand winning favor,\n'
          'He made a way\nto heav\'n for me.\n\n'
          'CHORUS:\n'
          'S:\n…my trust…in Christ…\nmy bless-ed King,\n'
          'His life for me…\nupon the tree,\n'
          'He died…that I might live,\nthat I might live;\n'
          'Un-to…the world…\nI\'ll glad -ly sing,\n'
          'He loved me so…\nI\'ll al-ways show,\n'
          'My all to Him I give.\n\n'
          'A:\n…my trust…in Christ…\nmy bless-ed King,\n'
          'His life for me…\nupon the tree,\n'
          'He died…that I might live,\nthat I might live;\n'
          'His praise unto…\nthe world…I\'ll gladly sing,\n'
          'because He loved me so,\nmy trust in Him I\'ll show,\n'
          'My all…to Him I give,\nI freely give.\n\n'
          'T:\n…my trust…in Christ…\nmy bless-ed King,\n'
          'His life for me…\nupon the tree,\n'
          'He died…that I might live,\nthat I might live;\n'
          'Un-to…the world…\nI\'ll glad -ly sing,\n'
          'He loved me so…\nI\'ll al-ways show,\n'
          'My all…to Him I give,\nI freely give.\n\n'
          'B:\nI\'ve put my trust…\nin Christ…my bless-ed King,\n'
          'He gave His life for me…\nupon the cruel tree,\n'
          'He died…that I…\nmight live;\n'
          'Un-to…the world…\nI\'ll glad -ly sing,\n'
          'He loved me so…\nI\'ll al-ways show,\n'
          'My all…to Him I give.\n\n'
          '2. My soul is filled with\njoy and gladness.\n'
          'Since Jesus came\nin-to my life;\n'
          'He took a-way my\nload of sadness,\n'
          'Put love with-in\nwhere there was strife.\n\n'
          '3. Some day I\'ll reach\nmy home in glo -ry.\n'
          'Up - on the hap- py\ngold-en shore;\n'
          'Then I will sing\nthe grand old sto-ry,\n'
          'And live with Him\nfor ev-er-more.\n\n\n\n\n',
      '''1.	Moyo uchokera kwa Inu, Moyo uchokera kwa Inu.
Zamoyozo zikhalako mupatsa moyo zonsezo;
dziko lonse… likondwera… Mbuye mwalenga zonse,
ife ndife anutu;
ntchito ya manja anu, ntchito ya manja anu.

2.	Mtendere wanu ndiwosatha, Mtendere wanu ndiwosatha.
Mau sangafotokoze kuzama kwa mtenderewo.
Mumtimamu… uwunika…; mdima onse uthawa.
Mbuye chikondi chanu;
Chikondi chisunga 'fe, Chikondi chisunga 'fe.

3.	Mbuye mulinafe pafupi, Mbuye mulinafe pafupi.
Mutsogolera ifetu mnjira yanu yachiyero.
Pofooka… mulimbitsa… Muphunzitsa ifetu
choonadi chanucho;
sitingasochereyi, sitingasochereyi.
''',
      '''1.	Standing on the promises of Christ my king,
thro’ eternal ages let His praises ring;
glory in the highest I will shout and sing,
standing on the promises of God.

CHORUS:
Sop:
Standing, standing; standing on the promises of God my savior.
Standing, standing; I’m standing on the promises of God.

Others:
Standing on the promises, standing on the promises,
standing on the promises of God my savior.
Standing on the promises, standing on the promises.
I’m standing on the promises of God.

2.	Standing on the promises that can not fail,
when the howling storms of doubt and fear assail,
by the living word of God I shall prevail,
standing on the promises of God.
''',
      '''1.	Tione Yesu nthawi njaitali, nkana kamoyoka nkakafupi.
Tione Yesu tirimbikitsike polimbana ndi za uchimozo.

2.	Tione Yesu mpulumutsi wathu pamapazi ake tiphunzire.
Moyo, imfanso singachotse ife pa chikondi cha Yesu Mbuyeyo.

3.	Tione Yesu zonse ndizachabe; taziona kwa zaka zonsezi.
Zokoma zake ziri zosautsa; tikondwera kulekananazo. 

4.	Tione Yesu ndiro khumbo lathu; mphanvu, chimwemwe poona Yesu.
Tione Yesu wotipembedzera, posachedwa adza kutenga ‘fe.
''',
      '''1.	Pa mtanda wa Yesuyo ndipeza mphanvuzo,
mthunzi wabwino pansi pa thanthwe lolimbalo.
Muchipululu ndipeza malo opumawo;
potentha dzuwa, pakutopa pa ulendowu.

2.	Pa mtanda wa Yesuyo ndiona mbuyeyo;
wakuzunzika ndi kufa mmalo mwa inetu.
Ndikhuzika mumtimamu ndi chozizwitsacho;
chipulumutso cha munthu wosayenera ‘ne.

3.	Pa mtanda wa Yesuyo ndikwanitsidwa ‘ne;
sin’funa kw’ala kwina koma kw’ala kwakeko.
Dziko ayi; sindipindula, sin’taya mwayi.
Ochimwa ndi wamanyazi; Yesu akwanira ‘ne.
''',
      '''1.	Tibyala mminda yathu mbeu zabwinozo.
Mlungu azithirira nazikulitsanso,
amagwetsa nvula dzuwa nawalirapo.
Mame ndinso chinyontho apatsa zonsezo.

CHORUS:
Zabwino zonse zichokera kwa Mlungu;
thokozani Mbuye kamba kachikondi chake.

2.	Mlungu ndiye mulengi wazinthu zonsezo;
nalenga ‘Ye maluwa mphepo ndi nyenyezi.
Namondwe anvera ‘Ye adyetsa mbalame,
amatidyetsa tonse tsiku lirironse.

3.	Tithokoza ‘Nu Tate kamba kazonsezi;
mbeu ndi zokolola, moyo, thanzi, kudya.
Landirani mphatso zomwe tikupereka,
koposaposa mlandire mitima yathu.
''',
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_Sw(id, song);
      id++;
    }
  }

  Future<void> insertAllSongInfo_dor() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> infoz = [
      "POGANIZA ZA IMFA",
      "NDILINGALIRA ZA KUMWAMBA",
      "NDIMAFUNA BWENZI",
      "NDIPULUMUTSENI MBUYE",
      "ZILIMBIKANI MWA MBUYE",
      "YOBU ANAVUTIKA KWAKUKULU",
      "PAMENE NOWA",
      "GULU LA NKHONDO",
      "PACHINKHONDO",
      "NDIRI KUMVA KUKANGANA",
      "ANAMANGA AMBUYE",
      "SIMEYI NATUKWANA DAVIDE",
      "ANAPAMBANATU YESU",
      "NTHAWITU TSOPANO ABALE YATHA",
      "NGAKHALE DZIKO LIKUDE",
      "NYUMBA ZATHU",
      "ONA ANTHU OZUNGULIRA IWE",
      "MKHRISTU KONZEKA",
      "PALASA KUDOKO",
      "TIRI PALIWIRO TONSE",
      "ABIGAYELI",
      "KHOLOLA LA MIYOYO",
      "PAKATI PA MABINGU",
      "UMFOTOKOZERE YESU",
      "NDIGWIRITSITSA YESU",
      "MBUYE WANGA ANDITSOGOLERA",
      "MUYENDE NDI YESU",
      "DZIKO LIKUONA YESU?",
      "MUDZIWENI INU YESU",
      "WOTEMA M’MUNDA WA AMBUYE",
      "NJIRAYI NDI YAITALI",
      "M’MENE NDINASOWA",
      "ULENDO WOYENDA NDI MTIMA",
      "POMALIZA PA ULENDO",
      "YESU ATI ABWERA",
      "YESU AGOGODA",
      "ZOSONYEZA KUDZA KWAKE",
      "UTEMBENUKE",
      "DZIKO LIKUTHAMANGA",
      "NDISINKHA LERO ZA DZIKO LIJA",
      "SADZALEKANANSO AYI",
      "NGATI YESU ANGADZE",
      "NDIKADAKHALA NDI MAPIKO",
      "MAFUNSO AKALE",
      "POYANG’ANA M’PHIRIMO",
      "PATSIDYALO LA MTSINJE",
      "OYERA MTIMA",
      "ANENA ZA MZINDA",
      "PA MSONKHANO WAUKULU KUMWAMBA",
      "DZUKATU KUTULO",
      "MOSE ATAMENYA THANTHWE",
      "PAMENE WATHA ULENDO WANGA",
      "NTHAWI YATHADI",
      "OWOMBOLEDWA ADZAIMBA NYIMBO",
      "NDISAMKONDERENJI YESU",
      "NDAKONZEKA",
      "SINDISIYA CHIKHRISTU",
      "NTHANO YA YOBU",
      "MKHRISTUWE PEMPHERA",
      "IMA NJI",
      "MTIMA KHALA CHETE",
      "NDAKHUTITSIDWA",
      "NGATI DZIKO LIKUDA",
      "NDILITU PA ULENDO",
      "PA NTHAWI YA NSAUTSO",
      "NGAKHALE UKONDE CHUMA",
      "TSIKU LA MDIMA",
      "PAKUYENDA",
      "SINJIRA YOFEWA",
      "MMENE NDILEMEDWA NDI KATUNDU",
      "NDIRI NDI KWATHU",
      "ANDISUNGA",
      "NDIMVA NYIMBO",
      "NDIONETSE YESU MOYO WANGA",
      "TIKADZANKA KUMWAMBA",
      "NDIKAGANIZA ZA MOYO UNO",
      "MUNGAKA YAKE",
      "NDIKAPIRIRA MAYESERO",
      "NDIKUSIRIRA YERUSALEMU",
      "NDINU THANTHWETU",
      "BANJA LOKONDWA",
      "MKAZI WA NGWIRO",
      "CHINSINSI CHA UKWATI",
      "MBUYE MUNAKWATITSA",
      "M’BALE WANGA IWE",
      "MPINGO WATHU",
      "PALIBE WINA",
      "TIYIMBE NYIMBOYI",
      "SIKWATHU",
      "TIYENI TIYIMBE LIMODZI",
      "NDABWERA TATE",
      "CHIMWEMWE",
      "KUWALA MU MTIMA MWANGA",
      "MOYO WANGA UPAMBANA SILIVA",
      "SITIDZAKALAMBA",
      "NDISINTHENI YESU",
      "NGAKHALE TCHIMO",
      "NDASIYA TCHIMO LANGA",
      "POKHALA INE WOCHIMWA",
      "MUNDICHITIRE CHIFUNDO",
      "NDANI AFUNA KUONANA NAYE",
      "MABALA A YESU",
      "MABELU ALIRA M’MWAMBA",
      "KUZIKONDWERETSA NDI ZA MDZIKO",
      "UTHENGA WABWINO ",
      "SAMUELI NAITANIDWA",
      "MFUNENI YEHOVA",
      "BWERANI KWA YESU LERO LINO",
      "IDZANITU TIYIMBE",
      "NDINALI WOSOCHERA",
      "TSIKU LILI KUDZA",
      "NDALOTA LIPENGA",
      "LIDZALIRA LIPENGA TITE",
      "CHIGONJETSO CHOSATHA",
      "NDANI AKALOWE KU KENANI",
      "BUKHU LA MOYO KUMWAMBA",
      "MUDZI WA SODOMU",
      "KUDZAKHALA CHIMWEMWE",
      "KULI DZIKO SIN’NAONE",
      "ALENDO NDIFETU",
      "TATANGANIDWA NDI ZA M’DZIKO",
      "WOMANGIDWA’WE NDI TCHIMO",
      "POCHOKA MU AIGUPTO",
      "AISRAELI",
      "ANGELO WOYERAWO",
      "CHIPULUMUTSO ",
      "MVERA NTHANO YOZIZWITSA",
      "SIKULEMERA KWA MTANDA",
      "AKADATSITSA ZIKWI KHUMI",
      "YESU ADZA MSANGA",
      "TAONANI NDIDZA MSANGA",
      "NENANI ZA CHIKONDI CHA YESU ",
      "PALI BWENZI LOPOSA ONSE",
      "MACHIMO ANGA ANALIPO",
      "CHIKONDI CHAKE N’CHACHIKULU ",
      "TAONANI CHIKONDI",
      "DUWA LOPAMBANA",
      "M’MANJA MWA WOUMBA MBIYA",
      "MUMVEKE",
      "MUKWEZEKE AMBUYE WANGA ",
      "YESU NDI WACHIKHALIRE",
      "MYAMIKENI YEHOVA",
      "ZIPATSO ZA MZIMU WOYERA",
      "ZOKOMA ZA DZIKO LINO",
      "ULENDO WA CHIKHRISTU ",
      "PITANI MUKALALIKIRE",
      "NDILI NDI MWANA WAKEYO",
      "THAWA PULUMUTSA MOYO",
      "CHIKONDI CHA MULUNGU WATHU ",
      "NDIMCHITIRENJI MPULUMUTSI",
      "PALITU MUDZI WABWINO",
      "MU IDENI",
      "POYANG'ANA KWATHU",
      "TAYANDIKIRA MADZULO",
      "PALI MALO",
      "MWANA WOLOWERERA",
      "NDIKUPEMPHA",
      "SINDIFUNA KUFA MONGA FELIKE ",
      "PAPATIZANIBE",
      "MOYO NGOSAKHALITSA",
      "PA NYANJA YA MIYOYO ",
      "NDINGATUME YANI",
      "PAMPANDO WAKUMWAMBA",
      "AISRAYELI ATAWOLOKA",
      "ZOPEREKA ZIGWIRE NTCHITO",
      "MU YOPA (DORIKA)",
      "NDAKONZEKERA",
      "WAKUNIPWERERERA",
      "BAKHRISTU WUKANI",
      "HAYA BAMAMA",
      "NYENGO ZINO ZA UMALIRO",
      "TILI PAFUPI KUKAYA",
      "NDIMWE CHIUTA",
    ];

    // Loop through the list and insert each fruit
    for (String info in infoz) {
      await dbHelper.insertSongInfo_dor(info);
    }
  }

  // Insert all the values
  Future<void> insertAllFruits_dor() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    // List of fruit names
    final List<String> fruits = [
      "POGANIZA ZA IMFA",
      "NDILINGALIRA ZA KUMWAMBA",
      "NDIMAFUNA BWENZI",
      "NDIPULUMUTSENI MBUYE",
      "ZILIMBIKANI MWA MBUYE",
      "YOBU ANAVUTIKA KWAKUKULU",
      "PAMENE NOWA",
      "GULU LA NKHONDO",
      "PACHINKHONDO",
      "NDIRI KUMVA KUKANGANA",
      "ANAMANGA AMBUYE",
      "SIMEYI NATUKWANA DAVIDE",
      "ANAPAMBANATU YESU",
      "NTHAWITU TSOPANO ABALE YATHA",
      "NGAKHALE DZIKO LIKUDE",
      "NYUMBA ZATHU",
      "ONA ANTHU OZUNGULIRA IWE",
      "MKHRISTU KONZEKA",
      "PALASA KUDOKO",
      "TIRI PALIWIRO TONSE",
      "ABIGAYELI",
      "KHOLOLA LA MIYOYO",
      "PAKATI PA MABINGU",
      "UMFOTOKOZERE YESU",
      "NDIGWIRITSITSA YESU",
      "MBUYE WANGA ANDITSOGOLERA",
      "MUYENDE NDI YESU",
      "DZIKO LIKUONA YESU?",
      "MUDZIWENI INU YESU",
      "WOTEMA M’MUNDA WA AMBUYE",
      "NJIRAYI NDI YAITALI",
      "M’MENE NDINASOWA",
      "ULENDO WOYENDA NDI MTIMA",
      "POMALIZA PA ULENDO",
      "YESU ATI ABWERA",
      "YESU AGOGODA",
      "ZOSONYEZA KUDZA KWAKE",
      "UTEMBENUKE",
      "DZIKO LIKUTHAMANGA",
      "NDISINKHA LERO ZA DZIKO LIJA",
      "SADZALEKANANSO AYI",
      "NGATI YESU ANGADZE",
      "NDIKADAKHALA NDI MAPIKO",
      "MAFUNSO AKALE",
      "POYANG’ANA M’PHIRIMO",
      "PATSIDYALO LA MTSINJE",
      "OYERA MTIMA",
      "ANENA ZA MZINDA",
      "PA MSONKHANO WAUKULU KUMWAMBA",
      "DZUKATU KUTULO",
      "MOSE ATAMENYA THANTHWE",
      "PAMENE WATHA ULENDO WANGA",
      "NTHAWI YATHADI",
      "OWOMBOLEDWA ADZAIMBA NYIMBO",
      "NDISAMKONDERENJI YESU",
      "NDAKONZEKA",
      "SINDISIYA CHIKHRISTU",
      "NTHANO YA YOBU",
      "MKHRISTUWE PEMPHERA",
      "IMA NJI",
      "MTIMA KHALA CHETE",
      "NDAKHUTITSIDWA",
      "NGATI DZIKO LIKUDA",
      "NDILITU PA ULENDO",
      "PA NTHAWI YA NSAUTSO",
      "NGAKHALE UKONDE CHUMA",
      "TSIKU LA MDIMA",
      "PAKUYENDA",
      "SINJIRA YOFEWA",
      "MMENE NDILEMEDWA NDI KATUNDU",
      "NDIRI NDI KWATHU",
      "ANDISUNGA",
      "NDIMVA NYIMBO",
      "NDIONETSE YESU MOYO WANGA",
      "TIKADZANKA KUMWAMBA",
      "NDIKAGANIZA ZA MOYO UNO",
      "MUNGAKA YAKE",
      "NDIKAPIRIRA MAYESERO",
      "NDIKUSIRIRA YERUSALEMU",
      "NDINU THANTHWETU",
      "BANJA LOKONDWA",
      "MKAZI WA NGWIRO",
      "CHINSINSI CHA UKWATI",
      "MBUYE MUNAKWATITSA",
      "M’BALE WANGA IWE",
      "MPINGO WATHU",
      "PALIBE WINA",
      "TIYIMBE NYIMBOYI",
      "SIKWATHU",
      "TIYENI TIYIMBE LIMODZI",
      "NDABWERA TATE",
      "CHIMWEMWE",
      "KUWALA MU MTIMA MWANGA",
      "MOYO WANGA UPAMBANA SILIVA",
      "SITIDZAKALAMBA",
      "NDISINTHENI YESU",
      "NGAKHALE TCHIMO",
      "NDASIYA TCHIMO LANGA",
      "POKHALA INE WOCHIMWA",
      "MUNDICHITIRE CHIFUNDO",
      "NDANI AFUNA KUONANA NAYE",
      "MABALA A YESU",
      "MABELU ALIRA M’MWAMBA",
      "KUZIKONDWERETSA NDI ZA MDZIKO",
      "UTHENGA WABWINO ",
      "SAMUELI NAITANIDWA",
      "MFUNENI YEHOVA",
      "BWERANI KWA YESU LERO LINO",
      "IDZANITU TIYIMBE",
      "NDINALI WOSOCHERA",
      "TSIKU LILI KUDZA",
      "NDALOTA LIPENGA",
      "LIDZALIRA LIPENGA TITE",
      "CHIGONJETSO CHOSATHA",
      "NDANI AKALOWE KU KENANI",
      "BUKHU LA MOYO KUMWAMBA",
      "MUDZI WA SODOMU",
      "KUDZAKHALA CHIMWEMWE",
      "KULI DZIKO SIN’NAONE",
      "ALENDO NDIFETU",
      "TATANGANIDWA NDI ZA M’DZIKO",
      "WOMANGIDWA’WE NDI TCHIMO",
      "POCHOKA MU AIGUPTO",
      "AISRAELI",
      "ANGELO WOYERAWO",
      "CHIPULUMUTSO ",
      "MVERA NTHANO YOZIZWITSA",
      "SIKULEMERA KWA MTANDA",
      "AKADATSITSA ZIKWI KHUMI",
      "YESU ADZA MSANGA",
      "TAONANI NDIDZA MSANGA",
      "NENANI ZA CHIKONDI CHA YESU ",
      "PALI BWENZI LOPOSA ONSE",
      "MACHIMO ANGA ANALIPO",
      "CHIKONDI CHAKE N’CHACHIKULU ",
      "TAONANI CHIKONDI",
      "DUWA LOPAMBANA",
      "M’MANJA MWA WOUMBA MBIYA",
      "MUMVEKE",
      "MUKWEZEKE AMBUYE WANGA ",
      "YESU NDI WACHIKHALIRE",
      "MYAMIKENI YEHOVA",
      "ZIPATSO ZA MZIMU WOYERA",
      "ZOKOMA ZA DZIKO LINO",
      "ULENDO WA CHIKHRISTU ",
      "PITANI MUKALALIKIRE",
      "NDILI NDI MWANA WAKEYO",
      "THAWA PULUMUTSA MOYO",
      "CHIKONDI CHA MULUNGU WATHU ",
      "NDIMCHITIRENJI MPULUMUTSI",
      "PALITU MUDZI WABWINO",
      "MU IDENI",
      "POYANG'ANA KWATHU",
      "TAYANDIKIRA MADZULO",
      "PALI MALO",
      "MWANA WOLOWERERA",
      "NDIKUPEMPHA",
      "SINDIFUNA KUFA MONGA FELIKE ",
      "PAPATIZANIBE",
      "MOYO NGOSAKHALITSA",
      "PA NYANJA YA MIYOYO ",
      "NDINGATUME YANI",
      "PAMPANDO WAKUMWAMBA",
      "AISRAYELI ATAWOLOKA",
      "ZOPEREKA ZIGWIRE NTCHITO",
      "MU YOPA (DORIKA)",
      "NDAKONZEKERA",
      "WAKUNIPWERERERA",
      "BAKHRISTU WUKANI",
      "HAYA BAMAMA",
      "NYENGO ZINO ZA UMALIRO",
      "TILI PAFUPI KUKAYA",
      "NDIMWE CHIUTA",
    ];

    // Loop through the list and insert each fruit
    for (String fruit in fruits) {
      await dbHelper.insertFruit_dor(fruit);
    }
  }

  Future<void> insertAllSongs_dor() async {
    final DatabaseHelper dbHelper = DatabaseHelper();

    final List<String> songList = [
      '''1. Poganiza za imfa ya Stefano,
Iye anagwira ntchito mosakaika,
Ngakhale anthu ena anamphweteka,
Iye anagwira ntchito mpaka anafa.

CHORUS:
Ndiwona Yesu waima dzanja lamanja, Ona Yesu dziko lalonjezo;
Ntchito yatha tsono ndipita, Ona Yesu ayembekezane.

2. Anthu anagenda thupi lakelo,
Iye anadziwa kuti nthawi yakwana,
Pokhulupilira Mbuye mtima unalimba, Mbuye
akhulukireni sadziwa achita.

3. Zipata zokongola kumpando wa Mulungu,
Tidzaimba mokondwera popita uko, Pokumana
ndi Mbuye mzipata zoyera, Ndikhlupirira
ndzanena Stefano dzakwaine''',
      '''1. Ndilingalira zakumwamba, Ndilingalira zakwathu, 
Ndiganiza za dziko lokomalo, Komwe nkakhale ndi Mbuye.

CHORUS:
Sop: Ndiko-kongola – makoma ngayasipi
All: Kokongola, kokongola ngayasipi;
Omangidwa ndi manja a Ambuye, Komwe diso slinaone.

2. Komwe diso silinaone, Komwe khutu silinamve,
 Komwe ndikayimbe ndi Angelo, Kumzindawo wa golidi.

3. Dzapukuta misozi yonse, Sipadzakhalanso imfa, 
Sipadzakhalanso maliro, Poti zakale zapita.
''',
      '''1. Ndimafuna bwenzi la pa mtendere;
Ndimafuna bwenzi lapamavuto;
Ndimafuna bwenzi lapamoyo wanga;
Kuti ndilitsatire.

CHORUS:
Ndamupeza Yesu ndiye bwenzi langa;
Ndamupeza Yesu adzakhala -dzakhala;
Ukasowa bwenzi umuuze Yesu adzakhala; Bwenzi lako.

2. Umuuze Yesu zamavuto ako;
Umuuze Yesu adzakuthandiza;
Ukasowa bwenzi umuuze Yesu
Adzakhala bwenzi lako.
''',
      '''1. Ndipulumutseni Mbuye, Madzi afikira moyo wanga.
Ndipulumutseni Mbuye, Madzi afikira moyo wanga.

CHORUS:
Ine ndaimirira mthope lozama, Popanda popondera; Ine
ndalowa m’madzi ozama, Ndipo chigumula chandimeza.
Ine ndaimirira mthope lozama, Popanda popondera; Ine
ndalowa m’madzi ozama, Ndipo chigumula chandimeza.

2. Mmaso mwanga mwada, Kuyembekezera Mlengi wanga.
Mmaso mwanga mwada, Kuyembekezera Mlengi wanga.

3. Ndalema ndi kufuula kwanga, Kummeroku kwauma gwaa.
Ndalema ndi kufuula kwanga, Kummeroku kwauma gwaa.
''',
      '''1. Zilimbikani mwa Mbuye, Kulimba kwa mphamvu, 
Pofika tsiku loyipa tidzachirimika,
Zilimbikani mwa Mbuye; Kulimba kwa mphamvu, 
Pofika tsiku loyipa tidzachilimika.

CHORUS:
Sop:
Ndine ndemwe… Ndipatse mawu…Ndizindikiritse 
ALL:
Ambuye… Kuti… Anthuwa
Chinsinsicho cha uthenga wabwino.

2. Chifukwa sitilimbana, Ndi mwazi ndi thupi, 
Koma zadziko lapansi timachirimika,
Chifukwa sitilimbana ndi mwazi, Ndi thupi,
Koma zadziko lapansi timachilimika.

3. Tengani zida za Mulungu, Kuti tikakhoze, 
Pofika tsiku loyipa tidzachirimika,
Tenga zida za Mulungu, Kuti tikakhoze ,
Pofika tsiku loyipa tidzachilimika.
''',
      '''1. Yobu anavutika kwakukulu, Nabwera abwenzi ake nati;
Kodi simungangosiya kupemphera; Popeza vuto silikutha.

CHORUS:
Sop: 
Yobu…Chete…Kuti
Ndinene ine Chondi-fikira Mulungu wanga alinane

ATB: 
Yobu anati…Khalani chete…Kuti ndinene, 
Ndinene ine Chondifikira, chindifikire ine 
Mulungu wanga alinane

2. Mkazi wa Yobu nayenso anati; Kodi simungangosiya kupemphera
Onani ng’ombe, mbuzi ndi ananso; Zonse zatha psiti ndithu.

3. Kodi abale sitingayime nji? Monga Yobu anachita zija
Nayankha abwenzi ake nati; Chondifikira chindifikire.
''',
      '''1. Pamene Nowa napulumutsidwa Anaganiza timange nsanja; 
Yokwera mmwamba yopulumukira, M’mene mvula idzabweranso.

CHORUS:
Bass: 
Anayenda
All: 
Nayenda m’chombo chija
Bass: 
Ulendo
All: 
Ulendo wa pa Phiri
Bass: 
Pamene
All: 
Chombo chija chinaima, Onse anatuluka.

2. Koma Mulungu sanawaleke iwo, Kuti atsirize nsanja yawo; 
Koma Mulungu nawasokoneza, Powapatsa zinenero.

3. Koma Mulungu natsimikizanso, Sindidzaononganso ndi madzi; 
Kwezani maso muone m’mitambo, Utawaleza ndiwo moto.
''',
      '''1. Gulu la nkhondo la Mulungu, likulimbana ndi Satana
Ndimayesero ake onse, tidzagonjetsa mwa Yesuyo
Pokhulupira mwa Ambuye, tipeza chipambanocho
Cha mwazi wake womwe unakhetsedwa.

CHORUS:
SAT:
Pita…Yimba…Zotamanda Mbuye Yesu 
Nena…Nthano…Natifera eetonse
Khala…Fatsa

Bass:
Chitsogolo…Mokondwera…Yesu
Monyadira…Ya Ambuye…Natifera tonse
Mwa Ambuye…Mau ake

2. Anthu ambiri adankhawa chifukwa cha mavuto omwe akuwapeza.
Dziko lino, umphawi, njala ndi matenda; Koma
Ambuye wathu Yesu adziwa zomwe tisowa;
Adzabwezera zonse tikagonjetsa.
''',
      '''1. Pachinkhondo choopsachi; Cha zabwino nzoipa; 
Mmene nkhondo i- Ikuopsa, Pomenyana ndi mdani; 
Mbuye afuna antchito, Kodi adalire’we.

CHORUS:
Sop:
Kodi adalirewe, akufuna omvera,
Imva Mzimu anena, adalire pa iwe
ATB:
Ko-di a-da-li-re-we a-ku-fu-na omvera,
Imva Mzimu anena (anena) Adalire pa iwe.

2. Ona magulu a mdima, Akudza ndi chimkwiyo; 
Mphamvu yawo ikulabe, Ndimphamvu ya mdimawo;
Limba nji! Pachoona; Kodi adalire’we.

3. Yesu mmwamba ationa, Angelo nathangata;
Ndi mtsogozi wathu Yesu; Ndipo sitidzagonja;
Tidzakhala olimba; Kodi adalire’we.
''',
      '''1. Ndiri kumva ku-kangana ndi-po nkhondo yomwe
Ka-mba ka machi-mo onse a padzi-ko-li
Ku-kaika ndi-kuopa ndi zokondweretsa
Za mu dziko sizi-ndiko-pa-‘ne

CHORUS:
Ndi-khala kumapiri mi-tambo ku-li-be (lero)
Ndikumwa pakasupe wo-saphwa konseko, ndithu!
Ndakhuta pa-kudya mana o-kwanitsa’ne, 
Chifu-kwa ndili mwa Mbu-ye-yo.

2. Ku-kaika ku-maletsa a-nthu ena mdziko 
Ku-ti sakhulu-pirira angodabwa-tu.
Ko-ma nditchinji-rizidwa m’mau a-Mu-lu-ngu 
Ndi-li wopu-mula mwa Mbu-ye-yo.

3. A-nthu ena a-kuopa za-ufiti zomwe
Ko-ma nditsami-ra pa Ambuye Ye-su-yo
A-li mphamvu yo-pambana zo-nse za
Satana Sindiopa konse mwa Mbu-ye-yo.

4. Chuma ndi ule-mu ndi zoko-ndweretsa zina
Sizingathe ku-ndikopa ndikakonda-zo.
Ndikondwera pa-kuona zo-lengedwa zones
Nda-kwanitsidwatu mwa Mbu-ye-yo.
''',
      '''1. Anamanga Ambuye…Opandanso mboni…
Mu bwalo la Pilato…Analibe bwenzi.

CHORUS:
Ndikhale bwenzi lake…Ndimpatse moyowo…
Ndikhale bwenzi lake…Mpakatu ndidzafa.

2. Kufuna Mpulumutsi…Tengatu Yesuyo…
Yemwe natiombola…Ndiye ndimkondadi.

3. Mwambamo ndidzakhala…Ndi bwenzi langalo…
Mzindawo wa chikondi…Bwenzi langa Yesu.
''',
      '''1. Simeyi namtukwana Davide, 
Nanena ndilibe nazo nkhondo.
Ambuye adzatigwira nkhondo, 
Ayamikike Mulungu.

CHORUS:
Ten: 
Nkana gulu la nkhondo
Alto: 
Lifuna lindithyoleee
All: 
Mtima wanga siudzachita mantha
All: 
Mtima wanga siudzachita mantha

2. Davide napha zikwi zikwi zankhani,
Sauli nati ndimulasa lero.
Ndilanditseni Mulungu wanga,
Woyera wa Israeli.

3. Mulungu wanga, Mulungu wanga.
Patseni chikopa chochinjiriza 
waMmwamba-mwamba.
''',
      '''1. Anapambanatu Ambuye Yesu Pa nkhondo mwamba,
Kumenyana ndi Satana Pa nkhondo mwamba.

CHORUS:
Nayimba angelo (Nayimba angelo),
Mokondwa, mokondwa; mokondwa; mokondwa
Mokondwa mokondwa mokondwa mokondwa
Sop: 
Yesu napambana
ATB: 
Pa nkhondo mwamba.

2. Tidzagonjetsatu tikakhala mwa Yesu Mbuye
Kumenyana ndi Satana Pa nkhondo mwamba.

3. Tipambanatu tikakhala mwa Yesu Mbuye
Kumenyana ndi Satana Pa nkhondo mwamba.
''',
      '''1. Nthawitu abale tsono yatha; Ambuye wathudi abwera.
Nthawitu abale tsono yatha; Ambuye wathudi abwera.
Pitanitu m’midzimo mukalalike (ndithu) 
Kuti Yesu abwera konzekanitu.
Fuulanitu kwa anthu onsewo, Auzeni Yesu abwera.
Fuulanitu kwa anthu onsewo, Auzeni Yesu abwera.

2. Zizindikiro za kudza kwake; Zaoneka ponse ponsepo
Zizindikiro za kudza kwake; Zaoneka ponse ponsepo
Kwangotsala ka nthawi kuona Mbuye (ndithu)
Abwera posachedwa kutenga Ake
Onse amoyo ndi odzutsidwawo, Omwe analandira Yesu
Onse amoyo ndi odzutsidwawo, Omwe analandira Yesu

3. Abambo ndinu amayi anga, Mlongo ndi m’bale usachedwe.
Abambo ndinu amayi anga, Mlongo ndi m’bale usachedwe.
Yang’anani m’mwambamo mumvetseredi (ndithu)
Lipengalo limveka lakudza kwake
Zizindikiro zakudza kwakeko, Zinena kuti abweradi.
Zizindikiro zakudza kwakeko, Zinena kuti abweradi.
''',
      '''1. Ngakhale dziko likude, Dzingogwira ntchito;
Ntchito yake ya Ambuye, Ku munda wampesa.

CHORUS:
Ife ndife mboni zake, Zonena za Yesu;
Ife ndife mboni zake, Za imfa ya mtanda.
Ife ndife mboni zake, Zonena za Yesu;
Ife ndife mboni zake, Za imfa ya mtanda.

2. Abale musagonetu, Mugwire ntchitoyo; 
Ntchito yake ya Ambuye, Ku munda wampesa.

3. Nanga inu musachedwe, Bweranitu msanga;
Ku ntchito yake ya Ambuye, Ku munda wampesa.
''',
      '''1. Nyumba zathu zikhale zolalika uthenga;
Nyumba zathu – (nyumba, nyumba zathu)
Zikhale zotsegukira munthu aliyense, nyumba zathu
Nyumba zathu zikhale zolalika uthenga;
Nyumba zathuu- (nyumba, nyumba zathu)
Zikhale zotsegulira kwa munthu aliyense, nyumba zathu.

CHORUS:
Zilalike uthenga wa chiyembekezo cha moyo wosatha;
Ndi mitima yosweka ikachiritsidwe, 
Zipezeke m’nyumba zathuzo.

2. Nyumba zathu zikhale zolalika uthenga;
Nyumba zathu- (nyumba, nyumba zathu)
Odwala apezemo chiyembekezo cha moyo wa muyaya.
Nyumba zathu zikhale zolalika uthenga;
Nyumba zathu- (nyumba, nyumba zathu)
Odwala apezemo chiyembekezo cha moyo wa muyaya.

3. Nyumba zathu zikhale zolalika uthenga;
Nyumba zathu- (nyumba, nyumba zathu)
Zikhale zothandiza amasiye ndi wovutika nyumba zathu.
Nyumba zathu zikhale zolalika uthenga;
Nyumba zathu- (nyumba, nyumba zathu)
Zikhale zothandiza amasiye ndi wovutika nyumba zathu.
''',
      '''1. Ona anthu ozungulira iwe, 
Anyamula katundu wolemera.
Auzeni za Mulungu wopeputsa mavuto onsewo.
SAT: Mbuye tachokera kutali, 
Tavutika ndi mafunde oopsa;
Popanda mphamvu yanu tidzasochera Mbuye.

CHORUS:
BASS:
Powathangatatu ena, Udzalandira dalitso;
Otaika mu-uchimowo, Auze za Khristuyo;
Udzapeza chimwemwecho, Powathangatatu;
Awo-ne-tse za yemwe ana-ku-chi-ri-tsawe.
SAT:
Powatha-ngata anthu ena, Udzalandira dalitso.
Ota-i-ka muchimo, a-u-ze-tu za Khristuyo.
Udza-pe-za-tu chimwemwecho, Po-wa-tha-nga-ta ochimwawo;
Onetse za Yesu amene ana-ku-chi-ri-tsawe (chiritsawe).

2. Anthu ambiri asochererabe, 
Asowa mtendere ndi msangalatso.
Dzutsani ochimwa onse aime, Mwasonjeze njirayo.
SAT: Tibwera kwa Inu Mbuye, 
Kuti tiphunzire za nsisi zanuzo.
Mtipatse’fe chisomo chanucho nthawi zonse.

3. Sindipemphera za ine Mbuyanga, 
Komatu za osowa uthengawo.
Tiphunzitseni Mbuye kuti iwo awone’nu mwa ife.
SAT: Mwagula’fe ndi mwaziwo, 
Ndipo tisowanso chisomo chanucho.
Popanda thandizo lanu sitidzagonjetsa.
''',
      '''1. Mkhristu konzeka usagone, 
Mkhristu konzeka dzuka kutulo. 
Mkhristu konzeka ukumane ndi Yesu, 
Poti nthawi yatha.

CHORUS:
Sop:
Ponya chingwe cha moyo…Pulumutsa otaika
ATB: 
Ponya chingwe cha moyo… Otaika.
ALL: Onse akonzekere poti nthawi yatha.

2. Mkhristu lalika uthengawo,
 Anthu adziwe Yesu akudza. 
M’mapiri, m’madambo, ulalikire, 
Poti nthawi yatha.
''',
      '''1. Dzuwa lili kupitatu usiku wafika, 
Yesu ndiye nyali yathu. Imva aitana,
Bwerera kwanu mwananga,
Kupyola nyanjayo;  Kuli kuda, usachedwe, palasa kudoko.

CHORUS:
Sop: 
Pa-la-sira iwe ku-tha-mangiratu
ATB: 
Pala-sawe palasawe, Thamangira palasa’we,
All: 
Yesu aliku-lindira iwe patsidya la nyanja
Sop: 
Pa-la-sira iwe ku-tha-mangiratu
ATB: 
Pala sawe palasatu, Thama-ngira palasawe
All: 
Palasa palasa palasawe upulumuketu.

2. Padoko tidzakomana ndi wokondedwawo, 
Ali kulindira Mbuye wokondwa koposa. 
Nkhope zawo zowalambe, moyo ngwabwinotu 
Zowawazo -nse zatha phee palasa kudoko.

3. Zakale zonse zapita sizikumbukika, 
Zolemetsa zonse zatha kukondwa kokhadi. 
Womwe ndalekana nawo tsono ali mfupi;
 Kondwerani kondwanitu palasa kudoko.
''',
      '''1. Tili paliwiro tonse abale, kukaigwira mbendera ya Yesuyo; 
Ife tikulephera kuthamanga, Kukaigwira mbenderayo

CHORUS:
Bass: 
Tili kuthamanga
All: 
Tili kuthamanga, Tili kuthamanga, (Oh) 
Tili kuthamanga, Tili kuthamanga.
Bass: 
Ndani angachite change
All: 
Kukaigwira mbenderayo.

2. Abale ife tili wolefuka, Tikulephera ife kuthamanga; 
Kuti tikayigwire mbenderayo, Chifukwa cha zoipa.

3. Satana walefula dziko lapansi, Walefulatu a mitundu yochuluka; 
Ife tikulephera kuthamanga, Kukaigwira mbenderayo.

4. Abale musasekere Satana, Adzakulefulani, dzakulefulani; 
Mudzalephera inu kuthamanga, Kukaigwira mbenderayo.
''',
      '''1. Abigayeli wakale nathandiza (nathandiza), Nathandiza mwamuna’ke;
Abigayeli wakale nathandiza (nathandiza), Nathandiza mwamuna’ke;
(Nathandiza) Abigayeli nathandiza (nathandiza), Nathandiza mwamuna’ke.

2. Napatsa kudya Davide nathandiza (nathandiza), Nathandiza mwamuna’ke;
Napatsa kudya Davide nathandiza (nathandiza), Nathandiza mwamuna’ke;
(Nathandiza) Abigayeli nathandiza (nathandiza), Nathandiza mwamuna’ke.

3. Ananena za mtendere nathandiza (nathandiza), Nathandiza mwamuna’ke
Ananena za mtendere nathandiza (nathandiza), Nathandiza mwamuna’ke
(Nathandiza) Abigayeli nathandiza (nathandiza), Nathandiza mwamuna’ke.

4. Tikhale Abigayeli watsopano (nathandiza), Nathandiza mwamuna’ke; Tikhale
Abigayeli watsopano (nathandiza), Nathandiza mwamuna’ke; (Nathandiza)
Abigayeli nathandiza (nathandiza), Nathandiza mwamuna’ke.
''',
      '''1. Okunkha nonse inu, Muimiranjiko; 
Dzuwa lapita kale kwayamba kudanso; 
Kodi mulinda wena kuti afikenso? 
Mminda mwayera kale, 
Yambani ntchitoyo.

2. Tengani Zenga lanu, Mwetani miyoyo; 
Usiku wayandika, simudzaonanso. 
Ambuye aitana, Okunkha nonsenu; 
Kodi mitolo ija idzangotaika.

3. Tsikani m’mapirimo, Pa m’mamawa ndithu; 
Musadikire kunja, Mpaka kwayeranso. 
Dzani ndi mphamvu zanu, Nkana kuzizire; 
Mudzakondwera ndithu poona miyoyo.

4. Lalikani m’mapiri ndi m’madambo monse; 
Musakhaletu chete, Nenani mauwo. 
Khulupirikanitu, Pa ntchito ya Mbuye; 
Mpaka mudzamva mawu “wachita bwino’ we”
''',
      '''1. Pakati pamabingu, ndi mphezi zong’anima, 
Anthu ali kulira chithangato; 
Kodi tingowaleka, kuti onse afe, 
Osawaponyera chingwe cha moyo.

CHORUS:
Sop: 
Ponyatu-u chingwe cho-o; 
Thangata ovutika, 
Pogundika mafunde. 
Ponyatu-u, chingwecho-o; 
Chakuwapulumutsira ku mtunda.

ATB:
Ponya chingwe cha moyo, thangata ovutika;
Pogundika mafunde, Nupulumutse onse.
Ponya chingwe cha moyo, Thangata ovutika;
Chakuwapulumutsira kumtunda.

2. Chingwe chathu ndi chomwe Yesu anachikonza, 
Chopotedwa ndi khonje wolimbayo;
Chikhoza kuplumutsa, miyoyo yomira m’madzi, 
Ponya chingwe chokafika kutali.

3. Pafupi ndi padoko, iwo adzatayika, 
Ngati wina safuna kupitako;
Mbale wanga thangata, yesa kupulumutsa, 
Ponya chingwe chokafika kutali.
''',
      '''1. Pokomana ndi mayeso a m’dziko lino,
Matenda, imfa ndi usiwa;
Moyo umavutika ndikugwetsedwa mphwayi,
Mpaka utamuuza Yesuyo.

CHORUS:
Umfotokozere Yesu vuto lako;
Umfotokozere Yesu zonsezo;
Umfotokozere Yesu vuto lako;
Adzakuchitira chifundo.

2. Pokomana ndi mayeso a m’dziko lino,
Ndinasochera kutaliko;
Yesu nandigwira dzanja nanditsogolera,
Pomwe ndinamuuza zonsezo.

3. Pokomana ndi mavuto a m’dziko lino,
Ndinayang’ana kwa Mbuyeyo;
Anandichotsera ine mavuto anga,
M’mene ndinamuuza zonsezo.
''',
      '''1. Ndigwiritsitsa Yesu, Ndigwire ‘Ye konse;
Mabelu a chimwemwe, Alira mokondwa.
Mumtima mwanga nyimbo, Ilemekeza ‘Ye;
Mumtima mwanga nyimbo, Ilemekeza ‘Ye;

2. Zokondweretsa m’dziko, Nzachabe kwai ne;
Ndiopanji zovuta, za dziko lino?
Ndikondwa pakumvera, Ambuye wangayo;
Ndikondwa pakumvera, Ambuye wangayo;

3. Chikondi’ke nchosatha, Ndi chauleretu;
Ndimadzi ozizira, Potentha m’dzuwalo.
Ndilemekeza Yesu, Wosamalira’ne.
Ndilemekeza Yesu, Wosamalira’ne.
''',
      '''1. Mbuye wanga anditsogolera, 
Ndasungika sindidzataika;
Muzimphepo adzandibisane, 
m’manja mwake m’manja’ke.

CHORUS:
Sop: 
Manja Ake
All: 
Manja manja manja m’manja’ke
Sop: 
Manja Ake
All: 
Manja manja manja m’manja’ke
Ndasungika sindidzataika, m’manja mwake manja’ke

2. Mmanja Ake andisunga ine 
Ndimva mawu Ake a mtendere
Mbuye adzandipulumutsane 
M’manja mwake manja Ake.

3. Moyo wanga siwudzatayika 
Chikondi chake chiri chosatha
Ndidziwa adzasunga ine, 
M’manja mwake m’manja Ake

4. Posachedwa Yesu adzabwera 
Kudzatenga onse olungama
Akakhale nawo nthawi zones 
M’manja mwake manja Ake.
''',
      '''1. Myende ndi Yesu muubwana wanu, Musanakule msinkhu,
Mudzakondweratu ngati naye muyenda konseko,
Mudzakomana ndi mavuto popanda Mzimuyo,
Anapirira mayesowo oposa athuwo.

CHORUS:
Sop: 
Myende ndi Yesu masiku onse.
ATB: 
Myende ndi Yesu, Myende ndi Yesu  Masiku onse, masiku onse.
ST: 
Mudzakondweratu, Pokhala Naye
AB: 
Mudzakondwera, Mudzakondwera, Pokhala Naye, Pokhala Naye
ST: 
Akonda’fe, Ana Ake,
AB: 
Akonda’fe, Akonda’fe, Ana Ake, Ana Ake.
ST: 
Adzadalitsa, Amene amtsata’Ye
AB: 
Adzadalitsa, Adzadalitsa, Amene amtsata’Ye
AT: 
Nthawi zonse.

2. Myende ndi Yesu muukulu wanu, Musowa mphamvu Yake,
Musanyadiretu mphamvu yanu, Nsanga idzathadi,
Mudzakondwera poyendabe ndi Yesu konseko,
Zokondweretsa za dzikoli zidzathatu msanga.

3. Myende ndi Yesu mutafooka, Pa ukalamba wanu,
Pakutsamira pa ana anu, Maso saonatu,
M’mene simuyembekezanso zinthu za m’dzikoli,
Myende ndi Yesu Ambuyeyo mudzakondweratu.
''',
      '''1. Kodi tikhala mfupi ndi Mbuye, 
Tsiku ndi tsiku moyo wathuwo?
Anthu awone tikufanana, 
Ndi Mbuye pa mtandapo.

CHORUS:
Dziko likuona Yesu (Ona Yesu), 
Mwa ine kapena iwe (kapena iwe)
Kodi chikondi chako ndichokhulupirika, 
Kodi dziko lionanji (mwa Ine)?

2. Kodi chikondi ndi chofanana, 
Anthu onse ali ndi machimo?
Kodi mavuto tithangatane, 
Kubweza ochimwawo?

3. Ngati mabuku anthu awona, 
Zonse tinena zonse tichita,
Akukopeka mwina kuthawa, 
Yesu bwenzi leroli.
''',
      '''1. Ndende za wanthu osakhulupira, 
Zilipo zambiri pa dzikoli;
Koma yoopsa ili kubwera 
Ya moto ndi sulfure.

CHORUS:
Mudziweni inu Yesu (Bass: Zoona), 
Mudziweni mukadali moyo, Kuti
adzakugwireni dzanja (Bass: powoloka), 
Panyanja ya mandala.

2. Onse amantha osakhulupira, 
Anyanga, akuba, achigololo’ Olambira
mafano ndi bodza, Mphotho yawo ndi imfa.

3. Yesu akunena kwa ife lero, 
Kwa yemwe a-kumva njala ndi ludzu;
Ndidzampatsa kasupe wa madzi, 
Amoyo kwa ulere.
''',
      '''1. Otema munda wa Ambuye, Otopa inutu;  
Idzanikwa Ambuyeyo, 
Adzatipatsa mphamvu.

CHORUS:
Sop:
Ndipotu omwe alindira, Adzatenga e e e mphamvu;
Nadzatha-mangatu ndi mapiko a chiwombankhanga.
N’dzayenda osatopa, n’dzayendatu osatopa;
N’dzayenda osatopa, n’dzayendatu osatopa.

ATB:
Alindira, Adzatenga eee mphamvu
Thamanga, thamanga, thamanga ndi mapiko a chiwombankhanga.
N’dzayenda, osatopa ine ndidzayendatu osatopa, Ndzayenda osatopa
N’dzayenda, n’dzayendatu osaopa.
Sop: 
Tonse
ALL: 
Tidzathamanga ife!! Koma osa-to-pa.

2. Olema ndi olefukatu, Otopa idzani; 
Kuti mu-landire dalitso, 
Adzatipatsa mphamvu.

3. Otema munda wa Ambuye, Otopa inutu; 
Yang’ana alindira’we, 
Adzatipatsa mphamvu.
''',
      '''1. Njira iyi njayitali ndi katundu wolemetsa; 
Yesu adzatitula katundu wathu yense.

CHORUS:
Sop: 
Kudzakhala chimwemwe, Kudzakhala chimwemwe.
Mmawa mmawa, chimwemwe. Kudzakhala chimwemweee.
Others: 
Chimwemwe, chimwemwe. Chimwemwe, chimwemwe.
Chimwemwee, Kudzakhala chimwemweee.

2. M’mene ife tikulira ndi zisoni zadzikoli;
Yesu adzapukuta misozi yathu yonse.

3. M’mene Yesu adzabwera kudzatenga anthu Ake; 
Kunka nao kumwamba kulibe malirowo.
''',
      '''1. M’mene ine ndinasowa Mpulumutsi, 
Ndinali ndekha ine m’chipululu.
Nafuula kwa Tate, Iye nandiyankha, 
Tsono ndampeza wondiombola.

CHORUS:
Ndampeza (Ndampeza), 
Wondiombola (Wondiombola), 
Ndampeza (Ndampeza),  
Mwini wa zonse (Mwini wa zonse), 
‘Nafuula kwa Tate, Iye nandiyankha, 
Tsono ndampeza wondiombola.

2. Monga nkhosa yosochera ku malunje, 
Ndinali ndekha ine m’chipululu;
‘Nafuula kwa Tate, Iye nandiyankha, 
Tsono ndampeza wondiombola
''',
      '''1. Tili pa ulendo’fe, Ulendo woyenda ndi mtima, 
Wopita ku Kenani, Kodi ndiyenda bwanji ine?

CHORUS:
Kodi ndikuyendabe (ndikuyendabe, ndikuyendabe)
Pena ndangoima phe (ndangoima ndangoima phe!),
Kodi ndikafikeko (Ndikafikeko, ku Kenani)
Ulendo woyenda ndi mtima.

2. Ndinayamba ulendowu, Tsiku lobatizidwa; 
Chandiyimika nchaniko? Kodi tchimo lamtimanga.

3. Ulendo wa mumtimawu, Ndiyende naye 
Yesuyo; M’dzatitsogolerafe, tikafike kumwambako.

4. Yesu m’tsuke mtimanga, Kuti ndikafikeko; 
Ku Kenani wa m’mwamba, Ulendo woyenda ndi mtima.
''',
      '''1. Pomaliza pa ulendo wanga, Mbuye adzandiitana; 
Ndzamva mau ake okomawo, Bwera mwananga udzapume.

CHORUS:
Tsogo-lereni ulendo wanga Mbuye, 
Ndzapu-mule mu ulemerero, 
Kwathu kumwambako.

2. Ngakhale mafundo akweretsa, Mbuye ayendabe nane; 
Adzatontholetsa namondweyo, Pakhale bata pa nyanja.

3. Pakudza Ambuye mu mitambo, Dzamona maso ndi maso, 
Dzanditenga ine kumwambako, Mulemero wosatha.
''',
      '''1. Yesu ati abwera, Abwera mwamsanga; 
Kudzatenga olungama, akapumule mavuto.

CHORUS:
Bass: 
Akapume
All: 
Akapumule imfa
Bass: 
Ndimavuto
All: 
Ndimavuto onsewo
Bass: 
Akapume
All: 
Akapumule kulira kwa dziko lapansi.

2. Kudziko ilo labwino, Kulibe ngakhale manda; 
Chifukwa imfa kulibe, Oyera akapumule.

3. Yesu aitana tonse, kuti ti-dze kwa Iye; 
Pamene tikonda Yesu tikapumule mavuto.
''',
      '''1. Ona mlendo ali kudzatu m’mitambo posachedwatu. 
Ona mlendo ali kudzatu m’mitambo posachedwatu.

CHORUS:
SAT: 
Yesu agogoda, Yesu agogoda.
Bass: 
Yesu agogoda, Yesu agogoda.
SAT: 
Yesu agogoda, Yesu agogoda.
Bass: 
Yesu agogoda mu mtima.
SAT: 
Agogoda, Yesu agogoda.
Bass: 
Yesu agogoda, Yesu agogoda.
SAT: 
Yesu agogoda, Yesu agogoda (mu mtima)
Bass: 
Yesu agogoda mu mtima.

2. Ona mlendo ali kudzatu ndiye Mfumu ya kumwamba. 
Ona mlendo ali kudzatu ndiye Mfumu ya kumwamba.

3. Kodi m’bale wakonzekatu kumulandira mbuye wako. 
Kodi m’bale wakonzekatu kumulandira mbuye wako.
''',
      '''1. Zosonyeza kudza kwake, Tsopano zakwanitsidwa, 
Owerenga khala maso, Owerenga khala maso.

CHORUS:
Owerenga (Owerenga), Khala maso (E Khala maso)
Owerenga (Owerenga), Khala maso (E Khala maso)
Zizindikiro zakwanitsiwa, Owerenga khala maso.

2. Wogona tulo sazindi-kira zomwe zichitika, 
Dziko latembenuka, Owerenga, khala maso.

3. Tsopano ndi m’mbandakucha, Galamuka uyang’ane, 
Dziko latembenuka, Owerenga, khala maso.
''',
      '''1. Usalole mau akupitirire, yang’ana maso ako komweko; 
Wochimwawe usaumitse mtima, Utembenuke.

CHORUS:
Sop: 
Utembenuke, utembenuke, Wochimwawe usaumitse mtima, Utembenuke.
ATB: 
Utembenuke, utembenuke, Wochimwawe usaumitse mtima, Utembenuke.

2. Lamawa dzuwa silingaturuke, Kupulumutsa iwe mum’dima; 
Wochimwawe usaumitse mtima, Utembenuke.

3. Amayi bwerani tipemphere, Abambo bwerani tipemphere; 
Wochimwawe usaumitse mtima, Utembenuke.

4. Asungwana bwerani tipemphere, Anyamata bwerani tipemphere; 
Wochimwawe usaumitse mtima, Utembenuke.
''',
      '''1. Dzukani Akhristu mu-wa-le-tu, Dzukani Akhristu mu-wa-le-tu. 
Dzukani Akhristu muwale mu mdima wa-ma-chi-mo.

CHORUS:
Sop: 
Dziko likuthamanga, Machimo osaneneka.
ATB: 
Dziko likuthamanga, Machimo osaneneka.
All: 
Dzuka iwe uwale.

2. Dzukani abusa mu-wa-le-tu, Dzukani Akhristu mu-wa-le-tu. 
Dzukani abusa mulelike uthenga ponseponse.

3. Dzukani Dolika konze-ka-tu, Dzukani Akhristu mu-wa-le-tu. 
Dzukani Dolika nthandize osowa ponse ponse.
''',
      '''1. Ndisinkha lero za dziko lija, Kwathu kumwambako;
Lakuchinjiriza mavuto onse, Dziko labwino mmwambamo;
Ambuye analonjeza kale, Adzapatsa iwo madzi amoyo;
Ndi kumwa mokondwera! Kumwamba nkwabwino.

CHORUS:
Sop: 
Oo!
All: 
Dziko ilo
Sop: 
Labwino
All: 
Labwino
Sop: 
Mmwambamo, Mmwambamo
All: 
Mmwambamo, Mmwambamo
All: 
Lokongola, Lokongola, Lokondweretsa’ne
Sop: 
Iii!
All: 
Dziko ilo
Sop: 
Labwino
All: 
Labwino
Sop: 
Mmwambamo, Mmwambamo
All: 
Mmwambamo, Mmwambamo
All: 
Lokongola, Lokongola, Lokondweretsa’ne

2. Ndikadzafika ku dziko lija, Ndidzakondwa koposa, 
Popeza analonjeza kuti adzapatsanetu moyo. 
Ambuye analonjeza kale, Adzapatsa iwo madzi amoyo; 
Ndi kumwa mokondwera! Kumwamba nkwabwino.

3. Pamene dziko lina litha, Ambuye akonza dziko lina; 
La ulemerero la opulumutsidwawo. Ambuye analonjeza kuti, 
Akakonza malo akubweranso; Kutenga anthu Ake, 
Kunka nawo kumwamba.
''',
      '''1. Lilipodi dziko lokomalo, Dziko la mtendere; 
Kulibe mdima komweko, Zowawa zidzatha konse.

CHORUS:
Ife tilikunka kumwambako posachedwa timva lipenga 
Posachedwa tidzaona Yesu, Sitidzalekananso, 
E! Salekana ai! Salekana Ai! 
Salekana posachedwa mu ufumu wa Yesu, Sitidzalekananso.

2. Nthawi ya mphukira siidzatha, Maluwa safotanso; 
Sitingakopedwe konsetu, Ndi zinthu za padziko.

3. Tidzayima monga Moseyo, Tiwona za mmwamba muja; 
Sitingakopedwe konsetu, Ndi zinthu za pa dziko.

4. Bwere msanga Mpulumutsi, M’khale Mfumu yathuyo; 
Mutilamulire ife, Sitifuna winayi.
''',
      '''1. Ngati Yesu angadze (angadze), Kwa ine monga kale (kalelo) 
M’dziko la Galileya, Kuchokera kwawoko; 
Nadzayenda m’dzikoli, Lapansi ngati kale; 
Tsiku lina adzabwera, Ndidzam’dziwa kodi?

CHORUS:
Ndidzam’dziwaye e e Eee Ndidzam’dziwa 
Inde munthuyo wa Galileyayo.

2. Kodi chilipo china (chinanso), Chotidziwitsirafe (tsirafe); 
Iye wotiferafe, Natipulumutsafe; Anapachikidwatu, Natiombola tonse; 
Tsiku lina adzabwera, Tidzamdziwa kodi?
''',
      '''1. Ndikadakhala ndi mapiko ine, Nkadaulukira dziko labwino; 
Komwe kulibe umphawi ndi kulira, Mtendere wake ndi wosatha.

CHORUS:
Sop: 
Mtendere wake
ATB: 
Mtendere wosatha
Sop: 
Mtendere wake
ATB: 
Mtendere wosatha
All: 
Komwe kulibe umphawi ndi kulira, 
Mtendere wake ndi wosatha.

2. Ndikadakhala ndi mapiko ndithu, Nkadaulukira dziko labwino; 
Komwe kulibe zovuta ndi matenda, Mtendere wake ndi wosatha.

3. Yesu afuna tinke kwaoko, Njira yake yakuwalayo; 
Komwe kulibe umphawi ndi kulira, Mtendere wake ndi wosatha.
''',
      '''1. Mafunso akale anali kufunsidwa, Pamene 
Ambuye anali padzikoli. (Ophunzira) akewo namufunsa Iye, 
Kodi Mbuye wathu mubwera liti?

CHORUS:
Sop:
Tidzaoneranji, kodi tifunsiretu, Taonani! Monga diso, monga diso. 
Koma opulumuka adzaukatu palipengalo;
Koma ochimwa onse, Ee palipenga lakumaliza.

ATB:
Pakudza kwanu, tifunsiretu, iyayi taonani! 
Kuthwanima kwa … Kuthwanima kwa … 
Kuthwanima kwa diso; Opulumuka adzaukatu, 
Ee palipenga lakuyambalo; Ochimwa onse adzaukanso, 
Ee palipenga lakumaliza.

2. Mafunso akale anali kufunsidwa, Chifukwa chakuti iwo sana-dziwe; 
(Ndipo anafu) nsabe molimbikira; Ambuye wathu musatibisire.

3. Ife tiyenera kufunsanso funsoli, Pakuona kuti nthawi yaya-ndika. 
(Tiyenera) kufunsa molimbika, Kodi Mbuye wathu mubwera liti?
''',
      '''1. Poyang’ana m’phirimo, Ndidzathangatidwako; 
Aitu thandizolo ndipeza kwa Yehovayo.

CHORUS:
Akusunga moyo wako ndikutchinjiriza iwe 
Mnyumba ndi panjira pomwe akusunga monsemo.

2. Yemwe anasungatu, Israyeli wakalelo; 
Adzatchinjirizawe, Iye sadzagonayi.

3. Akusunga Mbuyeyo, Ndi mthandizi wakotu; 
Mdzuwa lakutenthalo adzakhala m’thunzitu.
''',
      '''1. Patsidyalo la mtsinje ndionapo dziko, 
Komwe wokondedwa adzakumana nako 
Komwe tikakhale ndi wokondedwawo, 
Chikondwerero chamuyaya.

CHORUS:
Patsidya lija lokongo-kongola, 
Tidzapita kwathu ndithu tsiku lina; 
Kukakhala kumalo ampumulowo, 
Chikondwerero chamuyaya.

2. Pamene angelo adzandiitana, Ndidzauka msanga kukomana nawo; 
Kukhala kumalo ampumulowo, Chikondwerero chamuyaya.

3. Ndisangalala kwathu kwabwino, Aleluya tidzaimba ndi angelo; 
Ndi Yesuyo, mavuto, zowawa kulibe, m’Ziyoni dziko lokongola.
''',
      '''1. Oyera mtima adzasangalala, Podzalowa mu mzinda woyerawo 
Podzakhala pa mapazi a Yesu N’dzaiwala mavuto (mavuto).

CHORUS:
Ndzaiwala nthendazi, Ndzaiwala imfayo. 
Ndzaiwala zonsezi, Podzafika kwathuko
(AT: Kumwamba).

2. Yesu dzapukuta misozi yonse Ya oyera mtima owomboledwa 
Tidzayimba aleluya kosatha Ndzaiwala mavuto (mavuto).

3. Dzakomana nawo okondedwawo Omwe ndalekana nawo mu imfayo 
M’dzakhalira limodzi kwamuyaya N’dzaiwala mavuto (mavuto).
''',
      '''1. Anena za mzinda kumwambako, Ndifuna kupitako’
Womangidwatu mokometsetsatu, Ndifuna kupitako.
Komwe Yesu anandikonzerako, Ndifuna kupitako; Komwe
kulibe nthenda ndi imfanso, Ndifuna kupitako.

CHORUS:
Ndipitekotu, ndipitekotu, Inde ndipitekotu; 
Ndipitekotu, nanga bwanji’we, Sufuna kupitako.

2. Potsiriza ulendo nchombocho, Ndifuna kupitako;
Ndifunatu zombo zakalezo, Ndifuna kupitako.
Komwe zombozo zikakomaneko, Ndifuna kupitako; Ndikuyimba
nyimbo ndi azezewo, Ndifuna kupitako.

3. M’mene Yesu akuvekedwa ufumuwo, Ndifuna kupitako;
Ndzaimba mofuula kumwambako, Ndifuna kupitako.
Ndzaimba mobwereza aleluya, Ndifuna kupitako; Mavume
ali kumveka amen, Ndifuna kupitako.
''',
      '''1. Pamsonkhano waukulu kumwamba, Kodi mayi mudzakhalako?
Pamsonkhano waukulu kumwamba, Kodi mayi mudzakhalako?

CHORUS:
Yesu dzalandira oyera (oyera) Nadzawalowetsa mu mzinda
Pa msonkhano waukulu kumwamba, Kodi mayi mudzakhalako.

2. Podzaimba nyimbo ndi angelo, Kodi bamboo mudzakhalako?
Podzaimba nyimbo ndi angelo, Kodi bamboo mudzakhalako?

3. Podzavekedwa minjiroyo, Kodi gogo mudzakhalako?
Podzavekedwa minjiroyo, Kodi gogo mudzakhalako?

4. Kodi mudzamva mau ake, Unachita bwino mwananga.
Kodi mudzamva mau ake, Unachita bwino mwananga.
''',
      '''1. Dzukatu kutulo nthawi yatha, Tsono ndi mbanda kucha dzuka nyamuka;
Mfumu ikubwera dzuka kutulo, Wakugonawe dzuka!

CHORUS:
Dzuka, Dzuka wakugonawe dzuka, (Bass: Dzuka);
Dzuka, Dzuka lipenga lalira; Chokatu kutulo waulesiwe;
Wakugonawe dzuka!

2. Mtima wangawu uli mtulobe, Nthanda yaturuka mdima wachoka;
Ndaona oyera ali paulendo, Wakugonawe dzuka.

3. Tadzuka kutulo nyali zayaka, Ndi mafuta aja anatipatsa;
Tigwire ntchitoyo podikirapo, Wakugonawe dzuka.

4. Bwanji mbale wanga uleke zoipa, Tayandikiratu kuchikondwerero;
Vulatu mwinjiro wa mumdimawo, Wakugonawe dzuka.
''',
      '''1. Mose atamenya thanthwe kawiri, Mulungu nakwera naye paphiri
Namuonetsa dziko la Kenani, Nati sudzalowamo.
Mose atamenya thanthwe kawiri, Mulungu nakwera naye paphiri
Namuonetsa dziko la Kenani, Nati sudzalowamo.

CHORUS:
Ndiwona dziko lija lowala;
Ndiwona dziko lija lokoma;
Ndiwona dziko lija laufulu;
Labwino lowusa moyo.

2. Mlonda kodi nthawi ili bwanji, Mlonda nati ili m’banda kucha
Nthanda yatuluka iwonekera, Tiri pafupi ndi kwathu.
Mlonda kodi nthawi ili bwanji, Mlonda nati ili m’banda kucha
Nthanda yatuluka iwonekera, Tiri pafupi ndi kwathu.

3. Dziko lakasupe wosaphwayo, Dziko lake ilo la thya-thya-thya;
Maluwa akenso okongola, Ovala ulemerero.
Dziko lakasupe wosaphwayo, Dziko lake ilo la thya-thya-thya;
Maluwa akenso okongola, Ovala ulemerero.
''',
      '''1. Pamene watha ulendo wanga, Nditatula zolemetsazo;
Ndzaima pa chipata chowala, Pomwe ndidzalandira krona.
Ndidzaiwala mayeso onse, Udzakhala ulemerero; 
Mpulumutsi wanga ndimtama, Pamene watha ulendowu.

CHORUS:
Alt:
Podzathadi paulendo,
Ndidzaona Mpulumutsi,
Pakhomolo dzatsegula
Nati lowa mwanawe,
Unachi-tadi bwino udzakhala ndi Ine
Kunthawitu zamuyaya
Udzamtama Mbuye mokondwa.
STB:
Podzathadi ulendowo
Ndidzaona Mpulumutsi
Pakhomolo dzatsegula,
Lowa mwana wanga,
Unachita bwino bwino,
Udzakhala ndi Mbuyeyo,
Kunthawitu zamuyaya,
Udzamtama Mbuye mokondwa (mokondwa)

2. Polemedwa moyo ndi zisoni, Ndi mavuto osaneneka;
Ndiganiza za tsiku lijalo, M’mene zowawa zidzatha phe;
Pamodzi ndi angelo kumwamba, Ndzaimba Aleluya kwa ‘Ye;
Ndzakomana nawo wokondedwa, Pamene watha ulendowu.

3. Nthawi zambiri ndimalefuka, Potalika paulendowu;
Komabe ndziwa mombolo wanga, Ali ndi ine nthawi zonse;
Posachedwa zidzaonekera, Nyali za mzinda wowalawo;
Mpulumutsi ali kulindane, Kumapeto a ulendowu.
''',
      '''1. Nthawi yathadi, Nthawi yathadi.
Nthawi yathadi, Yesu ali pafupi kudza.

CHORUS:
Tilalikire m’mapiri, Tilalikire m’madambo.
Uthenga ufikire ponse-ponse.
Kuti Yesu adze mwamsanga (mwamsanga).

2. Nthawi yathadi, Nthawi yathadi;
Nthawi yathadi, Zizindikiro zakwanitsidwa.

3. Nthawi yathadi, Nthawi yathadi.
Nthawi yathadi, Tikonzekere pobwera Yesu.
''',
      '''1. Owomboledwa adzaimba nyimbo, Natula pansi akoro-naawo.
Zitatha zowawa zonse za m’dziko, Tidzaimba nyimbo yatsopano.

CHORUS:
SA: A-dzaimbira, Yesu yemwe anafera;
A-dzaimbira, Yesu nthawi zosaleka
TB: Adzaimbira Yesu yemweyo anafera; pa Gologota
Bass: Pamtanda,
T B: A-dzaimbira,
Ten: A-dzaimbira, A-dzaimbira,
Bass: Yesu nthawi zosaleka.

2. Oyera okha adzaimba nyimbo, Ndi milomo ya chisomo.
Dzaimba nditsukeni, Mbuye ndi mwazi wanu; 
Tidzaimba nyimbo yatsopanoyi.

3. Ha nyimbo zozwitsa za chikondi, Tidzaimba potsiriza dzikoli. 
Yesu Mpulumutsi anatifera, Tidzaimba nyimbo yatsopanoyi.
''',
      '''1. Ndisankonderenji Yesu, Yemwe anandifera.
Ndimulemekeze bwanji, Wondiombolayo.

CHORUS:
Ali pa mpando mlemelero, Angelo amuyimbira’Ye
Yesu Mbuye, ndine wake, Anandiferane.

2. Ndisankonderenji Yesu, Ndinataika ine.
Chikondi Chake choposa, Ndawomboledwane.

3. Ndisankonderanji Yesu, Abwera kutenga’ne 
Nkakhale naye muyaya, Mu ulemelero.
''',
      '''1. Ndakonzeka kumva zowawa, Pogwira ntchitoyo.
Kutumikira anthu ena, Mfupi ndi mtalimo.

CHORUS:
Ndakonzekera ndakonzeka, Kuchita mbali yanga 
Kutumikira Mbuye wanga, Ndakonzeka ine.

2. Ndakonzekera kupitatu, Mumphamvu Yakeyo.
Ndaimanji mpaka Yesuyo, Aloze njirayo.

3. Ndakonzekera kulalika, Ndi mtima wonsewo.
Mumzinda ndi m’midzi momsemo, Osaleka konse.

4. Ndakonzekera kuchenjeza, Miyoyo yotayika.
Ikhaletu yokonzekera Pakudza Yesuyo.
''',
      '''1. Ndidzayenda ndi Yesuyo, Kuti ndichilitsidwe mtimamo.
Ndidzamuimbira Iye, Kuti angelo akondwere.

CHORUS:
Sindidzasintha njira yanga, Ndidzaumirira kwa Yesuyo.
Sindisiya Chikhristucho, Mpaka ndidzamuone Atate.

2. Ndidzayenda pa njirapo, Pa madambo, mnyanja yofiira.
Yesu adzatidalitsa kuti, Tikawuone mzindawo.

3. Yesu sadzatilekafe, Ndipo adzapukuta misozi.
Nadzatitenga tonsefe, Kuti tikawuone mzindawo.
''',
      '''1. Nthano ya Yobu m’dziko la Uzi; 
Yemwe anapeza mavuto oopsa.
Kuonongeka chuma, moyo wake, Yobu anapirira.

CHORUS:
Bass: 
Ndipo Yobu anapirira mabvutowo
All: 
Nati ngakhale ndipeze mavuto
Bass: 
Ndithu
All: 
Ndiyenera kulimbika, Mwaichi Yobu sananene choipa.
Bass: 
Ndipo Yobu
All: 
Anapirira.

2. Nthano ya Yobu yomvetsa chisoni, kwa abwenzi ake ndi abale ake.
Kuonongeka chuma, moyo wake, Yobu anapirira.

3. Kodi anzanga muli ngati Yobu, Yemwe anapeza mavuto oopsa.
Kuonongeka chuma, moyo wake, Yobu anapirira.
''',
      '''1. Mkhristuwe pemphera kosalekeza, 
M’mamawa, usana ndi usikunso. 
Yesu mwini moyo napemphera, 
Adzapatsa’we moyo.

CHORUS:
Moyoo, adzapatsa moyo, moyo, moyo, moyo wosatha.
Moyoo, adzapatsa moyo, Adzapatsa moyo wosatha.

2. Pokondwa polira upempherebe, 
Pempha mzimu Wake akutsogoze.
Pakumaliza kamoyo kakoka, 
Adzapatsa’we moyo.

3. M’nyumba ya Mulungu upempherenso, 
Pamaso pa Mulungu ulula tchimo.
Chisomo cha Mulungu udzalandira, 
Adzapatsa’we moyo.

4. Pempherera m’dani ndi bwenzi lako, 
Onse uwakonde ndi mtima wonse.
Pobwera Ambuye adzapatsawe, 
Moyo, moyo wosatha.
''',
      '''1. Unison: 
Ima nji mwa Yesuyo
All: 	
Ima nji mwa Mbuyeyo
Unison: 	
M’mafunde oopsawo,
All: 	
Ima nji mwa Mbuyeyo

CHORUS:
Ima mwa Yesu m’mavuto, m’mtendere, 
Ukhulupirire’Ye, Ima nji (Ima nji) 
Ima nji (Ima nji), 
Mbuye adzathandiza’we (thandiza’we)

2. Unison: 
Ima nji mwa Yesuyo
All: 	
Ima nji mwa Mbuyeyo
Unison: 	
Akadza mayesero,
All: 	
Ima nji mwa Mbuyeyo

3. Unison: 
Ima nji mwa Yesuyo
All: 	
Ima nji mwa Mbuyeyo
Unison: 	
Dzikoli lapendeka,
All: 	
Ima nji mwa Mbuyeyo

4. Unison: 
Ima nji mwa Yesuyo
All: 	
Ima nji mwa Mbuyeyo
Unison: 	
Yesu ali pafupi,
All: 	
Ima nji mwa Mbuyeyo
''',
      '''1. Mtima khale chete udzivutilanji,
Nyimbo yogonjetsa ilipodi,
Usachedwe konse lonjezano lake.
Usaope  usaope.

CHORUS:
Khala chete mtima wofatsawe, 
Khala chete mtima wofatsawe.

2. Mtima khala chete abweradi Mbuye,
Kudzakutengani kunka kwao. Tsiku
lobweralo, sitingalidziwe, Singadziwe,
singadziwe.

3. Linda popemphera usadere nkhawa,
Ngakhale achedwe adzabwera.
Mkati mwausiku, Kudzakutengani,
Kunka kwao kunka kwao
''',
      '''1. Ndakhutitsidwa ndi zamdzikoli ndalama nzochepa ndi zina zonse;
Uko kumwamba kuli mtendere, Ndidziwa anandikonzera’ne.

CHORUS:
Ndili ndi malo pamwamba pa phiri, Mumzindawo sitidzakalamba.
Koma patsiku ilo sitidzadabwitsika, Poyenda m’misewu ya golidi.

2. Ngakhale ndiyesedwe ndikusautsidwa, Monga ‘neneri anayesedwa.
Uko kumwamba kuli mtendere ndidziwa anandikonzera ine.

3. Dziko lapansi lamasautso, Njala ndi nthenda ndi zina zonse.
Uko kumwamba kuli mtendere ndidziwa anandikonzerane.
''',
      '''1. Ngati dziko likuda, Ndipo usowa ndalama,
Ndipo uli kukhala movutika. Ukumbukire
kuti amadyetsa mbalame, Umtulire
Yesuyo mavutowo.

CHORUS:
Mtulire (mtulire) Mtulire (mtulire),
Umtulire Yesuyo mavutowo
Ukakhulupirira adzakupulumutsa, Umtulire
Yesuyo mavutowo.

2. Ngati uli kudwala, ndipo ulibe thanzi,
Moyo wako ulitu kuvutika.
Yesu adziwa nthenda, Iye adzakuchiza, Umtulire
Yesuyo matendawo.

3. Ngati pali adani amene muli nawo, Ndipo
moyo wanu uli ndi mantha. Musaiwale
Yesu ayankha mapemphero, Mumtulire
Yesuyo mavutowo.
''',
      '''1. Ndilitu paulendo, m’dziko la zowawali, Kwathu ndi tsidya lijalo;
Kumalo owalawo, Mwina ndigwetsedwa mphwayi;
Chiyembekezo chitha, Koma Yesu ali mfupi ndipite m’tsogolo.

CHORUS:
Bass: 
Ndamangidwa Kuyenda-mo,
Njira ya uthengawo podziwa Mbuye alipo
Adzandithangata, mpaka ‘dzafika mwambamo
Kumpando wachifumu, tidzaimba nyimbo zo-komazo
Mchikondwerero Chake
SAT:
I-ne kuyendamo ndi u-thengawo, A-dza nditsogoza
Po-ndithandiza, Po-dzafika mwamba ku-mpando wake,
Komwe ndi-dzayimba nyimbo zo-komazo
Mchikondwerero chake (poyenda)

2. Sindidzasiya njirayi ngakhale m’mavutomo, Mbuye adzanditsogoza,
Ku malo owalawo, Wandifungatira Ine, Ndipo sindili ndekha,
Ndikhulupirira Iye, Ndipite m’tsogolomo.

3. Pamadzulo ndisendeza, Kumalo a mtendere, Posachedwa ndidzayimba,
Ndi onse olungama, Aleluya pa m’mamawa powona abwenziwo,
Ndikudzakomana nawo, Popita m’tsogolomo.
''',
      '''1. Panthawi ya nsautso ndithu, Tidzayimba Aleluya kwa Atate
Panthawi ya nsautso ndithu, Tidzayimba Aleluya kwa Atate.

CHORUS:
Bass: 
Adzatsogolera
All: 
Aneneri adzatsogolera
All: 
Aneneri, Eni eni
Bass: 
Ooh imfa ndi nthenda
All: 
Tu- zidzatha, Tidzayimba Aleluya kwa Atate.

2. Pamene tili n’zowawa m’dziko, Tiyang’ane kwa Yesuyo Mombolo wathu.
Pamene tili n’zowawa m’dziko, Tiyang’ane kwa Yesuyo Mombolo wathu.

3. Pamene Yesu adzabwera m’dziko, Olungama adzayimba chigonjetso.
Pamene Yesu adzabwera m’dziko, Olungama adzayimba chigonjetso.
''',
      '''1. Ngakhale ndikonde chuma chapadziko, Zindivuta ndekha.
Sichikwanira, chuma chokwanira ndichipeza kuti?
Kwa Yesu Mbuyeyo kumwambako.

CHORUS:
Sop: 	Uko kumwamba, kumwambako
ATB:	Kumwambako, kumwambako
All: 	Kulibenso nkhawa, Zisoni pena kulira

2. Ngakhale ndiyenda mzipatala monse, 
Dziko lapansili n’loliritsa Dziko lamtendere ndilipeza kuti?
Kwa Yesu Mbuyeyo kumwambako

3. Tsono m’bale wanga tadziganizira, Zatsogolo lako. 
Moyo ukudzawo kapena leroli kapenanso mawa, 
Kusiya dzikoli kunka m’mwamba.
''',
      '''1. Tsiku la mdima lidza posachedwa,
Tsiku la mdima oipa adzalira ‘mayo’,
Lidzakhala tsiku la Yehova.

CHORUS:
Thambo lonseli lidzakanganuka,
Mapiri onsewa adzachoka,
Mitsinje yonseyi idzauma,
Wamphamvu ‘dzagonja, wanzeru zidzatha tsikulo.
Wachuma ‘dzataya, woyipa adzalira ‘mayo’,
Lidzakhala tsiku la Yehova.

2. Dziko likupita, anthu atanganidwa
Anthu ambiri ataya Yesu
Ena akumwa mowa, ena kunyongedwa mdzikoli
Ena kuyatsidwa moto, owerengawe khala maso
''',
      '''1. Pakuyenda mdziko lino mavuto andidzerane, 
Koma ine ndiyendabe, mkuwala kwake kwa Mbuyeyo.
M’mene ndimva mabeluwo kumwamba nkotsegukako,
Ntayendane pa mtundawo wotsiriza (wotsiriza).

CHORUS:
Bass: 
Ndzayendane kumwambako misewu nja golidiyo,
Ndzawona wokondedwawo uko kumwamba kwa Atate.
Mmene ndimva mabeluwo, Kumwamba nkotsegukako,
Ntayendane pa mtundawo wotsiriza (wotsiriza).
SAT: 
Ne – ko – ya – yoo – o – owo kumwamba kwa Tate
Mmene ndimva mabeluwo, Kumwamba nkotsegukako.
Ntayendane pa mtundawo wotsiriza, (wotsiriza).

2. Dziko lino ndi lachabe la imfa ndi la chisoni,
Maso awo-kondedwawo amangokhetsa misozi.
Usiku tsono wapita m’banda kucha wayandika
Ntayendane pa mtundawo wotsiriza (wotsiriza).
''',
      '''1. Sinjira yofewa tili kumka kumwamba,
Ngakhale tili ndi mavuto
Koma Mbuye ali nafe natitsogolera
Amatisangalatsa ife,

CHORUS:
Bass: 
Ayi Ayi Ayi
All: 
Aayi sinjira yofewa
Bass: 
Ayi Ayi Ayi
All: 
Aayinso sinjira yofewa, Mbuye amayenda nafe
Natitchinjiriza napeputsa katundu wathu.

2. Sinjira yofewa muli imfa matenda, Mavuto
mayesero mnjira. Mbuye amatikonda
amasamalira, Amatilimbikitsa mzoopsa.

3. Mmene ine ndatopa popita pa ulendowu,
Ngakhale zipsinjo zindigwere.
Ndidzakondwa tsikulo mmene Mbuye adzabwera,
Ndidzasangalala m’mwambamo.
''',
      '''1. M’mene ndilemedwa ndi katundu, M’mene ndikhala osamvera.
Ndipemphera kwanu Yesu Mbuye, mundisunge m’manja mwanumo.
Yesu wokonda idzani mfupi, Mthangate kumenya nkhondoyi.
Mundisunge m’madalitso anu, Yesu m’sandiyiwale.

CHORUS:
Sop: 
Yesu Mbuye msaiwale, ndingasochere ine, khalani thandizo langa
E-e masiku onsewo, m’nditsogoze kupyolatu, chigwa cha- am’dimawo
Msaiwale Yesu Mbuyenu, m’khale mfupi ndi ine.
ATB: 
Yesunu, iwale, ndingasochere ine, Khalani, thandizo langa e-e masiku
onsewo;
Tsogoze, kupyola, chigwatu cham’dimawo, iwale
Yesu Mbuyenu, m’khale mfupi ndi ine.

2. Nthawi zina ndigwetsedwa mphwayi, M’mene ndiyesedwa
m’dzikoli. Koma ndikondabe dzina lanu, Ndikhale m’chisomo chanucho.
Inu Yesu msaiwale konse, Mkhale wondisangalatsane.
Musunge mzimu wanu mwa ine, Yesu msandiyiwale.

3. Paulendo munditsogolere, M’nditsogoze mpaka utatha.
Kulibe wina woposa Inu, Angathe kunditsogozane.
Koma ndigwirebe ntchito yanu, Kufikira zonse zatha phee.
Ndikayenda m’chigwa ndekha-ndekha, Yesu msandiyiwale.
''',
      '''1. Ndiri ndi kwathu ine, Kumwamba kowalako,
Komwe angelo ayimba, Ndiri ndi kwathu ine.

CHORUS:
Kosamangidwa ndi manja, Kwathu kowalako
Komwe angelo ayimba, Ndiri ndi kwathu ine.

2. Ndiri ndi kwathu ine, Kosasinthikako,
Komwe angelo ayimba, Ndiri ndi kwathu ine.

3. Ndiri ndi kwathu ine, Kumene ndikakhale,
Komwe angelo ayimba, Ndiri ndi kwathu ine.
''',
      '''1. Yesu ndiye ngaka yanga, Sindidzasochera mwa lye,
Achinjiriza akewo, Kuli konse awasunga.

CHORUS:
Sop : 
Andisunga, andisunga Konse ndipita, amasungane
Ndi bwenzi loposa onse wotu E-e kulikonse	
ATB : 
Andisunga, andisunga Konse-konse, amasungane
Ndibwenzi loposa, usana ndi usiku E-e kulikonse ndipitako

2. Kaya ndizingidwa bwanji, Yesu ndiye wopulumutsa,
Kaya azinga adani, lye adzapulumutsa.

3. lye adzandisungane, Kuli konse ndidzapita,
Kaya ndi malo owopsa, lye ndiye ngaka yanga.
''',
      '''1. Ndimva nyimbo yokomayo, Ndilephera kubwereza
Ndikhulupira ndzayimba Mulungu akadzalola,

CHORUS:
Sop : 
Tsiku lina lokomalo ndidzaimba kumwambako,
Ndidzaima ndi Angelo pamapazi a Yesuyo.
ATB: 
Tsiku lina lokomalo ndidzaimba kum wambako,
Ndidzaimba ndi Angelo pamapazi a Yesu.

2. Ulendo wanga ukatha, Ndidzapita kumwambako.
Ndidzapyola mayesowo, Ndidzaona Mpulumutsi.

3. Ndidikira kufikira, Zitseko zitatseguka.
Ngakhale tsiku lichedwe, M'mawa wina ndidzapuma.

4. Likadzafika tsikulo, Njira sindidzaidziwa.
Mulungu ndzagwira dzanja, Natsogolera kwathuko.
''',
      '''1. Ndionetse Yesu moyo wanga, Ndipo ndimuyamikeye.
Ananditulutsa m'machimowo, Ndadalitsidwa ine.

CHORUS:
Sop : 
Ine ndionetsere Yesuyo, Ndinyamule mtanda wangawo;
Ndinyamule tsiku ndi tsiku, Nkana ndikhale osayenera;
Komabe n'dzakhala ndi Mbuye kunthawi zonsezo

ATB: 
Ine ndionetsere Yesu, Ine ndionetsere Yesu;
Ndinyamule mtanda wangawo, Ndinyamule tsiku ndi tsiku
Nkana ndili osayenera, Nkana ndili osayenera;
Komabe n'dzakhala ndi Mbuye kunthawi zonsezo.

2. Ndionetse Yesu moyo wanga, Mfumu ya mafumuvo.
Akhala pakati pangelowo, Namlemekeza lye.

3. Ndionetse Yesu moyo wanga, Ndiyende mchifuniroke.
Ndipo podzabwera mdziko lino, Ine n'dzapita naye.

4. Pakutha moyo wanga mdzikoli, Ndziwa ndidzaukanso.
Yesu popereka mphotho yake, N'dzalandira koronavo.
''',
      '''1. Tikadzanka kumwamba, tidzavala zoyera, 
Zakuda sizidzalowako (uko)
Kulibe mdima uko, nkowala nthawi zonse, 
Ndi ulemerero wa Mbuve.

CHORUS:
Sop : 
Tidzavala zoyera mbu, Adzativeka Mbuyeyo;
Ndi minjiro yokomadi tidzayenda ndi Mbuye, Tidza-va-la zo-ye-ra.

ATB:
 Tidzavala zoyera mbu, tidzavala zoyera mbu;
Adzativeka Mbuyeyo ndi minjiro yokoma ndithu, 
Yosokedwa ndi Mbuveyo,
Tidzayenda ndi Mbuye ti-ta-va-la zo-ye-ra.

2 Titakhulupirira tidzayenda ndi Mbuye, 
lye akutitsogolera (mnjira);
Chodabwitsa kwambiri, pokayenda ndi Mbuye, 
Tikumwimbira ngmbo zathu,

3. Tikadzanka kumwamba, tidzaona Eliya, 
Pamodzi ndi Enoki yemwe (ndithu);
Ngakhale, Mose uja, tidzaonana naye, 
Ndipo tidzakondwa kwambili.
''',
      '''1. Ndikaganiza za moyo uno
Ndi operewera osachedwa kutha.
Ndafuna-funa mmasitolo onse,
Kugula moyo koma ndalephera.

CHORUS:
Lilipo dziko labwino, zoona lokometsetsa 
komwe tikapeze, moyo wosatha
(Moyo! - Bass), moyo waulere,
(Moyol - Bass), moyo osagula komwe 
tikayimbe Hosana, Hosana.

2. Ndingayende-yende dziko lapansi,
Palibe komwe angandipatse moyo.
Koma kwa Yesu wa chifundoyo,
Ndikokha-kokha angandipatse moyo.

3. Yesu anati ine ndine njira,
Choonadi khomo ndiponso moyo.
Ofuna kudza pambuyo panga,
Adzikanize nasenze mtanda wanga.
''',
      '''1. Mungaka yake Mulungu adzandibisa, Kumalo ake a ulemerero
Iye adzandisunga nkuwala kwake, Mulungu adzandibisane,

CHORUS:
Sop : 
Iye adzandibisa
ATB : 
Bisa, bisa, bisa, bisa mumavuto ozunza mtima wanga.
Sop : 
Iye adzandibisa
ATB : 
Bisa, bisa bisa bisa
All : 
Mulungu adzandibisane.

2. Mungaka yake Mulungu adzandibisa, Kumalo Ake aulemerero
Mwachifundo ndi chikondi chipambana, Mulungu adzandibisane.
''',
      '''1. Ndikapirira ine mayesero, Kumwamba ndidzawala;
Ndidzamuuza Yesu zavuto langa, Kumwamba ndidzawala.

CHORUS:
Sop : 
T'dzaimba, dzaimba
ATB: 
T'dzaimba, dzaimba
All : 
Hosana, Aleluya Amen
Sop : 
Uko ku Uko ku
A,T,B: 
Kumwamba, kumwamba
All : 
Pamodzi ndi oyerawo

2. Ndidzaiwala ine umasiye, Pofika pagombe (Iowala).
Ndidzakondwera nawo okondedwa, Omwe ndalekana nawo.

3. Sindidzalira pofika uko, Kumwamba ndidzawala.
Korona ndi mwinjiro ndidzavala, Kunnwamba ndidzawala.
''',
      '''1. Ndikusirira Yerusalemu
Mzinda uja wokongola
Ndikusirira Yerusalemu
Mtima wanga ukufunako

CHORUS:
Sop:
 Koma popitako - m'khale osunga malamulo,
NdikukondaYesu Mbuye wanga, mtima wanga ukufunako

ATB: 
Koma popitako kumwambako-mkhale osunga malamulo a Yesu,
NdikukondaYesuNbuye wanga, Mtma wanga ukufunako kumwambako

2. Ndikusirira Yerusalemu
Mzinda uja wokongola
Komwe kulibe matenda ndi imfa
Mtima wanga ukufunako

3. Ndi- kusirira Yerusalemu
Mzinda uja wokongola
Komwe n'dzayenda m'misewu ya golidi
Mtîrna wanga ukufunako.
''',
      '''1. Ndinu thanthwetu, mombolo wanga,
Ndinu chikopa chondibisa.
Ndinu thanthwetu lotchinjiriza,
Ndibisaletu mwa lnu Mbuye.

CHORUS:
Thanthwe langa (thanthwe langa)
Mombolo wanga (mombolo wanga)
Bwenzi langa (bwenzi langa)
Ndi mtsogoleri (mtsogoleri)
Ndinu thanthwetu lochinjiriza ndibisaletu mwa lnu Mbuve

2. Ndinu thanthwetu pamene moyo,
Wanga uvutika mdzikoli.
Mudzanditsogolera kupyola,
Mafunde onse ovutane.

3. Ndinu thanthwetu pamene mukulanga,
Ochimwa mdziko lino.
Mwa inu ndidzapeza mpumulo,
Ku nthawi zosasinthikatu.
''',
      '''1. Banja ndilo lokongola lomwe limasangalala,
Banja ndilo lokongola lomwe limasangalala.
Nkhope yokondwa ya bambo, Ndi mau okoma amayi,
Zikometsa banja lonse, La Akhristu okondwawo.

2. Mai wosangalalayo ali bwenzi la Khristuyo,
Mai wosangalalayo ali bwenzi Ia Khristuyo.
Asambitsa ana ake, Nawavekatu zabwino,
Mai uyo wokondwayo, Banja lake la mtendere.

3. Bambo wosangalalayo ali bwenzi la Khristuyo,
Bambo wosangalalayo ali bwenzi la Khristuyo.
Apangana ndi mayiyo, Pogula zosowa zawo,
Bambo uyo wokondwayo, Banja lake la mtendere.

4. Banja la Chikhristu ndilo, Mbuye akhala momwemo
Bambo wosangalalayo ali bwenzi la Khristuyo.
Alankhulana mokondwa, Napemphera nsiku zonse
Banja ilo la mtendere, La Akhristu okondwawo.
''',
      '''l. Ndanitu angathe kumupeza, Mkazi wa ngwiroyo.
Pakuti mtengo wake uposa, Ngale yopambanayo.

CHORUS:
Mtima wa mwamuna wake umkhulupirira
A'mchitira zabwinozo mkazi wopambanayo.

2. Asinkha choyamba m'munda wa, Ndiwo za masambazo.
Natenga nthawi yokwaniratu, Kuusamaliratu.

3. Masiku onse amoyo wake, Afunafunatu.
Thonjetu labwino ndi lolimba, Naluka zovalazo.

4. Anatu a banja la mayiyo, Amutcha odala.
Mwamuna wake namtama nati, iwe uposa onse.
''',
      '''1. Chinsinsi cha ukwati ndi chinsinsi chopambanadi,
Chinsinsi cha ukwati ndi chopambanadi.
Chinsinsi cha ukwati ndi chinsinsi chopambanadi,
Chinsinsi cha ukwati ndi chopambanadi.
Kutenga awiri awa kutenga awiri awa, 
Akhale munthu m'modzi.
Kutenga awiri awa kutenga awiri awa, 
Akhale munthu m'modzi.

2. Chinsinsi cha ukwati chinayamba mu Edenimo,
Chinsinsi cha ukwati lero tachiwona.
Chinsinsi cha ukwati chinayamba mu Edenimo,
Chinsinsi cha ukwati lero tachiwona.
Kutenga mnyamata uyu kutenga msungwana uyu, 
Akhale thupi limodzi
Kutenga mnyamata uyu kutenga msungwana uyu, 
Akhale thupi limodzi

3. Tipempha Mulungu m'mwamba Akhale pakati pawo,
Banja latsopanoli lilalike Yesu.
Tipempha Mulungu m'mwamba akhale pakati pawo,
Banja latsopanoli lilalike Yesu.
Kupyola mwa (Mkwatibwi) kupyola mwa (Mkwati) tikaone chikondi
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaonetu Yesu

4. Ambuye mudalitsetu awiri-wa lero lino.
Kuti chikondi chawo chikhale chosatha.
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaone Chikondi.
Kupyola mwa (Mkwati) kupyola mwa (Mkwatibwi) tikaonetu Yesu.
''',
      '''1. Mbuyetu kale lija m'munda wa Edeni;
Inu munakwatitsa ukwatiwo woyamba.
Monga munadalitsa ba-nja mu Edeni;
Dalitsaninso Mbu-ye banja latsopanoli.

2. Banja latsopanoli, muliphunzitsetu;
Chikondi chosatha chochokera kwa Inu;
Mbuye Mukhale bwenzi ndi mtsogozi wao
Mumphepo ndi m'namondwe (Inu) mukawalimbikitse.

3. Banja la Chikhristu, likhale nyali -
Younikira ena omwe ali mum'dima.
Mbuye pobwera Inu kudzatenga anu
Tidzalumikizane (nalo) kunka limodzi m'mwamba.
''',
      '''1. M'bale wanga iwe tiye tidzipita;
Ulendo umene Mbuye ananea.
Ulendo umenewo ngovutitsitsadi;
Ulendowu ngoyenda ndi mtima.

CHORUS:
Ulendowu, Ulendowu;
Ulendo umenewu ngoyenda ndi mtima zedi.
Ulendo umenewu ngovutitsitsadi,
Ulendowu ngoyenda ndi mtima.

2. Pakamwa patopa miyendo yatopa;
Ambuye mpatse mphamvu kuti tikafike msanga.
Ulendo umenewu ngovutitsitsadi;
Ulendowu ngoyenda ndi mtima.

3. Ambuye mverani pemphero langali;
Ambuye mpatse mphamvu kuti ndikafike msanga
Ulendo umenewu ngovutitsitsadi;
Ulendowu ngoyenda ndi mtima.
''',
      '''l. Mpingo wathu ukuladi nnonga ngati kambewu kampiru,
Kamene kakang'onong'ono mpaka kabala tsamba,
Lomwe lalikulu ndithu.

CHORUS:
Sop : 
Thamangatu, thamanga thamanga
ATB : 
Uthamange, uthamange thamanga
All : 
Yenda, yenda yenda yenda
Sop : 
Thamangatu, thamanga thamanga
ATB : 
Uthamange, uthamange thamanga
All : 
Ukagwiretu ntchito

2. Pamene timaganiza za Paulo mnyamata wolimba,
Yemwe anagwira ntchito ya Mulungu yopambana,
Yakulalika uthengawo.

3. Ena amachita mantha poona unyolo wau-kulu,
Nanga ntchito ya Mulungu idzayenda kodi,
Popanda nsinga zazikulu.
''',
      '''1. Palibe wina wondisamalirane, Palibe wina Mpulumutsi.
Palibe wina wonditsogolerane, Komatu Yesu Mbuye wanga.

CHORUS:
Ndiyembekeza Mpulumutsi, Ndiyembekeza Mbuye wanga (Yesuyo)
Ndiyembekeza apatsa moyo Wake, Ndiyembekeza abweradi.

2. Ndiyembekeza ulendo posachedwa, Ndiyembekeza Mpulumutsi
Ndiyembekeza kulowa kumwamba, Komwe maliro kulibenso

3. Mavuto onse kulibe koyerako, Mavuto onse adzathadi.
Mavuto onse sadzakumbukidwanso, Koma kukondwa nthawi zonse.
''',
      '''1. Patsala pang’ono kukwanitsidwa uthengawu,
Dziko lamavuto, Yesu adzabwera.
Patsala pang'ono kukwanitsidwa uthengawu.
Dziko lamavuto, Yesu adzabwera.

CHORUS:
Sop : 
Tiyi-mbetu, Tiyimbe nyimboyi
ATB: 
Tiyi-mbetu, Tiyimbe nyimboyi
Sop : 
Tiyi-mbetu, Tifalitse uthenga
ATB : 
Tiyi-mbe, Tifalitse uthenga

2. Yesu anapita kukatikonzeratu malo,
M'dziko lamavuto Yesu adzabwera.
Yesu anapita kukatikonzeratu malo,
M'dziko lamavuto Yesu adzabwera.

3. Adzalira malipenga kudzutsa ogona m'manda,
M'dziko lamavuto Yesu adzabwera.
Adzalira malipenga kudzutsa ogona m’manda,
M'dziko lamavuto Yesu adzabwera.
''',
      '''1. Abale tikuuzeni za kwathu
Tinayamba ulendowu titabadwa.

CHORUS:
Sikwathu kuno tangodutsa, 
Sikwathu kuno tangogonera,
Sikwathu kuno tangodutsa, 
Sikwathu kuno tangogonera.

2. Ngakhale tingakhalitse kuno sikwathu,
Tikudutsa mu zabwino ndi zoipa.

3. Tikapusa tingatsale paulendowo,
Pena osakafika kwathuko.

4. Mzindawo wa kumwambako ndiko kwathu,
Kumene kuli Yesu kwathuko.
''',
      '''l. Tiyeni tiyimbe limodzi ndi Angelowo,
Zikwi za zikwi ayimbira Mwana wa Nkhosa.

CHORUS:
Aleluya kwa Iye wophedwayo pamtandapo
Aleluya, aleluya, aleluya, Amen.

2. Tiyeni tiyimbe limodzi ndi Angelowo,
Tilemekeze amene anawombola’fe.

3. Tilakalaka kuwona Mwana Wa Nkhosayo,
Amene anafa mdzikoli kutiwombola’fe.
''',
      '''1. Ndabwera tate ndine Esau mundidalitse.
Zonse mwanena ndabwera nazo tate, mndidalitse.

CHORUS:
Thupi lokha ndi la Esau komatu mauwo;
Mau mau mau, Mau okha ndakana ndi a Yakobo.

2. Musakaike ndine Esau, mundidalitse.
Zomwe mwanena ndabwera nazo, mundidalitse.

3. Akhristu alero maonekedwe tavala zikopa.
Maonekedwe ngati opembedza koma ndi zikopa.
''',
      '''1. Chimwemwe dziko la kutali,
Chimwemwe dziko la kutali,
Mavuto kulibe, zisoni kulibe,
Chimwemwe chokhachokha.

CHORUS:
Chi-mwe-mwe-cho tidzasangalala,
Dziko la kumwamba Chimwemwe chokhachokha
Chi-mwe-mwe-cho tidzasangalala,
Dziko la kumwamba Chimwemwe chokhachokha.

2. Chimwemwe dziko la kumwamba,
Chimwemwe dziko la kumwamba,
Nthendanso kulibe, Maliro kulibe,
Chimwemwe chokhachokha.

3. Chimwemwe dziko la kumwamba,
Chimwemwe dziko la kumwamba,
Mabodza kulibe, Nkhondonso kulibe
Chimwemwe chokhachokha.
''',
      '''1. Mdima wamoyo wanga wachoka, Muli kuwala mtima mwanga.
Dzuwa liwunikira moyo wanga, Muli kuwala mtima mwanga.

CHORUS:
Sop : 
Kuwala mtima mwanga, Dzuwa la chilungamo liwalabe
ATB : 
Wala- wala-wala-wala, Wala-wala-wala-wala
Bass : 
Ukawala ponsepo
SAT : 
Wala- wala-wala-wala
All : 
Chikondi chidzapambanabe.

2. Ndikumva mbalame mmawa kuyimba, Mdima woopsa wachokadi
Moyo watso-pano ndiyendabe, Muli kuwala mtima mwanga

3. Yesu wadza-zane ndi chimwemwe, Mtambo wophimbawo kulibe.
Chikondi chake chidzachotsa mdima, Muli kuwala mtima mwanga.

4. Mbuye ndiye mthandiziyo, Ndiwopulumutsa onse.
Ngakhale woipa omwe, Ndi abwino onsewo.
''',
      '''1. Moyo wanga upambana siliva, 
Moyo wanga upambana golide.
Moyo wanga upambana chuma, 
Poti wondipatsayo anandipatsa ulere.

CHORUS:
Sop : 
Kondwera ndi moyo wako, Kondwera ndi mphatso yakoyo
ATB: 
Kondwera, kondwera, kondwera, kondwera, 
kondwera, kondwera, kondwera.
Sop : 
Kondwera usachite mantha
ATB: 
Kondwera, kondwera, ndi moyo wako.
All : 
Poti wondipatsayo anandipatsa ulere.

2. Moyo wako upambana siliva, 
Moyo wako upambana golidi.
Moyo wako upambana chuma, 
Poti wokupatsayo anakupatsa ulere.

3. Moyo wathu upambana siliva, 
Moyo wathu upambana golidi.
Moyo wathu upambana chuma, 
Poti wotipatsayo anatipatsa ulere.
''',
      '''1. Ndamva za dzikolo patsidya la Nyanja;
Ndiko kwathu kokongolako.
Komwe dzuwa ndiye komwe sitidzafa;
Dzikolo sitidzakalamba.

CHORUS:
Sitidzakalamba uko, Mdzikolo sitidzakalamba.
Sitidzakalamba uko, Mdzikolo sitidzakalamba.

2. Kulibe chisoni kapena kulira;
Tidzakhala wokondwa mwa’Ye.
Nyimbo ili pakamwa ndi mumtimanso;
Kuti machimo atsukidwa.

3. Podzatha pa ntchito ndi mavuto onse;
Zisoni zidzathaditu phe.
Tiyimbira mfumu ku nthawi zosatha;
Dzikolo sitidzakalamba.
''',
      '''l. Ndisintheni Yesu munthu wochimwa ine,
Ndisintheni Yesu munthu ochimwaa,
Ndisintheni Yesu ndione ufumu wanu,
Ndisintheni Yesu ndidzaone Inu.

CHORUS:
Dziko lino tikhala, dziko la mavuto,
Zochimwa zanga zonse sizikondweretsanu.
Ndisintheni Yesu ndione ufumu wanu,
Ndisintheni Yesu ndidzaone Inu.

2. Ndisintheni Yesu monga Saulo,
Ndisintheni Yesu monga nsaona.
Ndisintheni Yesu ndione ufumu wanu,
Ndisintheni Yesu ndidzaone Inu.

3. Pokhala ine wochimwa ndilandira Inu,
Koma popita nthawi ine ndinachimwanso.
Ndisintheni Yesu ndione ufumu wanu,
Ndisintheni Yesu ndidzaone Inu.
''',
      '''1. Ngakhale tchimo lingakule bwanji, Lidzayera ngati matalala.
Ngakhale likhale lofiira, Lidzayera ngati matalala. 

CHORUS:
Sop : 	Tchimo lidzayera
ATB: 	Ngati matalala
Sop: 	Lidzayera
ATB:	Ngati matalala
Sop: 	Lifiire bwanji?
ATB:	Ngati matalala
Sop: 	Tchimo lidzayera,
ATB:	Ngati matalala
Sop 	Lifiire bwanji!
ATB:	Ngati matalala
Sop 	Lidzayera
ATB:	Ngati matalala
ALL:	Ngati matalala lidzayera ngati matalala.
	
2. Kuli bwino kulisiya tchimo, Ndi kusenza mtanda wake
Ndi kutsata Yesu Mbuye, Lidzayera ngati matalala.
''',
      '''1. Ndasiya tchimo langa ine; Ndayamba ulendo.
Ndatenga Yesu Mpulumutsi; Ulendo wa kwaoko.
Ndaliona dziko ine, Dzikoli nlosautsa.

CHORUS:
Sop: 
(Kaya bambo wanga), Mukafuna kutsala mutsale
All : 
Inu, Mukafuna kutsala m’tsale.
Sop: 
(Kaya Mayi wanga) Inu, Mukafuna kutsala musale.
All : 
Ndaliona dziko lino dzikoli nlosautsa.
All : 
Ndaliwona dziko lino dzikoli nlosautsa

2. Dziko lino m'bale wanga Dzikoli nlosautsa.
Kuli imfa, nthenda, njala, Nkhondo, kuusa moyo.
Ndaliona dziko ine; Dzikoli nlosautsa.

3. Nanga iwe m'mbale wanga, Sunasiye tchimolo.
Ukapanda kusiya lero, Udzatsala kumwamba.
Ndaliona dziko ine, Dzikoli nlosautsa.
''',
      '''1. Pokhala ine wochimwa ndinadza kwa Yesu,
Ndinapempha kwa Yesu chikhululukiro;
Anamva pempho langa nalimbikitsane,
Zowawa anachotsa nandipatsa nyimbo.

CHORUS:
Yesuyo anachotsa zolemetsa zanga,
Poyankha mapemphero anandilanditsa.
Mantha'nga anachotsa mzimu nalimbitsa,
Zowawa anachotsa nandipatsa nyimbo.

2. Posweka mtima nsoni ndinapempheratu,
Katundu wa zowawa anali woposa.
Pofuwulira kwa Yesu kwatsala bwanjiko,
Yesu nachotsa vuto nandipatsa nyimbo.

3. Kambiri ndinapeza zovuta njirayi,
Kambiri ndiphinjika ndikhala wofooka.
Ndinamva kunong’ona ndine wa Mbuyeyo,
Zowawa anachotsa nandipatsa nyimbo.
''',
      '''1. Mundichitire ine chifundo
Mulungu wanga m'mwambamo.
Monga mwakukoma mtima kwanu,
Mverani pemphero langa.

CHORUS:
Mufafanize machimo anga,
Mubwereze kunditsukira.
Mphulupulu za machimo anga,
Pa dziko lino lapansi.

2. Mutilengere mtima woyera,
Mulungu wanga wa m’mwamba.
Mukonze mzimu wokhazikika,
Mkati mwa mtima mwangamu.

3. Pamene mzimu umakomoka,
Mkati mwa mtima mwangamu.
Ndinu Ambuye mwandiukitsa,
Imfa ya machimo anga.
''',
      '''1. Ndani afunatu kuonana naye,
Monga Zakeyu anaonana naye.
Adzakupatsani Moyo wosatha,
Moyo wamuyayawo.

CHORUS:
Bass : 	Ndidzalakalaka ine, Ndidzalakalaka ine
SAT: 	Kuonana naye, Kuonana naye
Bass : 	Ndidzalakalakatu ine
SAT:	Kuonana
ALL: 	Naye naye naye Yesu.

2. Ndani afunatu kuonana naye,
Monga Nekodimo anapita kwa Yesu.
Adzakupatsani moyo wakewo,
Moyo wamuyayawo.

3. Ndani afunatu kuonana naye,
Monga Mariya anacheza ndi Yesu.
Iye anasankha dera lokoma,
Lomwe sidzachotsedwa.
''',
      '''1. Mabala a Yesu njira yamtanda,
Anasenza machimo a iwe ndi ine
Yesu aitana’we senza mtanda wake,
Analirira ochimwa m’Getsemane.

CHORUS:
Bwera iwe m’bale Yesu aitanawe;
Bwera iwe m’bale khomo lisanatsekedwe.
Bwera iwe m'bale Yesu aitana inu,
Analirira ochimwa m'Getsemane.

2. Anthu awonongeka, Ena osachimwa,
Bwera iwe Khristu, 'we opanda tchimo’we.
Yesu aitana, 'we samba mwazi Wake,
Analirira ochimwa m'Getsemane.

3. Yesu pamtandapo pa Gologotapo,
Ananena kodi mayi muliriranjiko.
Musalire Ine mudzilire nokha,
Analirira wochimwa m'Getsemane.
''',
      '''1. 
Sop:     Mabelu okoma m'mwamba
All:     Alira m'Ziyoni
Sop:     Kuitana aulendo
All:     Kuti azipita
Sop:     Mabelu okoma m'mwamba
All:     Alira m'Ziyoni
Sop:     Kuitana aulendo
All: 	   Kuti azipita

CHORUS:
Sop:     Mabelu alira, Mabelu alira
ATB:     Ngo-ngo, Ngo-ngo, Ngo-ngo
All:     Atikondweretsa mabeluwo, 
         Atikondweretsa pakuyenda.

2. 
Sop:     Ngati sitisamalira
All:     Tidzatsala tokha
Sop:     Sitidzalowa kumwamba
All:     Chifukwa cha tchimo
Sop: 	   Ngati sitisamalira
All:  	 Tidzatsala tokha
Sop: 	   Sitidzalowa kumwamba
All: 	   Chifukwa cha tchimo

3. 
Sop:     Anthu onse ochimwawo
All: 	   Samayamikatu
Sop: 	   Akonda kunyoza chile
All: 	   Ngedwe cha Mulungu
Sop: 	   Anthu onse ochimwawo
All: 	   Samayamikatu
Sop:     Akonda kunyoza chile 
All:     Ngedwe cha Mulungu
''',
      '''1. Kudzikondweretsa ndi za mdziko nkwachabe, 
Udzitayira chabe nthawi.
Kudzikondweretsa ndi za mdziko nkwachabe, 
Udzitayira chabe nthawi.

CHORUS:
Ten : 
Taya, taya, taya, taya
SAB: 
Ni za mdziko mupeze moyo tu wosatha kuli Yesu
Ten : 
Taya, taya, taya, taya
SAB: 
Ni za mdziko mupeze moyo tu wosatha kuli Yesu
Bass : 
Taya, taya, taya, taya
SAT: 
Ni za mdziko mupeze moyo tu wosatha kuli Yesu
Bass : 
Taya, taya, taya, taya
SAT: 
Ni za mdziko mupeze moyo tu wosatha kuli Yesu

2. Kaduka, imfa, matenda zachuluka, 
Zizindikirotu za Yesu.
Kaduka, imfa, matenda zachuluka, 
Zizindikirotu za Yesu.

3. Aitana Yesu ubwere utembenuke, 
Udzitayira chabe nthawi.
Aitana Yesu ubwere utembenuke, 
Udzitayira chabe nthawi.
''',
      '''1. Uthenga wabwino wotu wonena zachisomo,
Yesu natsika kumwamba, Nadza kundifera 'ne.
Chozizwitsa chikondicho, pakudzichepetsatu,
Ulemu kwa Mlungu m’mwamba, Myamikeni Mfumuyo.

CHORUS:
Sop :             
Uthenga wa mtendere wozizwitsa.
ATB:            
Uthengawo wabwinowo wokondedwa wozizwitsa.
Sop :              
Wokweza ochimwawo kumwamba.
ATB :           
Wokwezatu ochimwawo kunka nawo kumwamba-kumwamba.

2. Ndi mau a Mpulumutsi mokondwa aitana,
Khulupira chifundoke tsata njira ya mmwamba.
Angelo adzalandiranu potha moyo m'dzikoli,
Mu'lemerero wa m'mwamba kopanda imfa uko.
''',
      '''1. Saniueli naitanidwa ndi Mulungu wakumwamba.
Anapita kwa Eli mundiitana ndinu kodi?

CHORUS:
Sop: 	Samueli
All: 	Samueli
Sop: 	Samueli
ATB:	Samueli
All:  Nayitanidwa; nayankha 
      nati ndili pano; 
Bass: Nenani Mbuye
All: 	Kapolo wanu ndili kumva.

2. Samueli naitanidwa kachiwiri ndi Mulungu.
Anapita kwa Eli, mndiitana ndinu kodi?

3. Samueli nayitanidwa kachitatu ndi Mulungu.
Anapita kwa Eli mundiitana ndinu kodi?

4. Choncho ife taitanidwa ndi Mulungu wakumwamba.
Tiyeni timuyankhe kuti ndine pano nditumeni.
''',
      '''1. 
Mfuneni Yehova pomwe akupezeka,

Sop :	Mfuneni Mfuneni.
ATB:	Mfuneni! Mfuneni!
All: 	Mfuneni Yehova pomwe 
	    akupezeka.
Sop: 	Oipa asiye njira yake yoipa,
Bass: Ndi munthu osalungama maganizo
	    ake oipa
Sop: 	Mfuneni, Mfuneni.
ATB: 	Mfuneni! Mfuneni!
All: 	Mfuneni Yehova pomwe 
	    akupezeka.

2. 
Mfuneni Yehova pomwe muli ndi moyo,
Sop: 	Mfuneni! Mfuneni!
ATB: 	Mfuneni! Mfuneni!
All: 	Mfuneni Yehova pomwe
      muli ndi moyo.
Sop :	Ngati muli ndi moyo ino 
      ndi nthawi yabwino.
Bass:	Ngati muli ndi moyo ino 
      ndi nthawi yabwino.
Sop:	Mfuneni! Mfuneni!
ATB: 	Mfuneni! Mfuneni!
All : Mfuneni Yehova pomwe
      muli ndi moyo.

3. 
Bwerera kwa Yehova pomwe Mzimu ayitana.
Sop : 	Bwerera Bwerera.
ATB : 	Bwerera! Bwerera!
All : 	Bwerera kwa Yehova pomwe 
	      Mzimu ayitana.
Sop : 	Ngati uchedwa Mzimu Woyera 
      	adzachoka.
Bass: 	Ngati utaya nthawi Mzimu 
        Woyera adzachoka.
Sop : 	Bwerera, Bwerera.
ATB :  	Bwerera! Bwerera!
All: 	  Bwerera kwa Yehova pomwe 
	      Mzimu ayitana.

LAST CHORUS:
Sop : 	Mfuneni
ATB :	  Mfuneni
Sop : 	Mfuneni
ATB : 	Mfuneni
All: 	  Mfuneni Yehova pomwe 
	      akupezeka
''',
      '''1. Bwerani kwa Yesu lero lino, Kuti mulandire moyo.
Ali wolola kukupatsani, Moyotu wosatha.

CHORUS:
(E moyo) tu-u wosatha, Adzapereka moyo.
(E moyo) tu-u wosatha, Adzapereka moyo.

2. Bwerani kwa Yesu lero lino, Mudzalandire moyo,
Akhale mtsogozi ndi bwenzi lanu, Kuti mulandire moyo.

3. Yenda naye Yesu ponseponse, Kuti mulandire moyo
Mutsukidwe ndi mwazi wa Yesu, Kuti mulandire moyo.
''',
      '''l. Idzanitu tidzayimbe nyimbo ndi Angelo;
Ku mpando wa Yesu, Zinenero zikwi zikwi.

CHORUS:
Bass : 	
Kukondwera kwawo ndi kumodzi modzi
ATB: 	
Kukondwera kwawo ndi kumodzi modzi
All: 
Onse amakondwa.
Bass : 	
Kukondwera kwawo ndi kumodzi modzi
ATB :	
Kukondwera kwawo ndi kumodzi modzi
All : 	
Onse amakondwa.

2. Mwana wankhosa anafa chifukwa cha ife;
Kuti anadzichepetsa mwaulemerero wake.

3. Yesu ali wokhozadi kulandira ife;
Kutidalitsa mwaulemerero wake.

4. Zinthu zonse za kumwamba ndi za padzikoli;
Zinena ulemu kwa Mulungu wa kumwamba.

5. Chilengedwe cha dzikoli chiyang'aniratu;
Kuti chiyamike wakukhalatu pampando.
''',
      '''1. Ndinali osochera kutali-tali, Yesu nandipeza nandiitanane;
Bwera mwana wanga, Tula zako zonse eee pa mtandapo.

CHORUS:
Sop : 
Tchimo langa - latsu-kidwa;
ATB : 
Tchimo langa, tchimo langa, Latsukidwa, latsukidwa;
Sop : 
Pa-mtandapo, wa Yesuyo
ATB : 
Pa-mtandapo, pamtandapo, (wa Yesuyo)

2. Pomva kuitana ndinasiya tchimo, Ndinadza kwa Mbuye nandilandirane;
Bwera mwana wanga, Tula zako zonse, Eee pamtandapo.

3. Kuli malo mmwamba kwa anthu onsewo, Amene avomereza tchimo lao;
Adzalowa mzipata zonyezimira, Eee kumwambako.
''',
      '''1. Tsiku lili kudza tsiku lalikulu, Tsiku lonjenjemeretsa
(Bass: lonjenjemeretsa )
Tidzaona Yesu mwana wa Mulungu ali kudza m'mitambo.

CHORUS:
Bass : 
Adzanena ndi anthu akumanzere Nanga inu,
kodi munali kuti, munkachitanji inu	
AT: 
Adzanena ndi anthu akudzanja la manja	
Sop:
Lowani nonse, Lowani nonse 	
ATB :
Lowani, Lowani, Lowani, Lowani	
All:
M’chikondwerero cha Atate 	

2. Patsiku lomwelo mphezi idzang'anima, 
Lidzakhala loopsa (Bass: loopsa ndithu)
Zonse za pa dziko zidzanjenjemera podzaona akubwera.

3. Mtendere udzatha, Chifundo chidzatha, 
Mfumu idzakalipa (Bass: idzakalipa)
Mfumu idzanena nthawi yakwana idzatseka chitseko.
''',
      '''1. Ndalota nditamva lipenga, La tsiku lo-weru-za-lo;
Mitundu inasonkhani- dwa, Pamaso pa Mfumu m'mwamba.
Ana- bwera m'ngelo wowa-la, Naima pa nyanja mtunda;
Nalumbira poloza m'mwa-mba, Sipadzakha-lanso nthawi.

CHORUS:
Mayo, analiranso "mayo" Pomva za chilango chawo;
Nafuulira kumathanthwe; Pempho anachedwa nalo.

2. Wa-chuma nao-na ndala-ma, Ina-sungunuka yonse;
A-na-li osauka tso-no, Sanathe kudziombola
Wa-nze-ru, wotchuka wa dziko, Nataya ukulu wake
Ange-lo po- yang'ana m'bukhu, Sa-na-pe-ze mbiri yake.

3. Analiponso amasiye, Mulungu nawatonthoza;
Sadza-mva chisoni kumwamba, Mi-so-zi anapukuta.
Na-li-po wa juga, waku-mwa, Wogu-litsa zakumwazo
Ku-li-be nthawi yopemphe-ra! Ko-mabe anafa pompo
''',
      '''1. M'mene ndisanamulandire Yesu, Ndinasowa njira yonka kumwamba;
Koma lero nkhoswe Mzimu Woyera, Wandilozera njira yonka kumwamba.

CHORUS:
Ten: 
Lidzalira
All: 
Lipenga m'mwamba,
Ten: 
Kuitana
All : 
Okondedwa Ake
All : 
Kodi mudzakhala nawo paulendowu, Pena mudzalephera osapita nawo;
M'mene lipenga lidzamveka mlengalenga, Tite, tite, ti-te eee.

2. Odala ofatsa, okhulupirira, Olakika, opirira, odziletsa;
Ndiwo adzakhalanawo paulendowu, Nadzadya masamba a mtengo wamoyo.

3. Chimwemwe podzaona okhulupirira, Akuuluka kupita mlengalengamo;
Kukakumana ndi Mbuye wachisomoyo, Atavekedwa korona wachilungamo.
''',
      '''1. Podzaona mfumuyo ulemelerowo, 
Ndilo tsiku lachigonjetsocho
Podzafika tsidyalo kuli olungamawo, 
Ndilo tsiku Iachigonjetsocho.

CHORUS:
Kudzakhala chigonjetso gonjetso chosatha,
Inde tsiku Iachigonjetsocho (hosanna)
Hosana tidzaimba m'nyumba ya chifumuyo,
Ndilo tsiku Iachigonjetsocho.

2. Poyenda ndi oyera mnjira za chikhuduzo, 
Ndilo tsiku lachigonjetsocho.
Poimba ndi Angelo kudzakhala bwanjiko, 
Ndilo tsiku lachigonjetsocho.

3. Podzatha mavutowo dzalandira kronayo, 
Ndilo tsiku lachigonjetsocho.
Mmene ndidzaimatu pamaso pa Mfumuyo, 
Ndilo tsiku lachigonjetsocho.
''',
      '''1. Ndani akalowe ku Kenani, Khomo Iopapatiza
Ndani akayimbe ku Kenani, Ndi Angelo kumwamba.

CHORUS:
SAT: 	Akalowe
Bass: 	Khomo Iopapatiza
SAT:	Ndi Angelo
Bass 	Khomo Iopapatiza
SAT:	Akayimbe
Bass: 	Khomo Iopapatiza, khomo 
	lopapatiza, lopapatiza
All: 	Ndi Angelo kumwamba

2. Zachisoni m'bale wanga, Tsiku likadzafika.
Kodi iwe udzatani, Ndi Angelo kumwamba.

3. M'bale wanga ganizira, Imfa ya Yesu Mbuye.
Anadza kudzatifera, Kudzatipulumutsa.
''',
      '''l. Kuli buku la moyo kumwamba, Kumpando wa Mulungu;
Komwe oyera mtimawo, Amalembedwamo.

CHORUS:
Sop:
 Kodi dzina langa, Lalembedwa kumwamba?
M'buku lanu la moyo, Kodi lalembedwamo?

ATB: 
Dzina langa, dzina langa, lalembedwa kumwambako,
M’buku la-nu la moyo, kodi lalembedwamo.

2. Odala olapa machimo awo, Ndi kusiyana nawo
Kuti maina awo, Alembedwe m'bukumo.

3. Abale tilape machimo athu, Ndi kusiyana nawo
Kuti maina athu alembedwe m'bukumo.
''',
      '''l. Mudzi wa Sodomu ndi Gomora, Anthu anapsa ndi moto.
Mudzi wa Sodomu ndi Gomora, Anthu anapsa ndi moto.

CHORUS:
Sop : 	Analira. Mayo ine, Mayooo
Analira. Mayo ine, Mayooo
ATB: 	Mayo ine, Mayo ine, Mayo ine,
All : 	Mayo, Mayo ine onse analira.

2. Loti anawauza ana ake, Atuluke mu Sodomu.
Loti anawauza ana ake, Atuluke mu Sodomu.

3. Ana a Loti aja anakana, Kutuluka mu Sodomu.
Ana a Loti aja anakana, Kutuluka mu Sodomu.

4. Pachimaliziro cha dziko lino, Oipa adzapsa ndi moto.
Pachimaliziro cha dziko lino, Oipa adzapsa ndi nunto.
''',
      '''1. Kudzakhala chimwemwe kwa oyera mtimawo;
Kudzakhala chimwemwecho kwa oyera.
Potseguka m'mitambo pakuona Yesuyo;
Ndipo zidzakhala za chimwemwe kwa odikira.

CHORUS:
Bass:       
Tsiku ilo...Ho        
Tidza...Imfa 	      
'Dzaimba...Ale 	     
All:
Ife tidzanena mau
Ife tidzatumpha-tumpha
Tidzalalatira imfa
Mphamvu yako ili kuti
Nyimbo ya Mwana wa Nkhosa
Aleluya aleluya chipulumutso

2. Tidzaona mafumu akuthawa mdzikoli,
Tidzaona eni chuma akulira.
Potseguka m'mitannbo kudzakhala bwanjiko,
Ndipo zidzakhala za chisoni kwa osadikira.
''',
      '''1. Kuli dziko sinaone kapena kulota kokha,
Yesu andikonzera lomangidwira tonsefe.

CHORUS:
Lowalalo la chikondi liunika mumdimamo,
Pagombepo tidzaona kukadzacha mdima nutha.

2. Dzikolo ndi mtendere matenda imfa kulibe,
Zowawa zonse zidzatha, Tidzakondwa nthawi zonse.

3. Pagombe tidzaima Yesu nadzatenga tonse,
Kulowa mu mzinda uja wonyezimira konseko.
''',
      '''1. Alendo ndiifetu mudziko loipali,
Komabe tidziwatu pa mamawa-a-a.
Kupyola mafunde kudzafika tsidyalo,
Tidzakomana tonse pamamawa-a-a.

CHORUS:
Tidzakomanatu pa m'mamawa-a-a, 
Mapiri owala pa mamawa-a-a.
Sitidzalawirana mudziko loipali, 
Tidzawalitsidwatu pa m'mamawa-a-a.

2. Nsinga zomasukadi maso athu owala,
Koma tidzawaladi pam'mamawa.
Chigonjetso chakecho tidzavala chosafa,
Tidzadziwana tonse pa m'mamawa.

3. Miyoyo yathu idzapuma patsidya lanyanjalo
Tidzamva mau Ake pa m’mamawa.
Potula mitoloyo pa mapazi a Yesu,
Tidzaimba mingoli pa m’mamawa.
''',
      '''1. Tatanganidwa ndi za m'dziko, Matenda ndi imfa.
Koma Yesu aa tiuza, Tidza- gonjetsa imfa.

CHORUS:
Matenda adzagonja (mwamba) Imfa idzagonja (ndithu)
N'dzakhala ndi Yesu, Mbuye imfa idzagonja.

2. Owomboledwa adzakondwa, Kukhala ndi Yesu.
Adzakhala wokondwa muyaya, Imfa idzagonja.

3. Pobwera Mpulu-mutsiyo, Manda adzatseguka
Oyera mtima adzauka, Imfa idzagonja.

Last CHORUS:
Matenda adzagonja (mwamba) Imfa idzagonja (ndithu)
N'dzakhala ndi Yesu Mbuye Imfa idzagonja.
''',
      '''1. Omangidwa'we ndi tchimo, Yesu dzamasulawe (masulawe)
Omangidwa’we ndi tchimo, Yesu dzamasulawe (masulawe)

CHORUS:
Sop: 
Ee ndidziwa, Ee ndidziwa	
ATB : 
Ee ndidziwa, Ee ndidziwa	
All : 
Yesu angandimasule inenso (masule inenso)	

2. Namasula ena kale, Angamasulenso’we (masulewe)
Namasula ena kale, Angamasulenso'we (masulewe)

3. Pofooka apatsa mphamvu, Matenda achiritsa (achiritsa)
Pofooka apatsa mphamvu, Matenda achiritsa (achiritsa)
''',
      '''l. Pochoka mu Aiguputomo; M'lungu anawauza;
Mupake mwazi pakhoma; Ndidzapitirira.

CHORUS:
Anali mau a M'lungu, Omwe ananena.
Mupake mwazi pakhoma, Ndidzapitirira.

2. Khristu Mwana wankhosa, Nakhetsa mwazike;
Kukwaniritsa pangano, La M'lungu wamoyo.

3. Mulungu satimanafe, Chipulumutsoke;
Apatsa kwauleretu, Kutiyeretsa'fe.

4. Chisomo natichitira, Sititsitsidwafe;
Pokhetsa mwazi Yesuyo, Walipa dipolo.

5. Patsiku loweruzalo, Adzakondweratu;
Okhulupira, Mwazi wa Ambuye wathuyo.
''',
      '''1. Aisrayeli poyenda mchipululu, Analumidwa ndi njoka.
Ndipo Mulungu anamuuza Mose, Apange njoka ya mkuwa.

CHORUS:
Omwe ana-yang'ana pa njoka ya mkuwa,
Anapeza moyo (moyo nachiradi)
Omwe ana-yang’ana pa njoka ya mkuwa, Anapeza moyo.

2. Aisrayeli anakumbukira mabvwembe kwa Farao.
Namuuza Mose kuti tibwerere, Anyezi kwa Farao.

3. Yesu aitana tidze kwa Iye, Tikalandire moyo
Tikayang'ana pa mtanda wa Yesu, Tidzapezapo moyo.

LAST CHORUS:
Ife tika-yang'ana pa mtanda wa Yesu, Tidzapeza moyo
Tidzapeza moyo (moyo wamuyaya)
Ife tika-yang'ana pa mtanda wa Yesu, Tidzapeza moyo.
''',
      '''1. Angelo oyerawo, Apita ponse ponse;
Kuwachitira anthu ntchito za chifundozo;
I-wo a-madza kuti-chitiratu zabwinozo.

CHORUS:
Sop : 
Ali ----- kudza—imva angelo adza ndi nyimbo zokorna
Ali ----- kudza—imva ali kudza nayimba
ATB: 
Kodi sumva mngelo mphiri ndi mdarnbo
Imva Angelo adza ndi nyimbo zokoma
Kodi sumva mngelo kwao kumwamba
Imva ali kudza nayimba.

2. Angelo oyerawo ndi Mzimu Woyerawo;
Atitetezerafe, tikhale mchilungamo;
I-wo a-madza kuti-kumbutsa zolungamazo.

3. Angelo oyerawo alemba nthawi zonse;
Ntchito zomwe tichita ife tsiku ndi tsiku;
Kodi m'balewe alembanji pantchito zakozo.

4. Angelo woyerawo akondwa nthawi zonse;
Pochitira umboni ntchito zolungannazo;
Iwo amamvatu chisoni ndi uchimowo.
''',
      '''1. Chipulumutso chathu chayandika, Padziko loipali.
Pulumukatu nthawi yako yatha, Moyo wako wathanso.

CHORUS:
Sop : 
Inetu sindili ndekha, Inetu sindili ndekha;
ATB: 
Ndaomboledwa, Ndaomboledwa, Ndaomboledwa ;
Sop : 
Komatu nyanja ndi dziko, Zonsetu zaomboledwa.
ATB: 
Nyanja ndi dziko zawomboledwa, Zonsetu zaomboledwa.

2. Lero lomwe wina wapulumuka, Kodi kapena ndiwe.
Kodi uchedweranji kuvomera, Poyitana Mbuyeyo.

3. Nanga ife chiyang'aniro chathu, Padziko loipali
Yesu ali kulindira tonsefe, Kuti tipulumuke.
''',
      '''1.
SA:
Kuli nthano yonena kwa onse Kuti atembenuke mtima
All: 	
Tili kuyimba nthano yomwe-yo
Sop: 	
Mverani nthano yozizwitsa
ATB: 	
Nthano
All: 	
Ya Yesu Mbuye
ATB:	
Mvani
Sop: 	
Iye anafa pansi pano
ATB:	
Mvani
All: 	
Kutipulumutsa'fe
Bass: 	
Mvani
Sop : 	
Ndani anatiombola
All: 	
Mwana wa Mlungu pa mtanda
Sop: 	
Anatani
ATB:	
Anafera
Sop: 	
Alikuti
ATB:	
Akhaladi
All: 	
Mmwamba kutipembedzera.
SA: 	
Yimba ka-wi-ri, Ndikawirinso
TB: 	
Yimba yimbatu, Ndikawirinso
SA: 	
Yesu Ambuye, Sakanatu
TB: 	
E Ambuyetu, E Sakanatu
SA: 	
Mvetsa uthenga, Wabwinowo
TB: 	
Mvetsa Mvetsadi, E wabwinowo
All: 	
Wakuchimwa, adzetu

2.

SA:	
Kuli nthano yonena kwa onse Kuti atembenuke mtima
All: 	
Tili kuyimba nthano yomwe-yo
Sop: 
Chikondi, Chake cha Mlungu
All: 	
Nthano
Sop: 	
Chotikondweretsafe
TB: 	
Mvani
Sop: 	
Kutipatsa Mwana wake,
Bass: 	
Mvani
SA: 	
Kutiombola ife
All: 	
Mvani

3.
SA:	
Kuli nthano yonena kwa onse Kuti atembenuke mtima
All: 	
Tili kuyimba nthano yomwe-yo
Sop: 	
Nonse fulumirani lero,
ATB: 	
Nthano
Sop: 	
Kulandira Mplumutsi
TB: 	
Mvani
Sop: 	
Musachedwe ndi zapadziko
Bass: 	
Mvani
Sop: 	
Zokutayani m’moto
All: 	
Mvani
''',
      '''1. 
Sop: 
Anagwa ndi mtanda
All : 
Ambuye Yesu, Sikulemera kwa mtanda koma ndi machimo.

CHORUS:
Bass: 
Sikulemera kwa mtanda, Sikulemera kwa mtanda;
All : 
Ai Sikulemera kwa mta-nda, Sikulemera kwa mta-nda;
Sikulemera kwa mtanda koma ndi machimo.

2. 
Sop: 
Mtima wake unasweka
All : 
Ndikukomoka, Analira misozi chifukwa cha ife.

3. 
Sop : 
Analasidwa mthiti
All : 
Ambuye Yesu, Anafadi pa mtanda chifukwa cha ife.
''',
      '''1. Namanga manja Mbuye m'munda popemphera,
Natsogoza mwamanyazi, Nathiramate Yesu opanda uchimo, Nafuula mpachikeni.

CHORUS:
Sop : 
Akadatsitsa, Kuotcha dziko, Kutiombola, Ndinso Mbuyeyo
Akadatsitsa, Kuotcha dziko, Kutiombola, Iwe ndi ‘ne.	
ATB : 
Zikwi khumi za Angelo, Ndinso Mbuyeyo
Zikwi khumi za Angelo, Anafera iwe ndi 'ne	 



2. Namveka minga mutu nanseka pojeda, Onani mfumu ya Ayuda;
Namenya ndi ku mnyoza dzina loyeralo, Anatonzedwatu Mbuye.

3. Sanayankhe kanthu sanadandaule, Nasenza mtanda wa m'nyozo;
Polira zonse zatha Yesu nafuula, Kupulumutsa tonsefe.
''',
      '''l. 
Sop : 
Yesu adza msanga posachedwatu;
All : 
Aleluya, Aleluya
Sop : 
Adza ndi ulemerero ndi mphamvu.
All : 
Kudzakhala m'bandakucha pakubwera Mbuyeyo.

CHORUS:
Aleluya (Alelu) Aleluya (Alelu)
Akufa mwa Ambuye adzakwatulidwatu.
Aleluya (Alelu) Aleluya (Alelu)
Kudzakhala m bandakucha pakubwera Mbuyeyo.

2. 
Sop : 
Adza ndi Angelo mlenga- lengamo;
All : 
Aleluya, aleluya!
Sop : 
Pena pausiku pena m'mamawa.
All : 
Kudzakhala m banda kucha pakubwera Mbuyeyo.

3. 
Sop : 
Kulibe misozi pakubwera'ye;
All : 
Aleluya, aleluya!
Sop : 
Tidzakondwa tonse nthawi zonsezo.
All : 
Kudzakhala m'banda kucha pakubwera Mbuyeyo.

4. 
Sop : 
Msanga- tidzaona okondedwawo;
All : 
Aleluya, aleluya!
Sop : 
Tidzaimba nyimbo nthawi zonsezo.
All : 
Kudzakhala m'banda kucha pakubwera Mbuyeyo.
''',
      '''1. Taonani ndidza msanga, Ambuye anena;
Ndipo mphotho ndili nayo, Yakupatsa yense.
Olungama alungame, Ochimwa achimwebe;
Mphotho yawo ili kubwera.

CHORUS:
Akutsika, Akutsika, Akutsika mmwamba;
Akubwera, Akubwera Mbuye posachedwa.
Akutsika, Akutsika, Akutsika mmwamba;
Kodi m’bale wakonzeka?

2. Mudzaona zizindikiro, Ambuye anena;
Zowopsa zidzakula mmasiku otsiriza
Nkhondo, njala imfa, nthenda maudani ponse ponse;
Dziwani masiku otsiriza.

3. Konza mtima wako lero, Ambuye anena
Lapa lero khomo m'mwamba lisanatsekedwe
‘Sadzalire usadzathawe pakumuona Mbuye
Akutsika kuchoka m’mitambo.
''',
      '''1. Nenani za chikondi chake, Za chikondi cha Yesuvo.
Imva ali kuitana, Dziko lonse limvetu.

CHORUS:
Nenani za chikondi cha Yesu, Mlemekezeni ponsepo;
Nenani za chikondi chake, Dziko lonse limvetu.

2. Lalika lalikani uthenga, Za Mulungu wa kumwamba.
Imva ali kuitana, Dziko lonse limvetu.

3. Imvani za Mulungu wathu, Za Mulungu wakumwamba.
Imva ali kuitana, Dziko lonse limvetu.
''',
      '''1. Pali bwenzi loposa onse, Bwenzi lokonda;
Amatisamalire ife, Bwenzi lake ndi Yesu.

CHORUS:
Msaiwale Yesu, Bwenzi lokonda
Nkana mavuto angaopse, Bwenzi lake ndi Yesu.

2. Ndilakalaka kumuona, Bwenzi lokonda;
Mmene adzadza mu mitambo, Ndzaona nkhope Yake.

3. M'mene moyowu ukadzatha, Ndzaikidwatu;
Koma ndiyembekezerabe, Adza kudzanditenga.
''',
      '''l. Machimo anga analipo ndithu, Ambiri osaneneka.
Ndikondwa kuti Yesu momboloyo wawabisa pansi-pansi.

CHORUS:
Bass:   Pansi-pansi
SAT:   Pansi-pansi
Bass:   Pansi-pansi
All :    Pansi Pansi pa nyanja
All : 
Tchimo langa linabisika pansi-pansi, Pansi pa nyanja.
Tchimo langa linabisika pansi-pansi, Pansi pa nyanja.

2. Chikondi cha Yesu nchakuya ndithu, Anachotsa tchimo langa.
Potenga ndikubisa tchimo langa, Pansi-pansi pa nyanja.

3. Mumtima mwanga munalitu nkhawa, Chifukwa cha tchimo langa.
Ndakondwa kuti Yesu Momboloyo, Wawabisa pansi-pansi.
''',
      '''1. Chikondi cha Mulungu wathu, Choposa zonse m’dzikoli
N'chotalikira ngati nthanda, Chifika pansi panotu.
Makolo athu atachimwa, Mulungu nakondabe;
Anatumiza mwana wake kudzaombola ife.

CHORUS:
Chikondi chake nchachikulu, Changwiro ndi cha mphamvu;
Chidzakhalitsa nthawi zonse, Oyera dzaimbabe.

2. Ngakhale anthu angalembe, Usana ndi usikunso;
Chikondi chake pamasamba onse m'dzikoli.
Masamba onse akanatha, Asanalembe zonse;
Za Mulungu wathu ndi chikondi pa anthu ake onse.
''',
      '''1. Taonani chikondicho Atate apatsa,
Kwa ife anthu ochimwa titchedwe anake.
CHORUS:

Sop : 
Tao-nani chikondi, Chikondi icho Atate watipatsa ife,
Kuti titchedwe ife ana ake a Mlungu
	
ATB: 
Taonani chikondi, Taonani chikondi, Chikondi icho, Atate watipatsa ife;
Kuti titchedwe ife, Kuti titchedwe ife, Ana Ake a Mlungu.	

2. Ndi mwazi wake pa mtanda taomboledwatu,
Tsopano pamtanda wake talandiridwatu.

3. Tidzakhala ofanana ndi lye tidziwa,
Podzaoneka Iyeyo pa thambo lam'mwamba.

4. Ndipo yense wakukhala nacho chiyembekezo,
Adzikanize yekhayo monga anatero
''',
      '''1. Duwa lopambana ndinu Yesuyo,
Mtimanga mutuwe duwa labwino.
Mundipatulene monga Inuyo,
Kuti ndionetsere Inu m'dzikoli.

CHORUS:
Duwa (lopambana) lopambana (lopambana)
Yesu mutuwe m'kati mtima mwangamo.

2. Mundikodweretsa kopambanatu,
Duwa lililonse la pa dzikoli
Yesu mundidzaze m'moyo wangawu,
Tsiku ndi tsiku ndi chisomo chanucho.

3. Wochiritsa ndinu nthenda zonsezi,
Mphamvu yanu ifikire tonsefe
Monga fungo la maluwa abwino,
Likondweretsa akutopa njiramo.

4. Yesu mupambana m'dziko lonseli,
Mukhalitse m’maganizo athuwo.
Tikuyamikani Mfumu yathunu
Ulemelero ngwanu nthawi zonsezo
''',
      '''1. Tipembedze Mulu- ngu wa mphamvu,
Ndi mauke, nalenga zonse.
Timleme-ke-ze, tikweze dzinalo,
Ndi muumbi, ndife dongo.

CHORUS:
M'manja mwa oumba tikhale (Tikhale)
M'ntchito Yake tikhale (Tikhale)
Tigwire-ndikumvera'ye, 
Ndife dongo, m'manja mwake.

2. M'manja mwa muumbi muli mtendere,
Dzatiumba, tikhale oyera.
Ndi Mzimu Wo- ye- ra dzapangafe,
Kuti tikonde ntchito Yake.

3. Mitundu yo-nse yigwadi-re,
Mfumu ya mafumu ndiye.
Anafera to-nse- fe pamtandapo- o,
Abweranso kudzatitenga.
''',
      '''1. Mveke mveke Mfumu yathuyo (Unison)
Timuyimbire nthawi zonsezo.
Matamando athu onsewo (Unison)
Awalandiradi.

CHORUS:
Sop : 
Mumveketu Mumveketu	
ATB: 
Mveke mveke mveke mveke	 
All: 
Mfumu yaulemererowo
Sop: 
Mveke, Mveke	

ATB: 
Mveke, Mveke, Mveke, Mveke	
All: 
Ku nthawi zosatha.	

2. Wagonjetsa machimo onse (Unison)
Mitima yathu alamulire.
M'dzina lake tidzapambana (Unison)
Mveke nthawi zones.

3. Myamikeni angelo mmwamba (Unison)
Kumpandoke zeze amveke
Dziko lonse mogwirizana (Unison)
Mveke nthawi zonse
''',
      '''1. Mwandibweza ku ndende kuti ndiwone Inu.
Mwandibweza ku imfa kuti ndikweze Inu.

CHORUS:
Sop: 
Mukwezeke!
All : 
Mumavuto, mu mtendere mukwezeke;
Ndipemphera kuti Mbuye nditsike ine;
Mukwezeke Mbuye Yesu nditsike ine.

2. Mwandipatsa banja kuti ndiwone Inu.
Mwandipatsa ana kuti ndikweze Inu.

3. Mwandipatsa moyo kuti ndiwone Inu.
Mwandipatsa chuma kuti ndikweze Inu.

4. Wodzikweza yekha Inu mudzamutsitsa.
Wodzitsitsa yekha Inu mudzamukweza.
''',
      '''l. Yesu ndi wa chikhalire, Ochimwa chita manyazi;
Manyazi ndi Yesu yemwe, Angelo amlemekeza.

CHORUS:

SAT: 
Osachita manyazi ndi Yesu iyayi	
Bass : 
Manyazi ndi Yesu iyayi	
SAT: 
Osachita manyazi ndi Yesu, Bwenzi langa.	
Bass : 
Manyazi ndi Yesu Bwenzi langa.	

2. Kuchita naye manyazi, Yesu bwenzi la ochimwa;
Amene chiyembekezo, Cha kumwamba chaimira.

3. Ndingachitetu manyazi, Ngati tchimo lilipobe;
Ngati misonzi sinaphwe, Ngati sinaomboledwe.

4. Ndili okondwa mtimanga, kuti Yesu ali nane
Podziwa kuli Mbuyanga, Sachita nane manyazi.
''',
      '''1. M'yamikeni Yehova, M'yamikeni Yehova.
Analenga zonse ndi mau Ake, Muyamikeni Yehova.
Analenga zonse ndi mau Ake, Muyamikeni Yehova.

2. Muimbireni Yehova, Muimbireni Yehova.
Ndi nyimbo zomtama kumlemekeza, Muimbireni Yehova,
Ndi nyimbo zomtama kumlemekeza, Muimbireni Yehova.

3. Kwezanitu dzina lake, Kwezanitu dzina lake.
Ndi Mlengi wa dzuwa, mwezi, nyenyezi kwezanitu dzina lake.
Ndi Mlengi wa dzuwa, mwezi, nyenyezi kwezanitu dzina lake.

4. Gwadani pa maso pake, Gwadani pa maso pake.
Pomlemekeza Yehova wamkulu, Gwadani pa mase pake.
Pomlemekeza Yehova wamkulu, Gwadani pa lilaso pake.
''',
      '''1. Akhristu tionetsere, Zipatso za Mzimu Woyera.
Akhristu tionetseredi, Zipatso za Mzimu Woyera.

CHORUS:
Chikondi, chimwemwe, mtenderewo
Kuleza mtima chifundo-o-o
Kukoma mtima, chikhulupiriro, Ndi chifatso ndi chiyero.
Kukoma mtima, chikhulupiriro, Ndi chifatso ndi chiyero.

2. Akhristu tichite nazo, Zipatso za Mzimu woyera.
Akhristu tichite nazodi, Zipatso za Mzimu woyera.

3. Tidzapindula miyoyo, Pochita ndi Mzimu Woyera
Tidzapinduladi miyoyo, Pochita ndi Mzimu Woyera
''',
      '''1. Zokoma za dziko lino zafika popyoza msinkhu;
Popanda kuchilimika Za dziko zitigonjetsa.
Tiime nji pa thanthwelo nkana namondwe aombe;
M'mamawa, masana, madzulowo ndi Yesu tidzayenda.

CHORUS:
Sop: 
Usacheuke wona Yesuyo, patsidya la Nyanja.
Leka zachabe upulumuke, m'mamawa, masana,
Madzulowo ndi Yesu tidzayenda.
Alto: 
Manzere ai pena kumanja, ona Yesu
Akodolawe patsidya la Nyanja, Miseche leka, Mabodza ai upulumuke
Pemphera, pemphera, pempherolo, Ndi Yesu tidzayenda
Bass: 
Dorika kucheuka cheuka ai,
Ona Yesu akodolawe patsidya la Nyanja.
Misecheyo mabodza ai upulumuke,
Pemphera, pemphera, pempherolo, Ndi Yesu tidzayenda.

2. Satana mdani wamkulu ayendayenda m'dzikoli;
Afuna kugwetsa anthu ndi okhulupira omwe.
Yesu mwini akunena owerenga khala maso;
M'mamawa, masana, madzulo ndi Yesu tidzayenda.

3. Ulosi utikumbutsa za masiku otsiriza;
Mpingo udzagawanika anthu dzagwetsedwa mphwayi.
Nyengo yakupeta yafika limba;
Yang'ana mtsogolo, Nyimbo yachigonjetsoyo.
''',
      '''1. Ulendo wa Chikhristu ngosautsa ndithu;
Mavuto mayesero adza kwa ine.
Ndithawire kuti ngati mwanditaya;
Limbitsani mtima wanga ndipirire.

CHORUS:
Sop: 
Ndine wanu Ambuyanga
All: 
Mavuto mayesero adza kwa ine
Ndithawire kuti ngati mwanditaya,
Limbitsani mtima wanga ndipirire.

2. Chifukwa cha dzina lanu ndanyozedwa ine;
Adani achuluka ndachepa ine,
Ndiwakonda onse koma andisautsa;
Limbitsani mtima wanga ndipirire.
''',
      '''1. Pitani kudziko, Mukalalikire uthenga wa Mlungu;
Wosatha-a omwe amva mau, ndikuvomereza, Adzalandiratu korona.

CHORUS:
Lali-kani madambo, mtunda Nyanja,
Mukawauze kuti nthawi yatha,
Lali-kani Yesu akubwera, akubwera posachedwa.

2. Onani maiko, Akuukirana kusonyeza kutha kwa nthawi-i.
Omwe amva mau, Ndikuvomereza, Yemwe ali ndi khutu amve.

3. Njala ndi matenda, Ndizivomerezi zisonyeza kutha kwa nthawi-i.
Kodi wakonzeka kukumana Naye, Ndikukhala Naye muyaya.
''',
      '''1. Ndili mwana wakeyo ndamasulidwa'netu
(Bass: ndilitu -mu) ndilitu-mu mtenderewo, mtenderewo
lye anatiombola muzinsinga zamdani
(Ndilitu-mu) ndili mumtendere ndi Yesu

CHORUS:
Ndilitu-mu (ndili-tu)
Mtenderewo (mtenderewo)
(Ndichitetu) chifuniro'ke ndichite chifuniro'ke
(Bass: Ambuye mpempha kuti) ndiyeretu mbuu
Ndatsukidwa ndi mwazi ndilitu-mu
Ndili mumtendere ndi Yesu Ambuyeyo

2. Ndikondwera mwa Yesu ndikuyimba mingoli
(Bass: ndilitu -mu) ndilitu-mu mtenderewo, mtenderewo
Iye anatiombola kuzinsinga za m'dani,
Ndilitu-mu) ndili mumtendere ndi Yesu

3. Tiyeni tonse tiyimbe mokondwera ndi Mbuye
(Bass: ndilitu -mu) ndilitu-mu (mtenderewo) mtenderewo
Iye nadzipereka kutsika ndi mwazi
Ndilitu-mu) ndili mumtendere ndi Yesu
''',
      '''1. Thawa pulumutsa moyo
Moyo wako (Moyo wako)
Moyo wako (Moyo wako)
Thawa pulumutsa moyo

CHORUS:
Ukathawira kwa Yesu, Udzapeza moyo (moyo)
Moyo, moyo, moyotu wosatha.
Ukathawira kwa Yesu, Udzapeza moyo (moyo)
Moyo, moyo, moyotu wosatha (moyo).

2. Thawa pulumutsa moyo
Moyo wako (moyo wako)
Moyo wako (moyo wako)
Yesu ndiye Thanthwelo

3. Yesu aitana iwe
Bwera kwa'ye (Bwera kwa'ye)
Bwera kwa'ye (Bwera kwa'ye)
Udzalandira moyo
''',
      '''1. Chikondi cha Mulungu wathu, Chili chopambana ndithu.
Chinaonekera kalelo, Pa mtanda wa Gologota.

CHORUS:
Bass: 
Chikondi
All : 
Chili choposa zonsenzo, Chikondi cha Mbuye, chili choposadi
Bass: 
Chikondi
All : 
Chili choposa zonsezo
Bass: 
Chikondi
All : 
Chikondi cha Mbuyeyo

2. Chikondi cha Mulungu wathu, Chili chopambana ndithu.
Nanyamula mtanda wakewo, Nagwa nawo katatu.

3. Amayi a Galileya, Namlirira Mbuye wao.
Ponkhomera misomaliyo, M'manja ndi m'mapazimo

4. Chikondi cha Mlungu wathu, Chili chopambana ndithu
Atikonzera'fe malowo, Tikakhale m'mwambamo.
''',
      '''1. Ndimchitirenji, Mpulumutsi,
Kodi ndimu-konde bwanji?
Wandimasula muukapolo,
Kodi ndimu-konde bwanji?

CHORUS:
Ichi ndicho, m'chitire Mbuye
Kusonyeza kumkonda Iye
Kulalika, chikondi chake
Kutsata mapazi Ake (mapazi Ake)

2. Ndimchitirenji Mpulumutsi,
Kodi ndimu-konde bwanji?
Wanditulutsa, mdzenje la imfa
Kodi ndimu-konde bwanji?

3. Ndimchitirenji Mpulumutsi,
Kodi ndimu-konde bwanji?
Wandimasula msinga za imfa,
Kodi ndimu-konde bwanji?
''',
      '''1. 
Bass: Palitu mudzi wabwino
All:  Pa-li-mu-dzi wa-bwi-no
Bass: Misewu ya-golidinso
All:  Mi-se-wu ya-golidi
Bass: Kumene akhalitsanso
All:  Ku-me-ne a-kha-li-tsa-nso
Bass: Oyera ndi Mulunguyo
All:  O-ye-ra ndi Mulunguyo

CHORUS:
SA:    Kumzindawo, woyerawo
TB:    Kumzinda woyerawo,
Alt:   Womangidwa
All:   Mangidwa
Tenor: Ndi miyalayo
All:   Miyalayo
Sop:   Makomawo nyezimanso
All:   Makoma— nyezima tidzakhala nthawi zonse

2. 
Bass: Mudziwo unamangidwa
All: 	Mu-dzi-u-na-ma-ngi-dwa
Bass: Pa thanthwelo lolimbalo
All: 	Pa-tha-nthwe-lo-li-mba-lo
Bass: Maziko ndi olimbanso
All: 	Ma-zi-ko, ndi-o-li-mba-nso
Bass: Ndzaima nthawi zonsezo
All: 	Ndzaima nthawi zonsezo

3. 
Bass: Njirayo njoongokadi
All: 	Nji-ra-yo-njo-o-ngo-ka-di
Bass: Yolowa mu mzinda uja
All: 	Yo-lo-wa-mu-mzi-nda-u-ja
Bass: Zipata nzotsegukanso
All: 	Zi-pa-ta-nzo-tse-gu-ka-nso
Bass: Wochimwa lowa msangatu
All: 	Wo-chi-mwa lowa-msa-nga-tu
''',
      '''1. Mmene Mbuye adzatu m’dzikomu,
Kudzatenga oyera m'dzikomo;
Tonse tidzakomana mu Ideni,
Zitatha zovuta n'dzalowa mzindawo.

CHORUS:
Mu ideni-mu ideni (tidzakomana) Mu, ideni- mu Ideni
(tidzakomana) Tonse, tidzakomana mu Ideni zitatha Zovuta,
n'dzalowa mzindawo.

2. M'mene angelo ayimba mingoli (mingoli)
Kuyimbira woyera mzindawo,
Tonse tidzakomana mu Ideni zitatha, Zovuta n'dzalowa mzindawo.

3. M'mene angelo ayimba mingoli (mingoli),
Kuyimbira woyera mzindawo
Tonse tidzakondwera popita kwathuko, Kumzinda woyera kumwamba.
''',
      '''1. Poyang'ana kwathu, Ndiona mapiri;
Kwathu kokongola, Mavuto kulibe;
Dziko ndikhalamo landisautsadi,
Ndipite ndikapumule.

CHORUS:
Moyo wanga konzeka, Pokwera mapiri;
Zovuta zambiri, Pa ulendowu
Dziwa suli wekha, Angelo alipo;
Ndipite ndikapumule.

2. Poganiza kwathu, Mtima uwawadi;
Chuma cha m'dzikoli, Ndachisiya chonse;
Kwathu kwabwinoko, Zonse nkazipeza,
Ndipite ndikapumule.

CHORUS:
Moyo wanga pirira, Pokwera mapiri;
Zovuta zambiri, Pa ulendowu.
Dziwa suli wekha, Angelo alipo;
Ndipite ndikapumule.

3. Poyandika kwathu chigwa chioneka;
Posakhalane ndilowa mzindawo, Chuma chosaneneka;
Moyo wamuyaya, Ndipite ndikapumule,

CHORUS:
Moyo wanga sekera, Potsika nnapiri;
Zovuta zambiri, Pa ulendovvu;
Tayandikira Madzulo
''',
      '''1. Tayandikira madzulo, Dzuwa likulowatu;
Posachedwa udza mdima, Pompo tsiku lipita.
Potha nthawi zonse zatha, Ndi mitundu yathanso;
Tionatu m’banda kuchaaa, Tayandikira kwathu.

CHORUS:
Sop:
Tayandi - kiratu, kwathuko kokongola;
Kwa kasupe ndi kwa nsipu; Kuseri kwa mitambo.

ATB: 
Tayandi- Kwathu m'mwamba; Kwathuko kokongola;
Kwa kasupe ndi kwa nsipu, Kwa kasupe ndi kwa nsipu,
Kuseri kwa mitambo Kokongola.

2. Aulendo otopawo, Dzuwa liwalowera;
Komabe ulendo wawo uli pafupi kutha.
Choncho ife moyo uno, M'mene tilemetsedwa;
Tionatu mbanda kucha, Tayandikira kwathu.

3. Latsala tsiku limodzi, Kuti tifike kwathu;
Kuli msipu ndi kasupe, Kuseri kwa mitambo.
Timva kuimba kwa nyimbo, Za angelo a m'mwamba;
Tiona kuwala kwake, Tayandikira Madzulo
''',
      '''1. Pali malo (pali malo), Ena ake (ena ake)
Ndalephera kufikako, (kufikako)
Koma ine (koma ine) ndidziwadi (ndidziwadi)
Zoonadi Mbuye wanga alipo (alipo)

CHORUS:
Mbuye wanga (Mbuye wanga),
Ngoonadi (ee ngoonadi).
Anatsuka machimo anga ndi mwazi (ndi mwazi);
Chikondi chake (Chikondike),
Ncha golidi (cha golidi).
Zoonadi Mbuye wanga alipo (ee alipo).

2. Ena ama (ena ama) kaika (kaika),
Amanyoza ndi kuzemba (ndikuzemba).
Koma ine (koma ine) ndidziwadi (ndidziwadi),
Mbuye wanga ngwa muyaya alipo (ee alipo).

3. Kodi inu (kodi inu) ndi inenso (ndi inenso),
Tamulandira Yesu Khristu (Yesu Khristu).
Anatifera (natifera) pamtandapo (pamtandapo),
Zoonadi Mbuye wanga alipo (ee alipo).

''',
      '''1. Ndinalitu mfulu ine,
Woyenda ndi Mlengi wanga.
Koma Satana nalekanitsa,
Ndi Mlengi wangatu ine.

CHORUS:
Sop: Ndi-  All: bwerera
Sop: Kwa 	 All: Atate
Akandiveke mwinjiro, Nsapato mapazi anga, Mphete nchala;
Nandilandira pa phwando, Ndibwerera kwa atate.

2. Ndinalitu mfumu ine,
Woyenda ndi abwenziwo.
Koma Satana nalekanitsa
Ndatsala ndekhatu ine.

3. Chakudya cha nkhumba ichi,
Ndatopa nachotu ine.
Koma antchito atate anga,
Akudya zonona ndithu.
''',
      '''1. Ndikupempha kuti Mbuye ndifanane ndi Inu,
Ndikupempha kuti Mzimu wanu udze pa ine.

CHORUS:
Mudziwa kufooka kwanga, Mudziwa nkhawa zangaa,
M’mene ndili kupemphera, Mbuye muyankhe pempho.

2. Ndikupempha mundipatse chikhulupirirocho,
Kuti kuwala kwanu kudze ndione nkhope yanu.

3. Ndikupempha kuti moyo wanga udzichepetse,
Mundiveke ndi chifatso ntchito yanu ndigwire.

4. Ndikupempha Mbuye lero ndipo ndidzapemphabe
Kuti moyo wanga wonse ukhale m’manja mwanu.
''',
      '''1. Sindifuna kufa monga Felike,
Sindifuna kufa monga Felike,
Yemwe anamva uthenga,
Osatembenuka, Sindifuna kufa monga Felike.

CHORUS:
(Felike) Felike ananena (Anati) Bwerani mawa 
(Ambuye) Ambuye anakana 
(Kuti) Nthawi yanga yatha (Chisoni) Felike analira
Moyo wake nuzunzika, Sindifuna kufa monga Felike.

2. Amai musafe monga Felike,
Amai musafe monga Felike,
Yemwe anamva uthenga,
Osatembenuka, Sindifuna kufa monga Felike.

3. Abambo musafe monga Felike
Abambo musafe monga Felike,
Yemwe anamva uthenga,
Osatembenuka, Sindifuna kufa monga Felike.
''',
      '''1. Papatizanibe pa chipata chaching'ono
Papatizanibe kuti mukalowe,
Papatizanibe pa chipata chaching'ono,
Papatizanibe kuti mukalowe.

CHORUS:
Siya tchimo kuti Upapatize,
Siya tchimo kuti upapatize,
Siya! Tchimo — upapatize,
Pachipata chopita kumwamba.

2. Papatizanibe pa chipata chaching’ono,
Kuleka za m' dziko kuti mukalowe.
Papatizanibe pa chipata chaching'ono,
Kuleka za m' dziko kuti mukalowe.

3. Papatizanibe pa chipata chaching'ono,
Kodi mwakonzeka kuti mukalowe?
Papatizanibe pa chipata chaching’ono,
Kodi mwakonzeka kuti mukalowe?
''',
      '''1. Moyo ngosakhalitsa, Monga kugwa kwa tsamba,
Monga kugwa kwa mame kangaza.
Masiku akupita imfa ibwera nsanga,
Chingwe chisanaduke kangaza.

CHORUS:
Kangaza kangaza, Kangazatu kangazatu,
M'mene Yesu aitana kangaza (kangaza).
Ukachedwa m’zoipa, Khomo lidzatsekedwa,
Kulira sadzakumva kangaza.

2. Duwa ligwa niliwola, Kukongola kupita,
Iwe sudzakhalitsa kangaza.
Mzimu ukuitana wochimwawe,
Ungadzatsale kunja kangaza.

3. Nthawi ifulumira, Imfa ndi chiweruzo,
Igwa m'manja a Yesu kangaza.
Ine ndipempha iwe yang'ana dipo lako,
Moyo usautaye kangaza.

4. Wochimwa samalira, Sankha Mbuye leroli,
Kumwamba kudzakondwa kangaza.
Choka msanga mu m’dima,
Yesu ‘dzakuyeretsa, Yenda njira yam’mwamba, kangaza.
''',
      '''1. Pa nyanja ya miyoyo ngalawa ilipo,
Ndi chombo chopulumutsa amene alimo.
Ukadzikhulupirira udzamizidwatu,
Komatu chombo chija chidzafikitsa 'we.

CHORUS:
Lowani muchombo lero mupulumutsidwetu,
Namondwe angadze mawa.
Lowani muchombo leroli, Namondwe angadze mawa,
Lowani leroli.

2. Ukadzikweza wekha udzalepheradi,
Mayeso adzakula udzagonjetsedwa.
Ubwere usaope kusiya tchimolo,
Chikudikira chombo ulowe msangatu.

3. Tidzathangata kodi akufa m’tchimolo,
Kapena kungogona mafunde mnyanjamo.
Mkoopsa pakudzuka kuona namondwe,
Ndi ife tili kunja kwa chombo chijacho.

4. Bwerani nthawi ino mudzadalitsidwe,
Apatsa moyo wonse muchombo chakecho.
Onani nkhundayo yamtendere wosatha,
Ndidzanja la Mulungu lipulumutsa’we.
''',
      '''Ndingatume yani kulalika uthenga,
Bass: Abambo/amayi
Ndingatume yani kulalika uthenga.
All : 
Pitanitu, pitanitu, pitanitu, pitanitu.
Pitanitu, pitanitu, pitanitu, pitanitu.
Sop : 
Pitani mukalalikire,
Pitani mukalalikire,
Pitani mukalalikire.
All: 
Kuti Yesu akubwera, Kuti Yesu akubwera.
Pi-tani mukalalikire, m'zinyanja monse,
M'phiri ndi m’dambo
Pi-tani mukalalikire kuti Yesu akubwera.
''',
      '''1. 
Sop : Pampando wa kumwamba,
ATB: Pampando wa kumwamba,
Sop : Pampando wa kumwamba,
ATB: Pampando wa kumwamba,
All : Pampando wa kumwambako, Yesu ayimirane

CHORUS:
Sop: 	Ndikavomereza tchimo langa
ATB	Vomereza tchimo langa
Sop: 	Ndikavomereza tchimo langa
ATB	Vomereza tchimo langa
All: 	Povomera tchimo langa Yesu akhululukira ine.

2.
Sop: 	Pampando woweruza,
ATB	Pampando woweruza,
Sop: 	Pampando woweruza,
ATB	Pampando woweruza,
All: 	Pampando woweruzawo, Yesu ndi wa nsembeyo. 

3. 
Sop: Podzabwera Ambuye,
ATB: Podzabwera Ambuye,
Sop: Podzabwera Ambuye,
ATB: Podzabwera Ambuye,
All: Podzabwera Ambuyeyo, Adzanditenga ine. 
''',
      '''1. Aisrayeli atawoloka panyanja yofiira,
Anaimba nyimbo yachigonjetso.
Kuthokoza Ambuye kuti anagwira ntchito,
Chifukwa iwo anapambana.

CHORUS:
Sop: 
Anaimba monyadira (monyadira),
Sop: 
Motsatira mwa nthetemya (mwanthetemya).
All: 
Ifenso tikadzafika panyanja yamandala,
Tidzaimba nyimbo zotamanda zamayamiko.

2. Ankhondo a Farao anathera panyanja,
Chifukwa anachita zamwano,
Ndipo Aisrayeli ataona zozizwa,
Anaimba nyimbo ya chigonjetso.

3. Ife tikachita bwino mpaka chimaliziro,
Tidzaimba nyimbo yachigonjetso.
Kukondwa kuona mbuye pachimpando chakecho,
Ndikuimba nyimbo yachigpnjetso.
''',
      '''1. Zopereka zigwire ntchito ya Yesu,
Perekani ndi mtima wanu onse.
Mulungu akondwera ngati ntchito Yake
Muigwira ndi mtima wanu wonse.

CHORUS:
Bass: 
Mpereke mpereke zoperekazo
All: 
Zigwire ntchito (ntchito);
Kupindula myoyo (myoyo), Kufikira Yesu (Yesu);
Adzabweranso mdziko .

2. Abambo amayi bwerani mpereke,
Zopereka zanu zigwire ntchito.
Mulungu akondwera ngati ntchito Yake,
Muigwira ndi mtima wanu wonse.

3. Anyamata asungwana bwerani mpereke,
Zopereka zanu zigwire ntchito.
Mulungu akondwera ngati ntchito Yake,
Muigwira ndi mtima wanu wonse.
''',
      '''1. Mu Yopa munali mayi wina ankatchedwatu Dorika;
Iyeyu nagwira ntchito ya yesu mpaka moyo wake wonse.

CHORUS:
Sop: Mayi Dorika
ATB: Anadwala
Sop: Mayi Dorika
ATB: Anadwala
ALL: 
Iye anatengedwa kunka naye chipinda cha pamwamba.

2. Simoni Petulo atamva za uthenga anakwera chipinda chapamwamba;
Nagwada pansi iye napemphera Dorika nauka.

3. Nafenso amayi tichite monga Dorika yemwe anaukitsidwa;
Tigwire ntchito zothandiza ena kuti nafe tidzauke.
''',
      '''1. Ndakonzekera kumva zowawa pogwira ntchito ya Yesu (ine),
Ndazindikira dziko nlovuta sindingapite kumwamba mu mtendere wokha.
 
CHORUS:
Muli minga mnjira zovuta nzambiri uza Yesu akutsogolere (iwe),
Ndazindikira dzikoli nlovuta sindingapite kumwamba mu mtendere wokha.

2. Mbiri za nkhondo,njala, matenda, zili ponseponse mdziko lapansi,
Ndazindikira dzikoli nlovuta sindingapite kumwamba mu mtendere
Wokha.
''',
      '''1. Mcharuchi tikukhala ni charu cha masuzgo;
Namayigha ghakofyamwe mayigha ghaviyezgo;
Yakundizingilizga afumu mundikhozge ine ningawa.

CHORUS:
Wakunipwererera wakunipwererera,
Wakunipwererera nyengo zose para,
Nkhwenda ine mumayigha ghakofya,
Wakunipwererera ine nyengo zose.

2. Pala suzgo lafika nkhulabiska kwa Imwe;
Mowviri wakuziziswa Davide wakanena;
Kwa imwe pera fumu ndiko, Kukufumira wowviri wane.

3. Zuzgani mtima wane namalangizgo yinu;
Gha umoyo wandandamwe kuti ine;
Nileke kuluwa imwe Fumu nyengo zose ni yagamire kwa Imwe.
''',
      '''1. Bakhristu wukani Nyengo yamala;
Yesu watizenge Nyengo yamala;
Wali pamlyango nyengo yamala;
Nozgekaninge wakwiza (wakwiza).

CHORUS:
Wonani wakwiza (wakwiza),
Fumu Yesu wakwiza (wakwiza),
Wizenge naba ngelo kuchanya,
Nozgekaninge wakwiza (wakwiza).

2. Vyamcharu vikuti nyengo yamara;
Vyose vikunena nyengo yamara;
Wali pamlyango nyengo yamala;
Nozgekaninge wakwiza (wakwiza).

3. Lekani uheni nyengo yamara;
Sungani malango nyengo yamara;
Mwendenge na Yesu nyengo yamara;
Nozgekaninge wakwiza (wakwiza).
''',
      '''1. Timtebetere fumu mulimo nase;
Bamama timtebetere Yesu pakuthuska;
Mazgu gha fumu nase bamama tiphalazgenge.

CHORUS:
(Haya bamama) tipharazgenge m'madambo,
Namumapiri wuwo.
(Haya bamama) Tose titangwanikenge,
Tithandazge ivangeli.

2. Tithaske miyoyo ya bana bithu nase;
Bamama timtebetere Yesu Bachinyamata;
Nabasungwana nase bamama tipharazge.

3. Ntchito zithu nazo zipharazgenge;
Tose bamama timtebetere Yesu;
Tilongole chitemwa kwa banthu nase bamama tipharazgenge.
''',
      '''1. Nyengo zino za umaliro timkwezge;
Yesuyo tipharazge za Iyo;
Tikwezgenge zina Lake.

CHORUS:
Timkwezgenge Yesu mu Mazgo,
Mmilimo charo chimanye Yesu,
Tikwezgenge zina Lake.

2. Nyengo zino za umaliro timkwezge;
Yesuyo tinene wali pafupi kwiza;
Tikwezgenge zina Lake.

3. Ta Bakhristu banyengo zino;
Timkwezge Yesuyo tiwazgenge;
Malemba Yakhe kuti timtonde Satana.
''',
      '''1. Tinozgekerenge ulendo uwu;
Tili pafupi kukaya;
Uko Yesu wakutinozgera malo;
Tili pafupi kukaya.

CHORUS:
Kukaya malo ghawemi,
Tili pafupi kukaya,
Tileke vyakutitondeska,
Tili pafupi kukaya.

2. Tilute kukaya kwambula nyifwa;
Tili pafupi kukaya;
Tilute lubiro tikafikeko;
Tili pafupi kukaya.

3. Vimanyikwiro vyakwaniskika mwe;
Pafupi kukaya Yesu;
Wayima pa muryango;
Wakwiza tili pafupi kukaya.
''',
      '''1. Ndimwe Chiuta mwene nkhongono, namphanji yane pavisuzgo,
Pakuyezgeka namlwani wane mundilongozge mnthowa yinu.

CHORUS:
Sp: ndimwe pera
All: ndimwepera
Sp: munankhongono
All: munankhongono
Sp: zakuchizga
All: zakuchizga
Sp: nakuthaska
All: nakuthaska
Sp: chimango chose
All: chimango chose chili mwa imwe
Sp: mundisavye
All: mundisavye
Sp: na ndopa zinu
All: na ndopa zinu

2 Nkhwa imwe pera fumu Chiuta kugowokera zakwananga,
Kwambula imwe nditi ndifwenge, mundilongozge, mundisunge.

3 Mbamwabi abo Yesu ndi wawo wakawafwira pamphinjika,
Wachindikike kunyengo zose, uyo wakafwa pamphinjika.
'''
    ];

    // Loop through the list and insert each fruit
    /*for (String song in songList) {
    await dbHelper.insertFruitDetail(songList.length-songList.length--, song);
  }*/

    int id = 1;
    for (String song in songList) {
      await dbHelper.insertFruitDetail_dor(id, song);
      id++;
    }
  }
}
