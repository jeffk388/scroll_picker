# example

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## The package scroll_picker is to help in picking an option out of String array/list.
It shows wheel scroll view on top of your view like a modal. It moves to the current selection. Picking a new option is either by clicking the "confirm" button or directly clicking the item desired. 
# Usage 
- The parent widget calling the package should be STATEFUL
- declare your local currentPick and String List:
    \_ eg:
    List<String> fruitOptions=['Apple',''Kiwi', 'Tomato','Pear'];
    String currentPick =fruitOptions[0];
- pass callback funtion to take the selected item:
    String myCurrentPick =
    void callbackString(val) {
        setState((){
            currentPick =val;
        });
    }
\_ when an item on the wheel is clicked or the confirm button is clicked, 
    currentPick is updated