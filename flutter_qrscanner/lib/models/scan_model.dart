import 'dart:convert';
import 'package:meta/meta.dart';

class ScanModel {
    
    int? id;
    String? tipo;
    String? valor;

    ScanModel({
        @required this.id,
        @required this.tipo,
        @required this.valor,
    }) {
      if(tipo!.contains('http') ){
        this.tipo = 'http';
      } else {
        this.tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
