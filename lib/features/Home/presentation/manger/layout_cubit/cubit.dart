import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/state.dart';
import 'package:seyamy/features/Home/presentation/view/home_screen.dart';

import '../../../../../core/widgets/ErrorScreen.dart';
import '../../../../fadl_alseyam/presentation/view/fadl_alseyam_screen.dart';
import '../../../../more/presentation/view/more_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

//CurrentBottomNavIndex
  int bottomNavCurrentIndex = 0;

//List of Item in TabBar
  List<String> itemsTabBar = [
    'الرئيسية',
    'فضل الصيام',
    'المزيد',
  ];

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const FadlAlseyamScreen(),
    const MoreScreen(),
  ];

  //BottomNav
  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
