import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/manger/theme_cubit/theme_state.dart';

import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../../../more/presentation/widgets/container_widget.dart';
import '../../data/model/ExpandableContent.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    super.key,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataExpandable.length,
      itemBuilder: (context, index) {
        return BlocBuilder<ThemeCubit, AppTheme>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ContainerWidget(
                body: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    maintainState: false,
                    title: Text(
                      context.textTr(dataExpandable[index].header),
                      style: context.subtitle2(),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          context.textTr(dataExpandable[index].body),
                          style: context.bodyText2(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
