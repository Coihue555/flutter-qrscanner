import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansByTipo(String tipo) async {
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans = [...scans!];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarScans() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScansById(int? id) async {
    await DBProvider.db.deleteScan(id!);
    cargarScansByTipo(tipoSeleccionado);
  }
}
