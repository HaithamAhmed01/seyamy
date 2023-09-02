import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';
import '../widgets/advantages_body.dart';
import '../widgets/appBar_widget.dart';

class AdvantagesScreen extends StatelessWidget {
  const AdvantagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        text: context.textTr("Application Advantages"),
      ),
      body: const AdvantagesBody(),
    );
  }
}
