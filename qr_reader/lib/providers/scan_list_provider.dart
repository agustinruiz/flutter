import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

// Servicio donde vamos a buscar informacion relacionada a los scans
// db_provider no actualiza la interfaz de usuario. Este si.
class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    // creo una instancia del nuevo scan
    final nuevoScan = new ScanModel(valor: valor);
    // Lo guardo en la base de datos
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asigno el id de la BD al modelo
    nuevoScan.id = id;

    // Solo lo inserto si el scan corresponde al tipo seleccionado
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      // notifico a los widgets que se actualizo la lista de scans
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAll();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borraScanPorId(int id) async {
    // borro el scan en base al id
    await DBProvider.db.deleteScan(id);
    // vuelvo a cargar todos los scans del tipo en donde estoy
    cargarScansPorTipo(tipoSeleccionado);
  }
}
