import 'periodic_action.dart';
import 'widgets/flat_switch.dart';
import 'package:flutter/material.dart';

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
          color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic)),
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
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.yellow,
      width: 20,
      height: 16,
      T: Icons.toggle_on_outlined,
      F: Icons.toggle_off_outlined,
      onAction: () {
      },
    );

    FlatSwitch purple =
    FlatSwitch(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
        T: Icons.toggle_on_outlined,
        F: Icons.toggle_off_outlined,
        onAction: () {
          yellow.click();
        }
    );

    FlatSwitch blue =
    FlatSwitch(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.blueGrey.shade100,
        width: 20,
        height: 16,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatSwitch(
                        backgroundColor: Colors.blueGrey.shade100,
                        foregroundColor: Colors.blueAccent,
                        width: 20,
                        height: 16,
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
            ],
          ),
        ),
      ),
    );
  }

  void onStartStop(final FlatSwitch blue) {
    _startStop = !_startStop;
    if (_startStop) {
      obtain.start(blue.click);
    } else {
      obtain.stop();
    }
  }
}
