import 'package:flutter/material.dart';
import 'package:ios_keyboard_action/ios_keyboard_action.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IOSKeyboardAction(
              focusNode: focusNode,
              iosKeyboardActionType: IOSKeyboardActionType.send,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: Text('Send pressed'),
                        ),
                      );
                    });
              },
              child: TextField(
                focusNode: focusNode,
                keyboardType: TextInputType.number,
              ),
            ),
            const TextField(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
