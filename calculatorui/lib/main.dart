import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double buttonSize = 24;
  double buttonMargin = 4.0;
  String currentNumber = "";
  String stack = "";
  List<List<String>> history = new List.empty(growable: true);
  Stacks stacks = new Stacks(List.empty(growable: true));
  late Calculator calculator;

  void numberPress(String num){
    setState(() {
      currentNumber += num;
    });
  }

  void commandPress(String com){
    calculator = new Calculator(stacks);
    setState(() {
      switch(com){
        case "UNDO":
          print(history);
          stacks.list = history.elementAt(history.length - 1);
          history.removeLast();
          break;
        case "SC":
          history.add([...stacks.list]);
          ClearStackCommand(stacks).execute();
          break;
        case "ENTER":
          history.add([...stacks.list]);
          PushToStackCommand(stacks, currentNumber).execute();
          currentNumber = "";
          break;
        case "+":
          history.add([...stacks.list]);
          String calcNum = AdditionCommand(calculator).execute();
          PopStackCommand(stacks).execute();
          PopStackCommand(stacks).execute();
          PushToStackCommand(stacks, calcNum).execute();
          break;
        case "-":
          history.add([...stacks.list]);
          String calcNum = SubtractionCommand(calculator).execute();
          PopStackCommand(stacks).execute();
          PopStackCommand(stacks).execute();
          PushToStackCommand(stacks, calcNum).execute();
          break;
        case "*":
          history.add([...stacks.list]);
          String calcNum = MultiplikationCommand(calculator).execute();
          PopStackCommand(stacks).execute();
          PopStackCommand(stacks).execute();
          PushToStackCommand(stacks, calcNum).execute();
          break;
        case "/":
          history.add([...stacks.list]);
          String calcNum = DivisionCommand(calculator).execute();
          PopStackCommand(stacks).execute();
          PopStackCommand(stacks).execute();
          PushToStackCommand(stacks, calcNum).execute();
          break;
      }
      stack = GetStackCommand(stacks).execute().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPN Caclulator"),
      ),
      body: Column(
        children: [
          Container(
              height: 260,
              width: (MediaQuery.of(context).size.width),
              alignment: Alignment.center,
              color: Color.fromARGB(100, 100, 25, 30),
              child: Text(stack)),
          Container(
              height: 80,
              width: (MediaQuery.of(context).size.width),
              alignment: Alignment.center,
              color: Color.fromARGB(100, 100, 25, 220),
              child: Text(currentNumber)),
          Container(
              height: 20,
              width: (MediaQuery.of(context).size.width),
              alignment: Alignment.center,
              color: Color.fromARGB(0, 0, 0, 0),
              child: Text("")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("UNDO");},
                      child: Text("UNDO"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("1");},
                      child: Text("1"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("4");},
                      child: Text("4"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("7");},
                      child: Text("7"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("SC");},
                      child: Text("SC"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("2");},
                      child: Text("2"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("5");},
                      child: Text("5"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("8");},
                      child: Text("8"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress(".");},
                      child: Text("."),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("3");},
                      child: Text("3"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("6");},
                      child: Text("6"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {numberPress("9");},
                      child: Text("9"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("+");},
                      child: Text("+"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("-");},
                      child: Text("-"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("*");},
                      child: Text("*"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(buttonMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(buttonSize)),
                      onPressed: () {commandPress("/");},
                      child: Text("/"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(buttonMargin),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                      )
                  )
              ),
              onPressed: () {commandPress("ENTER");},
              child: Text("ENTER"),
            ),
          ),
        ],
      ),
    );
  }
}
