import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ios_keyboard_action/src/controller.dart';
import '../ios_keyboard_action.dart';

class IOSKeyboardAction extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final FocusNode focusNode;
  final IOSKeyboardActionType? iosKeyboardActionType;
  final Widget? child;
  final VoidCallback? onTap;

  ///Creates a IOSKeyboardAction that can be used to your text field to add a keyboard action above the system keyboard.
  ///
  ///The [iosKeyboardActionType] is the type of action that will be performed when the user taps the action button defaults to [IOSKeyboardActionType.done].
  ///The [backgroundColor] is the background color of the action button defaults to [Color(0xffeeeeed)].
  ///The [textColor] is the text color of the action button defaults to [Colors.black].
  ///The [focusNode] is the focus node that will be used to determine if the keyboard is visible.
  ///The [child] is the child widget that will be wrapped with the IOSKeyboardAction.
  ///The [onTap] is the callback that will be called when the user taps the action button.
  const IOSKeyboardAction({
    Key? key,
    required this.focusNode,
    this.backgroundColor,
    this.child,
    this.iosKeyboardActionType,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  _IOSKeyboardActionState createState() => _IOSKeyboardActionState();
}

class _IOSKeyboardActionState extends State<IOSKeyboardAction> {
  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: widget.backgroundColor ?? const Color(0xffeeeeed),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: VerticalDivider(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Controller.getFunctionAction(action: widget.iosKeyboardActionType!, focusNode: widget.focusNode);
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                    },
                    child: Text(
                      Controller.getTextAction(widget.iosKeyboardActionType!),
                      style: TextStyle(color: widget.textColor ?? Colors.black),
                    ),
                  )
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    widget.focusNode.addListener(() {
      if (Platform.isIOS) {
        if (widget.focusNode.hasFocus == true) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context)!.insert(_overlayEntry!);
        } else {
          _overlayEntry!.remove();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
