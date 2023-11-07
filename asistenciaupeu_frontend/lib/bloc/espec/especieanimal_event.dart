// ignore_for_file: must_be_immutable

part of 'especieanimal_bloc.dart';

@immutable
abstract class EspecieanimalEvent {}

class ListarEspecieanimalEvent extends EspecieanimalEvent {
  ListarEspecieanimalEvent() {
    print("Evento si");
  }
//ListarActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}

class DeleteEspecieanimalEvent extends EspecieanimalEvent {
  EspecieanimalModelo especieanimal;
  DeleteEspecieanimalEvent(this.especieanimal);
//DeleteActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}

class UpdateEspecieanimalEvent extends EspecieanimalEvent {
  EspecieanimalModelo especieanimal;
  UpdateEspecieanimalEvent(this.especieanimal);
//UpdateActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}

class CreateEspecieanimalEvent extends EspecieanimalEvent {
  EspecieanimalModelo especieanimal;
  CreateEspecieanimalEvent(this.especieanimal) {
    print("nooo llega");
  }

//CreateActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}
