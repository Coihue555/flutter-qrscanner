import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/models/scan_model.dart';
import 'package:flutter_qrscanner/providers/db_provider.dart';
import 'package:meta/meta.dart';


class MapaPage extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas'),
      ),
      body:  Center(
         child: Text(scan.valor),
      ),
    );
  }
}