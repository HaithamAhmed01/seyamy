import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/custom_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(Assets.images7Error,
                fit: BoxFit.cover, height: context.height,
            width: context.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Error!',
                    style: context
                        .titleLarge()
                        .copyWith(fontSize: 30, color: Colors.black)),
                16.height,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: Text(
                    'Something went wrong, Please try again later',
                    style: context
                        .bodyLarge()
                        .copyWith(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                32.height,
                CustomButton(
                  text: 'RETRY',
                  onTap: () {},
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
