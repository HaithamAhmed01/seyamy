import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../utils/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Center(
      child: SpinKitChasingDots(
        color: themeCubit.them ? AppColors.primaryColor : AppColors.whiteColor,
      ),
    );
  }
}
