import 'package:flutter_test/flutter_test.dart';

import 'package:scroll_picker/scroll_picker.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



//logger
import 'package:logger/logger.dart';

var logger =Logger(
  printer: PrettyPrinter()
);

/// Flutter code sample for [showDialog].
/// 
//int _selectedIndex=0;

void main() => runApp(
    const ScrollPickerExample()
  );

class ScrollPickerExample extends StatelessWidget {
  const ScrollPickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DialogExample(),
    );
  }
}

class DialogExample extends StatefulWidget {
  const DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  List<String> options =['Apple', 'Kiwi', 'Blueberry', 'Mango','Orange','Pear'];
  String? currOption;
  

  void callbackOption(value) {
    setState((){
      currOption =value;
      logger.i('043 curr_option ===$currOption');
    });
  }
  @override
  void initState() {
    setState((){
      currOption =currOption  ?? options[0];//:currOption;
    });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width:50),
                Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(color:stringToRGBO('#106070f0'),borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(5),
                  child: ScrollPicker(dataArray: options, currentSelection: currOption!, fontSizeList: 20,fontSizeTitle:18,callback: callbackOption)),
              ],
            ),

            Text(currOption!,style:const TextStyle(color:Color.fromRGBO(10,10,20,1.0))),
          ],
        );
  }
}