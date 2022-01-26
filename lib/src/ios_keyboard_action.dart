import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ios_keyboard_action/src/controller.dart';
import '../ios_keyboard_action.dart';

class IOSKeyboardAction extends StatefulWidget {
  final Widget? child;
  final FocusNode? focusNode;
  final IOSKeyboardActionType? iosKeyboardActionType;
  final Color? backgroundColor;
  final Color? textColor;

  final Function()? onTap;
  const IOSKeyboardAction({
    Key? key,
    this.child,
    this.focusNode,
    this.iosKeyboardActionType,
    this.backgroundColor,
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
                      Controller.getFunctionAction(
                          action: widget.iosKeyboardActionType!,
                          focusNode: widget.focusNode);
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
    widget.focusNode!.addListener(() {
      if (Platform.isIOS) {
        if (widget.focusNode!.hasFocus == true) {
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
