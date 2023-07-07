import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/cubit.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/state.dart';
import 'package:seyamy/features/Home/presentation/view/widgets/appbar_widget.dart';
import 'package:seyamy/features/Home/presentation/view/widgets/bottom_navbar_widget.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return Scaffold(
          appBar: buildAppBar(
            cubit.itemsTabBar[bottomNavCurrentIndex],
            context,
          ),
          bottomNavigationBar: BottomNavBarWidget(cubit: cubit),
          body: IndexedStack(
            index: bottomNavCurrentIndex,
            children: cubit.bottomScreens,
          ),
        );
      },
    );
  }
}
