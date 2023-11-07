import 'package:flutter/material.dart';

@immutable
class EspecieanimalModeloFire {
  late String id = "";
  late final String especie;

  EspecieanimalModeloFire({required this.id, required this.especie});

  EspecieanimalModeloFire.unlaunched();

  EspecieanimalModeloFire.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? "" : json['id'];
    especie = json['especie'];
  }

  factory EspecieanimalModeloFire.fromJsonModelo(Map<String, dynamic> json) {
    return EspecieanimalModeloFire(
      id: json['id'] == null ? "" : json['id'],
      especie: json['especie'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['especie'] = especie;

    return _data;
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['especie'] = this.especie;

    return data;
  }
}
