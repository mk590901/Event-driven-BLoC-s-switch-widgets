import 'package:button_k_states/widgets/flat_text_rounded_button.dart';
import 'package:flutter/material.dart';
import 'periodic_action.dart';
import 'widgets/flat_advanced_rounded_switch.dart';
import 'widgets/flat_advanced_switch.dart';
import 'widgets/flat_button.dart';
import 'widgets/flat_rounded_button.dart';
import 'widgets/flat_switch.dart';
import 'widgets/flat_rounded_switch.dart';
import 'interfaces/i_click.dart';
import 'widgets/flat_text_button.dart';

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
      iconColor: Colors.yellow,
      width: 20,
      height: 16,
    );

    FlatSwitch purple = FlatSwitch(
        canvasColor: Colors.deepPurple,
        iconColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        onAction: () {
          yellow.click();
        });

    FlatRoundedSwitch blue = FlatRoundedSwitch(
        canvasColor: Colors.blueAccent,
        iconColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        borderColor: Colors.white,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onAction: () {
          purple.click();
        });

    FlatAdvancedRoundedSwitch blueRoundedAdvanced = FlatAdvancedRoundedSwitch(
        width: 20,
        height: 16,
        borderWidth: 0.5,
        canvasFColor: Colors.blue,
        canvasTColor: Colors.amberAccent,
        borderFColor: Colors.white30,
        borderTColor: Colors.redAccent,
        borderDColor: Colors.cyanAccent,
        borderUColor: Colors.cyan,
        iconFColor: Colors.white,
        iconTColor: Colors.red,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onDownAction: () {
          yellow.disable();
        },
        onUpAction: () {
          yellow.enable();
          purple.click();
        });

    FlatAdvancedSwitch blueAdvanced =FlatAdvancedSwitch(
      width: 16,
      height: 16,
      canvasFColor: Colors.blueAccent,
      canvasTColor: Colors.indigo,
      canvasDColor: Colors.blueGrey,
      canvasUColor: Colors.teal,
      iconFColor: Colors.white,
      iconTColor: Colors.white30,
      iconDColor: Colors.amber,
      iconUColor: Colors.amberAccent,
      T: Icons.accessible_forward_sharp,
      F: Icons.accessible_sharp,
      onUpAction: () {
        purple.enable();
        blueRoundedAdvanced.click();
      },
      onDownAction: () {
        purple.disable();
      },
    );

    FlatRoundedButton blueRoundedButton = FlatRoundedButton(
      width: 24,
      height: 16,
      canvasColor: Colors.blueAccent,
      canvasDisabledColor: Colors.blueGrey,
      canvasPressedColor: Colors.indigo,
      iconColor: Colors.limeAccent,
      iconDisabledColor: Colors.white70,
      iconPressedColor: Colors.redAccent,
      iconData: Icons.account_circle_outlined,
      iconDataPressed: Icons.account_circle_sharp,
      borderColor: Colors.limeAccent,
      borderPressedColor: Colors.redAccent,
      borderDisabledColor: Colors.blueGrey,
      onUpAction: () {
        purple.enable();
        blueRoundedAdvanced.click();
      },
      onDownAction: () {
        purple.disable();
      },
    );

    FlatTextRoundedButton textRoundedButton = FlatTextRoundedButton(
      width: 36,
      height: 12,
      canvasColor: Colors.blueAccent,
      canvasDisabledColor: Colors.blueGrey,
      canvasPressedColor: Colors.indigo,
      textColor: Colors.limeAccent,
      textDisabledColor: Colors.white70,
      textPressedColor: Colors.white,
      text: 'Dismiss',
      textPressed: 'Dismiss!',
      textDisabled: 'Out of order',
      borderColor: Colors.white70,
      borderPressedColor: Colors.white30,
      borderDisabledColor: Colors.blueGrey,
      borderWidth: 0.5,
      borderRadius: 8,
      onUpAction: () {
        purple.enable();
        blueRoundedAdvanced.click();
      },
      onDownAction: () {
        purple.disable();
      },
    );

    FlatTextButton textButton = FlatTextButton(
      width: 32,
      height: 12,
      canvasColor: Colors.blueAccent,
      canvasDisabledColor: Colors.blueGrey,
      canvasPressedColor: Colors.indigo,
      textColor: Colors.white,
      textDisabledColor: Colors.limeAccent,
      textPressedColor: Colors.white70,
      fontSize: 14,
      fontStyle: FontStyle.italic,
      onUpAction: () {
        blueRoundedButton.enable();
        textRoundedButton.enable();
      },
      onDownAction: () {
        blueRoundedButton.disable();
        textRoundedButton.disable();
      },
    );

    FlatButton pinkButton = FlatButton(
      width: 24,
      height: 16,
      canvasColor: Colors.pinkAccent,
      canvasDisabledColor: Colors.blueGrey,
      canvasPressedColor: Colors.indigo,
      iconColor: Colors.blue,
      iconDisabledColor: Colors.black12,
      iconPressedColor: Colors.redAccent,
      iconData: Icons.agriculture_outlined,
      iconDataPressed: Icons.agriculture_sharp,
      onUpAction: () {
        blueRoundedButton.enable();
        textButton.enable();
      },
      onDownAction: () {
        blueRoundedButton.disable();
        textButton.disable();
      },
    );

    FlatRoundedSwitch redRoundedBottom = FlatRoundedSwitch(
        width: 12,
        height: 8,
        borderWidth: 0.2,
        borderRadius: 4,
        borderColor: Colors.redAccent,
        iconColor: Colors.redAccent,
        T: Icons.deblur_outlined,
        F: Icons.deblur_sharp,
        onAction: () {});

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
                blueAdvanced,
                blueRoundedAdvanced,
                blueRoundedButton,
                pinkButton,
              ]),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                textButton,
                textRoundedButton,
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
                iconColor: Colors.yellow,
                T: Icons.cloud_queue_sharp,
                F: Icons.cloud_off_sharp,
                onAction: () {
                  blueAdvanced.disable();
                  blueRoundedAdvanced.disable();
                }),
            FlatSwitch(
                width: 12,
                height: 8,
                iconColor: Colors.orangeAccent,
                T: Icons.lock_open_sharp,
                F: Icons.lock_outline_sharp,
                onAction: () {
                  blueRoundedAdvanced.enable();
                  blueAdvanced.enable();
                }),
            FlatAdvancedSwitch(
                width: 12,
                height: 8,
                iconFColor: Colors.white30,
                iconTColor: Colors.white70,
                T: Icons.diamond_outlined,
                F: Icons.diamond_sharp,
                onUpAction: () {}),
            const SizedBox(
              width: 32,
            ),
            FlatAdvancedRoundedSwitch(
                width: 12,
                height: 8,
                borderWidth: 0.2,
                borderFColor: Colors.white,
                borderTColor: Colors.cyan,
                iconFColor: Colors.white,
                iconTColor: Colors.cyan,
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
                iconFColor: Colors.lightGreenAccent,
                iconTColor: Colors.lightGreen,
                T: Icons.eco_outlined,
                F: Icons.eco_sharp,
                onDownAction: () {
                  redRoundedBottom.disable();
                },
                onUpAction: () {
                  redRoundedBottom.enable();
                }),
            const SizedBox(
              width: 8,
            ),
            redRoundedBottom,
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
