import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/injection_container.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  int day = 0;

  int num = 0;

  Future<void> loadDay() async {
    // Load the selected number from SharedPreferences
    day = sl.get<SharedPreferences>().getInt('day') ?? 0;
    debugPrint("day load  $day");
    emit(HomeLoadNum());
  }

  Future<void> decreaseDay() async {
    if (day != 0) {
      day--;
      num--;
      await sl.get<SharedPreferences>().setInt('day', day);
      debugPrint("decreaseDay  $day");
      emit(HomeDecreaseNum());
    }
  }

  void selectNumber(int number) {
    num = number;
    emit(HomeSelectNum());
  }

  Future<void> addNumber() async {
    // Store the selected number in SharedPreferences
    day = num;
    await sl.get<SharedPreferences>().setInt('day', day);
    debugPrint("addNumber  $day");
    emit(HomeAddNum());
  }
}
