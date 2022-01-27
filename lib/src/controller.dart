import 'package:flutter/material.dart';

import '../ios_keyboard_action.dart';

class Controller {
  static String getTextAction(IOSKeyboardActionType action) {
    switch (action) {
      case IOSKeyboardActionType.done:
        return "Done";
      case IOSKeyboardActionType.next:
        return "Next";
      case IOSKeyboardActionType.search:
        return "Search";
      case IOSKeyboardActionType.send:
        return "Send";
      default:
        return "Done";
    }
  }

  static getFunctionAction(
      {IOSKeyboardActionType? action, FocusNode? focusNode}) {
    switch (action) {
      case IOSKeyboardActionType.done:
        return focusNode!.unfocus();
      case IOSKeyboardActionType.next:
        return focusNode!.nextFocus();
      case IOSKeyboardActionType.search:
        return focusNode!.unfocus();
      case IOSKeyboardActionType.send:
        return focusNode!.unfocus();
      default:
        return focusNode!.unfocus();
    }
  }
}
