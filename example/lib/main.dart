import 'package:device_preview/device_preview.dart';
import 'package:example/sizeApp/screen_size_extension.dart';
import 'package:example/sizeApp/size_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    // const MyApp(),
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeBuilder(
      baseSize: const Size(375, 812), // Reference design size
      height: context.screenHeight, // Use the screen height from the extension
      width: context.screenWidth, // Use the screen width from the extension
      child: const MyAppWidget(),
    );
  }
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: context.getFontSize(22), // Adjust the font size
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: EdgeInsets.all(
            context.safePadding.top + 20,
          ), // Use safe padding
          width: context.screenWidth, // Use responsive width
          height: context.screenHeight, // Use responsive height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: context.getHeight(80), // Responsive height
                width: context.getWidth(250), // Responsive width
                alignment: Alignment.center,
                color: Colors.blue[200],
                child: Text(
                  'Here is a responsive text',
                  style: TextStyle(fontSize: context.getFontSize(18)),
                ),
              ),

              SizedBox(
                width: context.getWidth(100),
                height: context.getHeight(100),
              ),

              Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: context.getFontSize(18)),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
