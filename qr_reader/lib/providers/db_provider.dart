import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;

  // Instancia de la clase para crear un singleton
  // Las siguientes dos lineas provocan que cuando haga un new DBProvider siempre voy a obtener la misma instancia de la clase
  static final DBProvider db =
      DBProvider._(); // el ._() es un constructor privado de la clase

  DBProvider._();

  // Async ya que la respuesta de la BD no es sincrona
  Future<Database?> get database async {
    // Para obtener la BD, si no es nula devuelvo la ya instanciada
    if (_database != null) return _database;
    // Si es nula creo el conector a la BD
    _database = await initDB();
    return _database;
  }

  // Creo la BD en el dispositivo
  Future<Database?> initDB() async {
    // Path de donde almacenaremos la BD
    Directory documenDirectory = await getApplicationDocumentsDirectory();
    final path = join(documenDirectory.path, 'ScansDB.db');
    print(path);

    // Crear base de datos
    return await openDatabase(path,
        version:
            1, // hay que cambiar la version de la BD siempre que hagamos cambios estructurales a la misma
        onOpen: (db) {}, // Si queremos ejecutar algo al abrir la db
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
    });
  }

  // una forma de insertar registros en la BD
  nuevoScanRaw(ScanModel nuevoScan) async {
    // primero verifico la bd crada llamando al getter
    final db = await database;

    final res = await db!.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')
    ''');

    return res;
  }

  // Otra forma mas sencilla
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db!.insert('Scans', nuevoScan.toJson());
    // Devuelvo el ID del ultimo registro insertado
    return res;
  }

  // Forma con instrucciones pre-fabricadas q incluyen metodos de seguridad para
  // evitar SQL inyection.
  Future<ScanModel?> getScanById(int i) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [i]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAll() async {
    final db = await database;
    final res = await db!.query('Scans');
    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : null;
  }

  Future<List<ScanModel>> getScansByType(String tipo) async {
    final db = await database;
    final res = await db!.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> utdateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db!.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db!.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }
}
