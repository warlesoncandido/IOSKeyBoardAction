## Features

Easyly show an action button for the user above the iOS keyboard.

https://user-images.githubusercontent.com/36114317/151556331-b933a156-de5a-4711-8b51-c89a979a8b07.mp4

#### Depend on it

Add the package on the pubspec.yaml
```yaml
dependencies:
  ios_keyboard_action: ^0.0.2
```
#### Import it

```dart
  import 'package:ios_keyboard_action/ios_keyboard_action.dart';
```

#### Use it

```dart
IOSKeyboardAction(
  focusNode: focusNode,
  iosKeyboardActionType: IOSKeyboardActionType.send,
  onTap: () {
    // Do the awesome thing you need to be done.
  },
  child: TextField(
    focusNode: focusNode,
    keyboardType: TextInputType.number,
  ),
),
```
