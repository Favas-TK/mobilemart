

import 'package:mobilemart/extra/exports/exports.dart';

class CustomElevatedBtnWidget extends StatelessWidget {
  const CustomElevatedBtnWidget({
    required this.btnText,
    required this.onpressed,
    this.btnTextColor = red,
    this.btnColor = white,
    this.buttontype,
    Key? key,
  }) : super(key: key);
  final String btnText;
  final Function onpressed;
  final Color btnColor;
  final Color btnTextColor;
  final bool? buttontype;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      highlightElevation: 0,
      color: btnColor,
      onPressed: () {
        onpressed();
      },
      child: CustomTextWidget(
        text: btnText,
        color: btnTextColor,
      ),
    );
  }
}
