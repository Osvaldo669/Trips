import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_states_cubit.dart';
import 'package:flutter_cubit/models/data_model.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  void datailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
