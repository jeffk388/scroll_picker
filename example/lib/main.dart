import 'package:flutter/material.dart';

import 'package:scroll_picker/scroll_picker.dart';


//logger
/* import 'package:logger/logger.dart';

var logger =Logger(
  printer: PrettyPrinter()
);
 */


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
  //\\\ START fruit  picker example 
  List<String> options =['Apple', 'Kiwi', 'Blueberry', 'Mango','Orange','Pear'];
  String? currOption;

  void callbackOption(value) {
    setState((){
      currOption =value;

      //logger.i('043 curr_option ===$currOption');
    });
  }
  //\\\ END fruit  picker example 

  //\\\ START drink  picker example C-200 
  List<String> drinks =['pick drink','Coke', 'Diet Coke', 'Pepsi', 'Dr Pepper','Sprite','Pear'];
  String? currentDrink;

  void callbackDrink(value) {
    setState((){
      currentDrink =value;
    });
  }
  //\\\ END drink  picker example 

  @override
  void initState() {
    setState((){
      currOption =currOption  ?? options[0];//:currOption; C-100
      currentDrink =currentDrink ?? drinks[0]; // C-200 
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Scroll Picker, String list')),
      body: 
        Container(
          width:double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height:50),
          
              Container(
                //width: double.infinity,
                //decoration: BoxDecoration(color:stringToRGBO('#106070f0'),borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(5),
                child: ScrollPicker(dataArray: options, currentSelection: currOption!, fontSizeList: 20,fontSizeTitle:18,callback: callbackOption)
                ),
          
              const SizedBox(height:50),
          
              // C-200
              Container(
                decoration: BoxDecoration(color:stringToRGBO('#106070f0'),borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(5),
                child: ScrollPicker(dataArray: drinks, currentSelection: currentDrink!, fontSizeList: 20,fontSizeTitle:18,
                  callback: callbackDrink,
                  colorTextDisplay: '#FFFFFFff',  // color of the text selected, default = the color of "Apple" shown above 
                  scrollLines: 7, // def=5
                  )
                ),
          
              //Text(currOption!,style:const TextStyle(color:Color.fromRGBO(10,10,20,1.0))),
            ],
          ),
        )
        
      );
  } //Widget build(Buil
}  //class _ScrollPickerMainState 

