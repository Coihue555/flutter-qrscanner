import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrscanner/providers/scan_list_provider.dart';
import 'package:flutter_qrscanner/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( '#3dbbef', 'Cancelar', false, ScanMode.QR);
        //final barcodeScanRes = 'https://google.com';
        //final barcodeScanRes = 'geo:-26.4081891,-54.5868764';

        if (barcodeScanRes == '-1'){
          return;
        }


        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
      );
  }
}