<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

The package scroll_picker is to help in picking an option out of String array/list.
It shows wheel scroll view on top of your view like a modal. The cursor moves to the current selection. Picking a new option is either by clicking the "confirm" button or directly clicking the item desired.
The selected item is returned via the callback function.

START_SECTION:buy-me-a-coffee
https://buymeacoffee.com/jeffk388
END_SECTION:buy-me-a-coffe

## Features
- Easy iplementation to pick an option from a list of String.
- Support multiple item lines, 5 is good, 7, 9 are options.
- The pack inclue a funtion returning Color.fromRGBO from hex string like '#F0605Ff0', 
    ```dart
    color: stringToRGBO('#FFFFFFff'),
    ```


![frontScreen](https://github.com/jeffk388/scroll_picker/blob/main/shot_button.png)
![frontScreen](https://github.com/jeffk388/scroll_picker/blob/main/shot_with_scroll.png)




## Getting started

Github provide an example.

## Usage
Add to the pubspec.yaml:
```dart
flutter pub add scroll_picker
```
Import the package:
```dart
import 'package:scroll_picker/scroll_picker.dart';
```
- The parent widget calling the package should be STATEFUL
- declare your local currentPick and String List:
    \_ eg:
    ```dart
    List<String> options=['Apple','Kiwi', 'Tomato','Pear'];
    String currentOption =options[0];
    ```
- make and pass a callback funtion to take the selected item (val) from the package:
    ```dart
    void callbackString(val) {
        setState((){
            currentOption =val;
        });
    }
    ```
\_ when an item on the wheel is clicked or the confirm button is clicked, 
    currentOption is updated in the parent Widget, and the currentOption appear on the box the ScrollPicker() is located.

    ```dart
        ...
        Column(chidren:[
            ...
            ScrollPicker(dataArray: options, currentSelection: currOption!, fontSizeList: 20,       fontSizeTitle:18,  callback: callbackString),
            ...
        ]),
        ...
    ```
    The button-like currentPick is displayed at the spot of ScrollPicker().



## Additional information

Please refer my Github site for details.
# scroll_picker
