import 'package:flutter/material.dart';
import 'periodic_action.dart';
import 'widgets/flat_advanced_rounded_switch.dart';
import 'widgets/flat_advanced_switch.dart';
import 'widgets/flat_switch.dart';
import 'widgets/flat_rounded_switch.dart';
import 'interfaces/i_click.dart';

void main() {
  runApp(const SwitchDemoApp());
}

class SwitchDemoApp extends StatelessWidget {
  const SwitchDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: SwitchHomePage(title: 'Flutter Switches (BLoC) Demo'),
    );
  }
}

class SwitchHomePage extends StatelessWidget {
  SwitchHomePage({super.key, required this.title});

  static const int FREQ = 500; // 0.5s

  final String title;
  bool _startStop = false;

  final PeriodicAction periodicAction =
      PeriodicAction(const Duration(milliseconds: FREQ));

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontStyle: FontStyle.italic,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Colors.indigo,
                offset: Offset(3.0, 3.0),
              ),
            ],
          )),
      leading: IconButton(
        icon: const Icon(Icons.extension_outlined, color: Colors.white),
        // Icon widget
        onPressed: () {
          // Add your onPressed logic here
        },
      ),
      backgroundColor: Colors.lightBlue,
    );

    FlatSwitch yellow = FlatSwitch(
      canvasColor: Colors.deepOrangeAccent,
      imageColor: Colors.yellow,
      width: 20,
      height: 16,
    );

    FlatSwitch purple = FlatSwitch(
        canvasColor: Colors.deepPurple,
        imageColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        onAction: () {
          yellow.click();
        });

    FlatRoundedSwitch blue = FlatRoundedSwitch(
        canvasColor: Colors.blueAccent,
        imageColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        borderColor: Colors.white,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onAction: () {
          purple.click();
        });

    FlatAdvancedRoundedSwitch blueAdvanced = FlatAdvancedRoundedSwitch(
        width: 20,
        height: 16,
        borderWidth: 0.5,
        canvasFColor: Colors.blue,
        canvasTColor: Colors.amberAccent,
        borderFColor: Colors.white30,
        borderTColor: Colors.redAccent,
        borderDColor: Colors.cyanAccent,
        borderUColor: Colors.cyan,
        imageFColor: Colors.white,
        imageTColor: Colors.red,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onDownAction: () {
          yellow.disable();
        },
        onUpAction: () {
          yellow.enable();
          purple.click();
        });

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: appBar,
      body: Align(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                FlatRoundedSwitch(
                    width: 16,
                    height: 16,
                    borderRadius: 8,
                    T: Icons.pause_sharp,
                    F: Icons.play_arrow_sharp,
                    onAction: () {
                      onStartStop(blue);
                    }),
                blue,
                purple,
                yellow,
              ]),
              const SizedBox(
                height: 16,
              ),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                FlatAdvancedSwitch(
                    width: 16,
                    height: 16,
                    canvasFColor: Colors.blueAccent,
                    canvasTColor: Colors.indigo,
                    canvasDColor: Colors.blueGrey,
                    canvasUColor: Colors.teal,
                    imageFColor: Colors.white,
                    imageTColor: Colors.white30,
                    imageDColor: Colors.amber,
                    imageUColor: Colors.amberAccent,
                    T: Icons.accessible_forward_sharp,
                    F: Icons.accessible_sharp,
                    onAction: () {
                      blueAdvanced.click();
                    }),
                blueAdvanced,
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Row(
          children: <Widget>[
            FlatSwitch(
                width: 12,
                height: 8,
                imageColor: Colors.yellow,
                T: Icons.cloud_queue_sharp,
                F: Icons.cloud_off_sharp,
                onAction: () {}),
            FlatSwitch(
                width: 12,
                height: 8,
                imageColor: Colors.orangeAccent,
                T: Icons.lock_open_sharp,
                F: Icons.lock_outline_sharp,
                onAction: () {}),
            FlatAdvancedSwitch(
                width: 12,
                height: 8,
                imageFColor: Colors.white30,
                imageTColor: Colors.white70,
                T: Icons.diamond_outlined,
                F: Icons.diamond_sharp,
                onAction: () {}),
            const SizedBox(
              width: 32,
            ),
            FlatAdvancedRoundedSwitch(
                width: 12,
                height: 8,
                borderWidth: 0.2,
                borderFColor: Colors.white,
                borderTColor: Colors.cyan,
                imageFColor: Colors.white,
                imageTColor: Colors.cyan,
                T: Icons.done_all_sharp,
                F: Icons.done_sharp,
                onUpAction: () {}),
            const SizedBox(
              width: 8,
            ),
            FlatAdvancedRoundedSwitch(
                width: 12,
                height: 8,
                borderWidth: 0.2,
                borderFColor: Colors.lightGreenAccent,
                borderTColor: Colors.lightGreen,
                imageFColor: Colors.lightGreenAccent,
                imageTColor: Colors.lightGreen,
                T: Icons.eco_outlined,
                F: Icons.eco_sharp,
                onUpAction: () {}),
            const SizedBox(
              width: 8,
            ),
            FlatRoundedSwitch(
                width: 12,
                height: 8,
                borderWidth: 0.2,
                borderRadius: 4,
                borderColor: Colors.redAccent,
                imageColor: Colors.redAccent,
                T: Icons.deblur_outlined,
                F: Icons.deblur_sharp,
                onAction: () {}),
          ],
        ),
      ),
    );
  }

  void onStartStop(final IClick iClick) {
    _startStop = !_startStop;
    if (_startStop) {
      periodicAction.start(iClick.click);
    } else {
      periodicAction.stop();
    }
  }
}
