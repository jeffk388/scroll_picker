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

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features
The package scroll_picker is to help in picking an option out of String array/list.
It shows wheel scroll view on top of your view like a modal. The cursor moves to the current selection. Picking a new option is either by clicking the "confirm" button or directly clicking the item desired.
The selected item is returned via the callback function.

<!-- TODO: List what your package can do. Maybe include images, gifs, or videos. -->

![]()


## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage
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

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
# scroll_picker
