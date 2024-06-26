import 'package:flutter/material.dart';

class FlatZoomSwitch extends StatelessWidget {
  const FlatZoomSwitch({super.key});

  @override
  Widget build(BuildContext context) {

    Icon iconMinus = const Icon(
      Icons.remove,
      color: Colors.white,
      size: 24.0,
    );

    Icon iconPlus = const Icon(
      Icons.add,  //  add_outlined
      color: Colors.white,
      size: 24.0,
    );

    Text text = const Text(
      '100',
      style: TextStyle(fontSize: 14, color: Colors.white),
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
          const SizedBox(width: 1), // Spacer
          text,
          const SizedBox(width: 1), // Spacer
          iconPlus,
        ],
      ),
    );
  }
}
