import 'package:flutter/cupertino.dart';
import 'package:flutter_qrscanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL( BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if ( scan.tipo == 'http'){
    if (!await launch(url)) throw 'No se pudo abrir $url';
    
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }

  
}