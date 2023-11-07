import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:asistenciaupeu_frontend/repository/EspecieanimalRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'especieanimal_event.dart';
part 'especieanimal_state.dart';

class EspecieanimalBloc extends Bloc<EspecieanimalEvent, EspecieanimalState> {
  late final EspecieanimalRepository _especieanimalRepository;
  EspecieanimalBloc(this._especieanimalRepository)
      : super(EspecieanimalInitialState()) {
    on<EspecieanimalEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListarEspecieanimalEvent) {
        emit(EspecieanimalLoadingState());
        try {
          print("pasox!!");
          List<EspecieanimalModelo> especieanimalList =
              await _especieanimalRepository.getEspecieanimal();
          emit(EspecieanimalLoadedState(especieanimalList));
        } catch (e) {
          emit(EspecieanimalError(e as Error));
        }
      } else if (event is DeleteEspecieanimalEvent) {
        try {
          await _especieanimalRepository
              .deleteEspecieanimal(event.especieanimal.id);
          emit(EspecieanimalLoadingState());
          List<EspecieanimalModelo> especieanimalList =
              await _especieanimalRepository.getEspecieanimal();
          emit(EspecieanimalLoadedState(especieanimalList));
        } catch (e) {
          emit(EspecieanimalError(e as Error));
        }
      } else if (event is CreateEspecieanimalEvent) {
        print("noooo");
        try {
          print("leggaaaaa");
          await _especieanimalRepository
              .createEspecieanimal(event.especieanimal);
          emit(EspecieanimalLoadingState());
          List<EspecieanimalModelo> especieanimalList =
              await _especieanimalRepository.getEspecieanimal();
          emit(EspecieanimalLoadedState(especieanimalList));
        } catch (e) {
          emit(EspecieanimalError(e as Error));
        }
      } else if (event is UpdateEspecieanimalEvent) {
        try {
          await _especieanimalRepository.updateEspecieanimal(
              event.especieanimal.id, event.especieanimal);
          emit(EspecieanimalLoadingState());
          List<EspecieanimalModelo> personaList =
              await _especieanimalRepository.getEspecieanimal();
          emit(EspecieanimalLoadedState(personaList));
        } catch (e) {
          emit(EspecieanimalError(e as Error));
        }
      }
    });
  }
}
