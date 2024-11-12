import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/manger/theme_cubit/theme_state.dart';

import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../../../more/presentation/widgets/container_widget.dart';
import '../../data/model/ExpandableContent.dart';

class FadlList extends StatefulWidget {
  const FadlList({
    super.key,
  });

  @override
  State<FadlList> createState() => _FadlListState();
}

class _FadlListState extends State<FadlList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: dataExpandable.length,
        (context, index) => BlocBuilder<ThemeCubit, AppTheme>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ContainerWidget(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    maintainState: false,
                    title: Text(
                      context.textTr(dataExpandable[index].header),
                      style: context.titleMedium(),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          context.textTr(dataExpandable[index].body),
                          style: context.bodyMedium(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
