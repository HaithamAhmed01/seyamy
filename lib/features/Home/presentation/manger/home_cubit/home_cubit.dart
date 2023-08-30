import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  int day = 0;

  int num = 0;

  void addNum() {
    if (day != 0 && num != 0) {
      day--;
      num--;
    }
    emit(HomeAddNum());
  }

  void selectNumber(int number) {
    num = number;
    emit(HomeSelectNum());
  }

  void addNumber() {
    day = num;
    emit(HomeSelectNum());
  }
}
