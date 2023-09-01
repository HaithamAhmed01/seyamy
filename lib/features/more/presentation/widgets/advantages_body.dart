import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/data/model/AdvantageContent.dart';
import 'package:seyamy/features/more/presentation/widgets/advantage_item.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

class AdvantagesBody extends StatelessWidget {
  const AdvantagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: ListView.builder(
        itemCount: dataAdvantage.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: AdvantageItem(
              header: dataAdvantage[index].header,
              body: dataAdvantage[index].body,
              icon: dataAdvantage[index].icon,
            ),
          );
        },
      ),
    );
  }
}
