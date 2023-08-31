import 'package:flutter/cupertino.dart';
import 'package:seyamy/features/fadl_alseyam/presentation/widgets/fadl_alsyam_body.dart';

class FadlAlseyamScreen extends StatelessWidget {
  const FadlAlseyamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: FadlAlseyamBody(),
      ),
    );
  }
}
