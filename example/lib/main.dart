import 'package:flutter/material.dart';

import 'package:scroll_picker/scroll_picker.dart';


//logger
import 'package:logger/logger.dart';

var logger =Logger(
  printer: PrettyPrinter()
);



void main() => runApp(
    const ScrollPickerExample()
  );

class ScrollPickerExample extends StatelessWidget {
  const ScrollPickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollPickerMain(),
    );
  }
}

class ScrollPickerMain extends StatefulWidget {
  const ScrollPickerMain({super.key});

  @override
  State<ScrollPickerMain> createState() => _ScrollPickerMainState();
}

class _ScrollPickerMainState extends State<ScrollPickerMain> {
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

    return Scaffold(
      appBar: AppBar(title: const Text('Scroll Picker, String list')),
      body: 
        Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height:50),

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

            const SizedBox(height:50),

            Text(currOption!,style:const TextStyle(color:Color.fromRGBO(10,10,20,1.0))),
          ],
        )
        
      );
  } //Widget build(Buil
}  //class _ScrollPickerMainState 

