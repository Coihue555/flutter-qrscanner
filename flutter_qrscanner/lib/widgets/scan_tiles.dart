import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/providers/scan_list_provider.dart';
import 'package:flutter_qrscanner/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans; 

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(tipo == 'http' ? Icons.home : Icons.map,
                  color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor.toString()),
              subtitle: Text(scans[i].id.toString()),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
              onTap: () => launchURL(context, scans[i]),
            ));
  }
}
