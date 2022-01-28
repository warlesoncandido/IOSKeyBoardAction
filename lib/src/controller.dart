import 'package:flutter/material.dart';

import '../ios_keyboard_action.dart';

class Controller {
  /// Mapper for the [getActionTypeLabel]
  static const _stringsMapper = {
    FocusActionType.done: 'Done',
    FocusActionType.next: 'Next',
    FocusActionType.previous: 'Previous',
  };

  /// Based on the [FocusActionType] returns the default [String] to the button action.
  static String getActionTypeLabel(FocusActionType action) =>
      _stringsMapper[action]!;

  /// Based on the [FocusActionType] determines what to do with the [FocusNode].
  static getFunctionAction(
      {required FocusActionType action, required FocusNode focusNode}) {
    switch (action) {
      case FocusActionType.done:
        return focusNode.unfocus();
      case FocusActionType.next:
        return focusNode.nextFocus();
      case FocusActionType.previous:
        return focusNode.previousFocus();
      default:
        return focusNode.unfocus();
    }
  }
}
