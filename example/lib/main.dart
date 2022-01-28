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
      home: const MyHomePage(title: 'IOSKeyboardAction'),
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
  final nextFieldFocus = FocusNode();
  final previousFieldFocus = FocusNode();
  final doneFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IOSKeyboardAction(
                label: 'Next field',
                focusNode: nextFieldFocus,
                focusActionType: FocusActionType.next,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Next',
                  ),
                  focusNode: nextFieldFocus,
                  keyboardType: TextInputType.number,
                ),
              ),
              IOSKeyboardAction(
                label: 'Previous field',
                focusNode: previousFieldFocus,
                focusActionType: FocusActionType.previous,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Previous',
                  ),
                  focusNode: previousFieldFocus,
                  keyboardType: TextInputType.number,
                ),
              ),
              IOSKeyboardAction(
                focusNode: doneFieldFocus,
                focusActionType: FocusActionType.done,
                onTap: () => _showModal(context),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Done',
                  ),
                  focusNode: doneFieldFocus,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nextFieldFocus.dispose();
    doneFieldFocus.dispose();
    previousFieldFocus.dispose();
    super.dispose();
  }

  _showModal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: Text('Done pressed'),
          ),
        );
      });
}
