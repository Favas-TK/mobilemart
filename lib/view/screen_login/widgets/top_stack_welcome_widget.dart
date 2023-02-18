import 'package:flutter/material.dart';
import 'package:mobilemart/extra/extentions/extentions.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/view/screen_get_started/widgets/custom_text_widget.dart';
import 'package:mobilemart/view/screen_login/widgets/welcome_canvas_widget.dart';

class TopStackWelcomeWidget extends StatelessWidget {
  const TopStackWelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      width: double.infinity,
      height: context.getSize().height * 0.4,
      child: CustomPaint(
        painter: WelcomeCanvas(),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: context.getSize().width * 0.55,
                  child: const FittedBox(
                    child: CustomTextWidget(
                      text: 'Welcome',
                      color: white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: context.getSize().width * 0.6,
                  child: const FittedBox(
                    child: CustomTextWidget(
                      text: 'Mobile Mart                ',
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
