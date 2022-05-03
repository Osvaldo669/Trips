import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_states_cubit.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
