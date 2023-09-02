import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/share_body.dart';

import '../widgets/appBar_widget.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        text: context.textTr("Share the app"),
      ),
      body: const ShareBody(),
    );
  }
}
