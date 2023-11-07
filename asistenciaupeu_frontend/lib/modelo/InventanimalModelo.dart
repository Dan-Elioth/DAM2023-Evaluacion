import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class InventanimalModelo {
  late int id = 0;
  late final String adultos;
  late final String jovenes;
  late final String fechaMes;
  late final int especieanimalId;

  InventanimalModelo({
    required this.id,
    required this.adultos,
    required this.jovenes,
    required this.fechaMes,
    required this.especieanimalId,
  });

  InventanimalModelo.unlaunched();

  InventanimalModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    adultos = json['adultos'];
    jovenes = json['jovenes'];
    fechaMes = json['fechaMes'];
    especieanimalId = json['especieanimalId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['adultos'] = adultos;
    _data['jovenes'] = jovenes;
    _data['fechaMes'] = fechaMes;
    _data['especieanimalId'] = especieanimalId;

    return _data;
  }
}

//-----------------------------------------------------------//

class InventanimalxRespModelo {
  InventanimalxRespModelo({
    required this.id,
    required this.adultos,
    required this.jovenes,
    required this.fechaMes,
    required this.especieanimalId,
  });

  late final int id;
  late final String adultos;
  late final String jovenes;
  late final String fechaMes;

  late final EspecieanimalModelo especieanimalId;

  InventanimalxRespModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adultos = json['adultos'];
    jovenes = json['jovenes'];
    fechaMes = json['fechaMes'];

    especieanimalId = EspecieanimalModelo.fromJson(json['actividadId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['adultos'] = adultos;
    _data['jovenes'] = jovenes;
    _data['fechaMes'] = fechaMes;

    _data['especieanimalId'] = especieanimalId.toJson();

    return _data;
  }
}
