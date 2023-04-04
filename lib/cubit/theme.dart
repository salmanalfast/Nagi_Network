import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void changeTheme() {
    emit(state == true ? false : true);
    debugPrint(state.toString());
  }
}
