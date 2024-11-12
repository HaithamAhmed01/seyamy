import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/features/more/presentation/manger/theme_cubit/theme_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';
import '../manger/theme_cubit/theme_cubit.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;

  const ContainerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: buildShapeDecoration(themeCubit),
          child: child,
        );
      },
    );
  }


}
