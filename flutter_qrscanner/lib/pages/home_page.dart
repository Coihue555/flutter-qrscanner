import 'package:flutter/material.dart';

import 'package:flutter_qrscanner/pages/direcciones_pages.dart';
import 'package:flutter_qrscanner/pages/mapas_page.dart';
import 'package:flutter_qrscanner/providers/scan_list_provider.dart';

import 'package:flutter_qrscanner/providers/ui_provider.dart';

import 'package:flutter_qrscanner/widgets/custom_navigatorbar.dart';
import 'package:flutter_qrscanner/widgets/scan_button.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarScans();
            },
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.getTodosScans().then((s)=>s!.forEach((element) {print(element.valor);}));

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex){
      case 0:
        scanListProvider.cargarScansByTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansByTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
      
    }
  }
}