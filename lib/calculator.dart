// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String btn0='0';
  String eqution='0';
  String result="0";
  double expression=0;


  buttonPress(String btnText){
    setState(() {

      if(btnText=="C"){
        eqution='0';
        result ='0';

      }else if(btnText=='⌫'){
        eqution=eqution.substring(0, eqution.length-1);
        if(eqution==''){
          eqution='0';
        }
        

      }else if(btnText=='='){

        try{
          Parser p = Parser();
          Expression exp = p.parse(eqution);

          ContextModel cm= ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          result='$eval';


        }catch(e){
          result='Error';
        }
        

      }else{
        if(eqution=='0'){
          eqution=btnText;
        }
        else
        {
          eqution=eqution+btnText;
        }
        
      }
      
    });
  }


  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => buttonPress(btnText),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
      style: ElevatedButton.styleFrom(
        
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                
                    Padding(
                      
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        eqution,
                        //textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),

                    Padding(
                      
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        result,
                        //textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                    ),
                  
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("⌫", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8", (Colors.grey[850])!, Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("*", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 numButton("0", (Colors.grey[850])!, Colors.white),
                  numButton("00", (Colors.grey[850])!, Colors.white),
                numButton(".", (Colors.grey[850])!, Colors.white),
                numButton("=", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
