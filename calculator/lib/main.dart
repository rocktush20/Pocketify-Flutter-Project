import 'package:flutter/material.dart';
//import 'package:math_expressions.dart';

void main() {
  runApp(Calculator());
}

//Buttons

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget Buttons(String value, Color color) {
    return SizedBox(
      height: 60,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          ButtonPressed(value);
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  Widget Backspace() {
    return SizedBox(
      height: 60,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            CurrentTotal = CurrentTotal.substring(0, CurrentTotal.length - 1);
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyanAccent)),
        child: Icon(Icons.backspace),
      ),
    );
  }

  // Operations
  double Total = 0;
  String CurrentTotal = '';
  double number1 = 0;
  double number2 = 0;
  String operand = " ";
  ButtonPressed(String value) {
    setState(() {
      CurrentTotal += value;
    });
  }

  void Confirm() {
    String equation = CurrentTotal;
    equation = equation.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(equation); 
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL,cm);
    setState(() {
       Total = eval;
    
    });
   
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    CurrentTotal.toString() + '\n' + Total.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
                  FloatingActionButton(
                    child: Icon(Icons.add_task),
                    
                    tooltip: 'Confirm',
                    splashColor: Colors.orangeAccent,
                    backgroundColor: Colors.purpleAccent,
                    onPressed: Confirm,
                  )
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('8', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('7', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('9', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('+', Colors.greenAccent)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('4', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('5', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('6', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('-', Colors.greenAccent)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('1', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('2', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('3', Colors.cyanAccent),
                  SizedBox(width: 5),
                  Buttons('x', Colors.greenAccent),
                ],
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Backspace(),
                SizedBox(width: 5),
                Buttons('0', Colors.cyanAccent),
                SizedBox(width: 5),
                Buttons('.', Colors.cyanAccent),
                SizedBox(width: 5),
                Buttons('/', Colors.greenAccent),
              ]),
            ]),
          ),
        ),
      ),
    ));
  }
}
