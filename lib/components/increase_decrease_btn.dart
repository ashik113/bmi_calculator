import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncreaseDecreaseButton extends StatelessWidget {
  IncreaseDecreaseButton({this.icon, this.onPress});

  final IconData? icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      fillColor: Color(0xFFff0067),
      splashColor: kInactiveCardColour,
      hoverColor: kScaffoldBackgroundColor,
      shape: const StadiumBorder(
        side: BorderSide(
          color: kActiveCardColour,
        ),
      ),
      elevation: 6.0,
      focusElevation: 6.0,
      hoverElevation: 8.0,
      highlightElevation: 6.0,
      enableFeedback: true,
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: FaIcon(
        icon,
        size: 26.0,
        color: Colors.white,
      ),
    );
  }
}
