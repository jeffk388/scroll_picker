library scroll_picker;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


typedef CallbackString =void Function(String data);

class ScrollPicker extends StatefulWidget {
  const ScrollPicker({super.key,
    this.title='Pick',                     //Title of dialog 
    required this.dataArray,               //String list of data,  ['A', 'B','C']
    required this.currentSelection,         // current value of selection, 'A'
    required this.fontSizeList,             //fontSize of List item
    required this.fontSizeTitle,            //fontSize of Title & Confirm
    this.scrollLines=5,                     // Count of rows in scrollView  5 (def) 7
    this.colorTextDisplay='#FFFFFFff',                // text color for the selected & display on your view
    this.colorText='#FFFFFFff',             // Text color of List item, title, and confirm
    this.colorIcon='#FF5020f0',             // Cancel icon color
    this.colorBoxWhole='#205040e0',         //'#102090f0',  background color of the whole dialog box
    this.colorScroll='#10203070',           // background of Scroll list box
    this.colorSelected='#50505090',         // background og selected item
    this.colorUnSelected='#50505000',       // background of unselected items
    required this.callback,                 // callback fn to take String as a return, void callbackParent(val) {setState(){selParent=val}}
    });
  final String title;
  final List<String> dataArray;
  final String currentSelection;
  final double fontSizeList;
  final double fontSizeTitle;
  final int scrollLines;
  final String colorTextDisplay;
  final String colorText;
  final String colorIcon;
  final String colorBoxWhole;
  final String colorScroll;
  final String colorSelected;
  final String colorUnSelected;
  final CallbackString callback;


  @override
  State<ScrollPicker> createState() => _ScrollPickerState();
}

class _ScrollPickerState extends State<ScrollPicker> {
  String? currentLocal;
  int? _selectedIndex;
  double heightScrollBox=150;
  double heightEachItem=30;


  @override
  void initState() {


    heightEachItem =widget.fontSizeList*1.8*1.1;
    heightScrollBox =heightEachItem*widget.scrollLines;

    currentLocal=widget.currentSelection;
    _selectedIndex =widget.dataArray.indexOf(currentLocal!);

    scrollToIndex();
    super.initState();
  }

  /// Wheel scroll
  /// 
  void scrollToIndex() {
    int indexTo=widget.dataArray.indexOf(currentLocal!);

    WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollControllerDial.animateToItem(indexTo,
                duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
      });
  }

    final FixedExtentScrollController scrollControllerDial =
        FixedExtentScrollController();

    @override
    void dispose() {
      scrollControllerDial.dispose();
      super.dispose();
    }
    /// Wheel scroll  END

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
        onTap:(){
           _dialogBuilder(context, widget.dataArray,currentLocal!); //arrayLocal
        },
        child: Text(widget.currentSelection,style:TextStyle(fontSize:widget.fontSizeTitle,color:stringToRGBO(widget.colorTextDisplay)),)
      );

  }


  Future<void> _dialogBuilder(BuildContext context,List<String> options,String currOption) {
    //String _selected =currOption;
    //int _selectedIndex=options.indexOf(currOption);
    scrollToIndex();
    return showDialog<void>(
      context: context,
      //anchorPoint:Offset(0, 10),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:(context, setState) {
            return AlertDialog(
            title: Text(widget.title,style:TextStyle(fontSize:widget.fontSizeTitle*1.0,color:stringToRGBO(widget.colorText)),),
            backgroundColor: stringToRGBO(widget.colorBoxWhole),//const Color.fromRGBO(10,10,150,0.99),
            content: Container(  // inneer box of Dialog
              height: heightScrollBox,//150,
              decoration:  BoxDecoration(color:stringToRGBO(widget.colorScroll)),
              child: kIsWeb ?
                SingleChildScrollView(
                  child: Column(
                    children: options.map((item){
                      return InkWell(
                        onTap:(){
                          Navigator.of(context).pop();
                        },
                        child: Text(item,style:const TextStyle(color:Color.fromRGBO(255,255,255,0.9)) ) );
                      } // options
                      ) // options
                      .toList(),
                    )
                )
                :
                ListWheelScrollView(  // if kIsWeb =false
                  itemExtent: heightEachItem,//30, 
                  controller: scrollControllerDial,
                  onSelectedItemChanged: (int index){
                    setState((){
                      //_selected =options[index];
                      _selectedIndex =index;
                      currentLocal =options[index];
                      //currentLocal =options[_selectedIndex!];
                      
                      //\logger.w('131 Future index curr =$_selectedIndex');
                      //scrollToIndex();
                    });
                    //widget.callback(options[index]);
                  },
                  physics: const FixedExtentScrollPhysics(),
                  children: options.map((item){
                    return InkWell(
                      onTap:(){
                        setState((){
                          //_selectedIndex=options.indexOf(item);
                          _selectedIndex =widget.dataArray.indexOf(item);//+2;
                          
                          currentLocal =item;
                        });
                        widget.callback(item);
                        Navigator.of(context).pop();
                      },
                      child:Container(
                        color:options.indexOf(item)==_selectedIndex! ? stringToRGBO(widget.colorSelected):stringToRGBO(widget.colorUnSelected),
                        width:double.infinity,
                        height:widget.fontSizeList*1.8,//20,
                        child: Center(child: Text(item,style:TextStyle( //options.indexOf(item)==_selectedIndex
                          fontSize:widget.fontSizeTitle,
                          color: item==options[_selectedIndex!] ? stringToRGBO(widget.colorText):stringToRGBO('${widget.colorText.substring(0,7)}70') ),))
                        ),
                    );
                    }) //options.map
                    .toList()
                  )
              ),

            actions: [
              InkWell(
                onTap:(){
                  widget.callback(widget.currentSelection);
                  currentLocal=widget.currentSelection;
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.cancel,size:widget.fontSizeTitle, color:stringToRGBO(widget.colorIcon))
              ),

              InkWell(
                onTap:(){
                  widget.callback(currentLocal!);
                  Navigator.of(context).pop();
                },
                child: Text('Confirm',style:TextStyle(color: stringToRGBO(widget.colorText),fontSize: widget.fontSizeTitle), )
              ),
            ],
          actionsAlignment:MainAxisAlignment.spaceAround,
          
          );
          },
          
        );
      }, //builder
    ); //showDialog
  } // Future


} //class _ScrollPickerState



Color stringToRGBO(String color) {
  int red =int.parse(color.substring(1,3),radix: 16);
  int green =int.parse(color.substring(3,5),radix: 16);
  int blue =int.parse(color.substring(5,7),radix: 16);
  double opacity =int.parse(color.substring(7),radix: 16)/255;
  return Color.fromRGBO(red,green,blue,opacity);
}