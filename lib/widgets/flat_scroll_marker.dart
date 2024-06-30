import 'package:flutter/material.dart';
import '../pair.dart';
import 'flat_text_button.dart';

class FlatScrollMarker extends StatelessWidget {

  final double width;
  final double height;
  final double fontSize;

  final Pair<int,int> luCorner = Pair<int,int>(0,0);
  final Pair<int,int> rdCorner = Pair<int,int>(100,170);

  late FlatTextButton textLUCorner;
  late FlatTextButton textRDCorner;

  FlatScrollMarker({super.key, required this.width, required this.height, required this.fontSize, });

  @override
  Widget build(BuildContext context) {

    textLUCorner = FlatTextButton(
      width: width + 1,
      height: height,
      canvasDisabledColor: Colors.blueGrey,
      textColor: Colors.white,
      textDisabledColor: Colors.limeAccent,
      textPressedColor: Colors.white,
      text: luCorner.toString(),
      fontSize: fontSize,
      onUpAction: () {
      },
      onDownAction: () {
      },
    );

    textRDCorner = FlatTextButton(
      width: width + 1,
      height: height,
      canvasDisabledColor: Colors.blueGrey,
      textColor: Colors.white,
      textDisabledColor: Colors.limeAccent,
      textPressedColor: Colors.white,
      text: rdCorner.toString(),
      fontSize: fontSize,
      onUpAction: () {
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
          textLUCorner,
          const SizedBox(width: 1), // Spacer
          const Text('|', style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 1), // Spacer
          textRDCorner,
        ],
      ),
    );
  }

  void changeCoordinates(final Pair<int,int> lu, final Pair<int,int> rd) {
    try {
      textLUCorner.changeText(lu.toString());
      textRDCorner.changeText(rd.toString());
    } catch (exception) {
      debugPrint("* change error * ${exception.toString()}");
    }
  }

}
