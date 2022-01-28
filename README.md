## Features

Easyly show an action button for the user above the iOS keyboard.

<img src="https://user-images.githubusercontent.com/36114317/151557005-58a87587-ba01-47c0-aa58-18003b573970.gif" width="360" height="740">

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
  label: 'Next field',
  focusNode: focusNode,
  focusActionType: FocusActionType.next,
  onTap: () => _showModal(context),
  child: TextField(
    decoration: const InputDecoration(
      labelText: 'Type something',
    ),
    focusNode: focusNode,
    keyboardType: TextInputType.number,
  ),
),
```
