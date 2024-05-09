import 'widgets/button_widget.dart';
import 'widgets/icon_widget.dart';
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
    home:const AppHomePage(title: 'Flutter (BLoC) k-State-Button'),
    );
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key, required this.title});

  final String title;

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

    ButtonWidget yellow =
    ButtonWidget(
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.yellow,
      width: 24,
      height: 16,
      T: Icons.toggle_on_outlined,
      F: Icons.toggle_off_outlined,
      //iDone: null,
      onAction: () {},
    );

    ButtonWidget purple =
    ButtonWidget(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.blueGrey.shade100,
        width: 24,
        height: 16,
        T: Icons.toggle_on_outlined,
        F: Icons.toggle_off_outlined,
        //iDone: null,
        onAction: () {
          yellow.done();
        }
    );

    ButtonWidget blue =
    ButtonWidget(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.blueGrey.shade100,
        width: 24,
        height: 16,
        T: Icons.access_alarm,
        F: Icons.access_time,
        //iDone: null,
        onAction: () {
          purple.done();
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
              const SizedBox(height: 16.0),
              IconTileWidget(
                  tileColor: Colors.blueGrey.shade300,
                  iconColor: Colors.amber.shade200),
              const SizedBox(height: 16.0),
              IconTileWidget(
                  tileColor: Colors.blueGrey.shade200,
                  iconColor: Colors.purple.shade300),
              const SizedBox(height: 16.0),
              ButtonWidget(
                  backgroundColor: Colors.blueGrey.shade100,
                  foregroundColor: Colors.blueAccent,
                  width: 24,
                  height: 16,
                  T: Icons.pause_sharp,
                  F: Icons.play_arrow_sharp,
                  //iDone: null,
                  onAction: () {}
              ),
              const SizedBox(height: 16.0),
                blue,
              const SizedBox(height: 16.0),
              // ButtonWidget(
              //   backgroundColor: Colors.deepPurple,
              //   foregroundColor: Colors.blueGrey.shade100,
              //   width: 24,
              //   height: 16,
              //   T: Icons.toggle_on_outlined,
              //   F: Icons.toggle_off_outlined,
              //   iDone: null,
              //   onAction: () {
              //     yellow.done();
              //   }
              // ),
                purple,
              const SizedBox(height: 16.0),
                yellow,
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
