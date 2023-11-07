// import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
// import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModeloFire.dart';
// import 'package:flutter/material.dart';

// @immutable
// class InventanimalModeloFire {
//   late String id = "";
//   late final String adultos;
//   late final String jovenes;
//   late final String fechaMes;
//   late final EspecieanimalModelo especieanimalId;

//   InventanimalModeloFire({
//     required this.id,
//     required this.adultos,
//     required this.jovenes,
//     required this.fechaMes,
//     required this.especieanimalId,
//   });

//   InventanimalModeloFire.unlaunched();

//   InventanimalModeloFire.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adultos = json['adultos'];
//     jovenes = json['jovenes'];
//     fechaMes = json['fechaMes'];
//     especieanimalId = json['especieanimalId'] != null   
//         ? EspecieanimalModeloFire.fromJsonModelo(json['especieanimalId'])
//         : EspecieanimalModeloFire.unlaunched();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['cui'] = adultos;
//     _data['tipoCui'] = jovenes;
//     _data['fecha'] = fechaMes;
//     //_data['actividadId'] = actividadId;
//     if (this.especieanimalId != null) {
//       _data['especieanimalId'] = this.especieanimalId.id;
//     }
//     return _data;
//   }

//   Map<String, dynamic> toMap() {
//     var data = Map<String, dynamic>();
//     data['id'] = this.id;
//     data['cui'] = this.adultos;
//     data['tipoCui'] = this.jovenes;
//     data['fechaMes'] = this.fechaMes;

//     //data['actividad'] = this.actividad;
//     if (this.especieanimalId != null) {
//       data['especieanimalId'] = this.especieanimalId.id;
//     }
//     return data;
//   }
// }
