import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  String displayText = '';
  String removeLastCharacter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input.substring(0, input.length - 1);
  }
  Widget buttonCalc(String text, Color btnColor, Color txtColor){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          displayText = displayText + text;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        backgroundColor: btnColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
          color: txtColor,
        ),
      ),
    );
  }

  Widget buttonCalcDEL(String text, Color btnColor, Color txtColor, bool all){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          setState(() {
            if (all){
              displayText = "";
            } else{
              displayText = removeLastCharacter(displayText);
            }
          });
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        backgroundColor: btnColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
          color: txtColor,
        ),
      ),
    );
  }

  Widget buttonCalcEqual(String text, Color btnColor, Color txtColor){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          setState(() {
            displayText = displayText.interpret().toString();
          });
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        backgroundColor: btnColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  displayText,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonCalc("1", Colors.black54, Colors.white),
                buttonCalc("2", Colors.black54, Colors.white),
                buttonCalc("3", Colors.black54, Colors.white),
                buttonCalc("+", Colors.black54, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonCalc("4", Colors.black54, Colors.white),
                buttonCalc("5", Colors.black54, Colors.white),
                buttonCalc("6", Colors.black54, Colors.white),
                buttonCalc("-", Colors.black54, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonCalc("7", Colors.black54, Colors.white),
                buttonCalc("8", Colors.black54, Colors.white),
                buttonCalc("9", Colors.black54, Colors.white),
                buttonCalc("*", Colors.black54, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonCalc("0", Colors.black54, Colors.white),
                buttonCalc(".", Colors.black54, Colors.white),
                buttonCalcDEL("DEL", Colors.redAccent, Colors.black,false),
                buttonCalc("/", Colors.black54, Colors.white),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonCalcDEL("C", Colors.redAccent, Colors.black, true),
                buttonCalcEqual("=", Colors.green, Colors.black)
        
              ],
            ),
          ],
        ),
      ),
    );
  }
}
