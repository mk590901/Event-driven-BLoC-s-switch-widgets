import 'package:flutter/material.dart';
import 'periodic_action.dart';
import 'widgets/flat_advanced_rounded_switch.dart';
import 'widgets/flat_advanced_switch.dart';
import 'widgets/flat_switch.dart';
import 'widgets/flat_rounded_switch.dart';
import 'interfaces/i_click.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
    useMaterial3: true,
        ),
    home: AppHomePage(title: 'Flutter (BLoC) k-State Switch'),
    );
  }
}

class AppHomePage extends StatelessWidget {
  AppHomePage({super.key, required this.title});

  static const int FREQ = 500; // 0.5s

  final String title;
  bool _startStop = false;

  final PeriodicAction obtain = PeriodicAction(const Duration(milliseconds: FREQ));

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(title, style: const TextStyle(
          color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
            blurRadius: 8.0,
            color: Colors.indigo,
            offset: Offset(3.0, 3.0),
          ),
        ],
      )),
      leading: IconButton(
        icon: const Icon(Icons.extension_outlined, color: Colors.white), // Icon widget
        onPressed: () {
          // Add your onPressed logic here
        },
      ),
      backgroundColor: Colors.lightBlue,
    );

    FlatSwitch yellow =
    FlatSwitch(
      canvasColor: Colors.deepOrangeAccent,
      imageColor: Colors.yellow,
      width: 20,
      height: 16,
    );

    FlatSwitch purple =
    FlatSwitch(
        canvasColor: Colors.deepPurple,
        imageColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        onAction: () {
          yellow.click();
        }
    );

    FlatRoundedSwitch blue =
    FlatRoundedSwitch(
        canvasColor: Colors.blueAccent,
        imageColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        borderColor: Colors.white,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onAction: () {
          purple.click();
        }
    );

    FlatAdvancedRoundedSwitch blueAdvanced =
    FlatAdvancedRoundedSwitch(
        width: 20,
        height: 16,
        borderFColor: Colors.blueGrey,
        imageFColor: Colors.blueGrey,
        T: Icons.access_alarm,
        F: Icons.access_time,
        onAction: () {
          purple.click();
        }
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatRoundedSwitch(
                        width: 16,
                        height: 16,
                        borderRadius: 8,
                        T: Icons.pause_sharp,
                        F: Icons.play_arrow_sharp,
                        onAction: () {
                          onStartStop(blue);
                        }
                    ),
                    blue,
                    purple,
                    yellow,
                  ]),
              const SizedBox(height: 16,),
              ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                          //onStartStop(blue);
                          blueAdvanced.click();
                        }
                    ),
                    blueAdvanced,
                    // purple,
                    // yellow,
                  ]),
              const SizedBox(height: 16,)


            ],
          ),
        ),
      ),
    );
  }

  void onStartStop(final IClick iClick) {
    _startStop = !_startStop;
    if (_startStop) {
      obtain.start(iClick.click);
    } else {
      obtain.stop();
    }
  }
}
