import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LockScreen(),
    );
  }
}

class LockScreen extends StatelessWidget {
  static const platform = MethodChannel('com.example.lockapp/navigation');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Locked')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call Kotlin method to intercept back button
            interceptBackButton();
          },
          child: Text('Intercept Back Button'),
        ),
      ),
    );
  }

  static Future<void> interceptBackButton() async {
    try {
      await platform.invokeMethod('interceptBackButton');
    } on PlatformException catch (e) {
      print("Failed to intercept back button: '${e.message}'.");
    }
  }

  // Implement similar methods for intercepting other buttons if needed
}
