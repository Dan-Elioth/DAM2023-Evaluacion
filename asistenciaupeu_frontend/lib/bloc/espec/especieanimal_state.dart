// ignore_for_file: must_be_immutable

part of 'especieanimal_bloc.dart';

@immutable
abstract class EspecieanimalState {}

class EspecieanimalInitialState extends EspecieanimalState {}

class EspecieanimalLoadingState extends EspecieanimalState {}

class EspecieanimalLoadedState extends EspecieanimalState {
  List<EspecieanimalModelo> especieanimalList;
  EspecieanimalLoadedState(this.especieanimalList);
}

class EspecieanimalError extends EspecieanimalState {
  Error e;
  EspecieanimalError(this.e);
}
