import 'package:flutter/material.dart';

import 'flat_button.dart';
import 'flat_text_button.dart';

class FlatZoomSwitch extends StatelessWidget {
  const FlatZoomSwitch({super.key});

  @override
  Widget build(BuildContext context) {

    FlatTextButton text = FlatTextButton(
      width: 7,
      height: 6,
      canvasDisabledColor: Colors.blueGrey,
      textColor: Colors.white,
      textDisabledColor: Colors.limeAccent,
      textPressedColor: Colors.white,
      text: "100",
      fontSize: 12,
      onUpAction: () {
      },
      onDownAction: () {
      },
    );

    FlatButton iconMinus = FlatButton(
      width: 8,
      height: 6,
      iconColor: Colors.white,
      iconDisabledColor: Colors.blueGrey,
      iconPressedColor: Colors.limeAccent,
      iconData: Icons.remove,
      iconDataPressed: Icons.remove,
      onUpAction: () {
        text.changeText('75');
      },
      onDownAction: () {
      },
    );

    FlatButton iconPlus = FlatButton(
      width: 6,
      height: 6,
      iconColor: Colors.white,
      iconDisabledColor: Colors.blueGrey,
      iconPressedColor: Colors.limeAccent,
      iconData: Icons.add,
      iconDataPressed: Icons.add,
      onUpAction: () {
        text.changeText('125');
      },
      onDownAction: () {
      },
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Background color of the Container
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(
          color: Colors.white, // Border color
          width: 1, // Border width
        ),
      ),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4), // Padding inside the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconMinus,
          //const SizedBox(width: 1), // Spacer
          text,
          //const SizedBox(width: 1), // Spacer
          iconPlus,
        ],
      ),
    );
  }
}
