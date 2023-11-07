import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EspecieanimalModelo {
  EspecieanimalModelo({
    required this.id,
    required this.especie,
    // required this.inventanimalxs,
  });

  EspecieanimalModelo.unlaunched();

  late int id = 0;
  late final String especie;
  late List<InventanimalxRModelo> inventanimalxs = [];

  EspecieanimalModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    especie = json['especie'];

    if (json['inventanimalxs'] != null) {
      inventanimalxs = (json['inventanimalxs'] as List)
          .map((e) => InventanimalxRModelo.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      inventanimalxs = [];
    }
  }

  factory EspecieanimalModelo.fromJsonModelo(Map<String, dynamic> json) {
    return EspecieanimalModelo(id: json['id'], especie: json['especie']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['especie'] = especie;

    if (this.inventanimalxs != null) {
      _data['asistenciaxs'] =
          this.inventanimalxs.map((v) => v.toJson()).toList();
    }
    return _data;
  }
}

//----------------------------------------------------------//

class InventanimalxRModelo {
  late int id = 0;
  late final String adultos;
  late final String jovenes;
  late final DateTime fechaMes;

  InventanimalxRModelo({
    required this.id,
    required this.adultos,
    required this.jovenes,
    required this.fechaMes,
  });

  factory InventanimalxRModelo.fromJson(Map<String, dynamic> json) {
    return InventanimalxRModelo(
      id: json["id"],
      adultos: json["adultos"],
      jovenes: json["jovenes"],
      fechaMes: DateTime.parse(json["fechaMes"]),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adultos'] = this.adultos;
    data['jovenes'] = this.jovenes;
    data['fechaMes'] = this.fechaMes;

    return data;
  }
}
