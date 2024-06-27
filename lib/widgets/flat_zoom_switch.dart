import 'package:flutter/material.dart';

import '../flow_counter.dart';
import 'flat_button.dart';
import 'flat_text_button.dart';

class FlatZoomSwitch extends StatelessWidget {

  final double width;
  final double height;
  final double fontSize;

  final FlowCounter flowCounter = FlowCounter(25, 250, 25, 100);

  FlatZoomSwitch({super.key, required this.width, required this.height, required this.fontSize, });

  @override
  Widget build(BuildContext context) {

    FlatTextButton text = FlatTextButton(
      width: width + 1,
      height: height,
      canvasDisabledColor: Colors.blueGrey,
      textColor: Colors.white,
      textDisabledColor: Colors.limeAccent,
      textPressedColor: Colors.white,
      text: flowCounter.value().toString(),
      fontSize: fontSize,
      onUpAction: () {
      },
      onDownAction: () {
      },
    );

    FlatButton iconMinus = FlatButton(
      width: width,
      height: height,
      iconColor: Colors.white,
      iconDisabledColor: Colors.blueGrey,
      iconPressedColor: Colors.limeAccent,
      iconData: Icons.remove,
      iconDataPressed: Icons.remove,
      onUpAction: () {
        text.changeText(flowCounter.dec().toString());
      },
      onDownAction: () {
      },
    );

    FlatButton iconPlus = FlatButton(
      width: width,
      height: height,
      iconColor: Colors.white,
      iconDisabledColor: Colors.blueGrey,
      iconPressedColor: Colors.limeAccent,
      iconData: Icons.add,
      iconDataPressed: Icons.add,
      onUpAction: () {
        text.changeText(flowCounter.inc().toString());
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
