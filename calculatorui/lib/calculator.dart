import 'dart:io';

abstract class Command{
  execute();
}

//#region Stack
class Stacks{
  List<String> list;
  void Push(String numOrOpp){
    list.add(numOrOpp);
  }
  void Pop(){
    list.removeLast();
  }
  void Clear(){
    list = List.empty(growable: true);
  }
  List<String> getStack(){
    return list;
  }
  String Peek(){
    return list.last;
  }
  Stacks(this.list);
}

class PushToStackCommand implements Command{
  Stacks stack;
  String numOrOpp;
  PushToStackCommand(this.stack, this.numOrOpp);

  @override
  execute() {
    stack.Push(numOrOpp);
  }
}
class PopStackCommand implements Command{
  Stacks stack;
  PopStackCommand(this.stack);

  @override
  execute() {
    stack.Pop();
  }
}
class ClearStackCommand implements Command{
  Stacks stack;
  ClearStackCommand(this.stack);
  @override
  execute() {
    stack.Clear();
  }
}
class PeekStackCommand implements Command{
  Stacks stack;
  PeekStackCommand(this.stack);

  @override
  String execute() {
    return stack.Peek();
  }
}
class GetStackCommand implements Command{
  Stacks stack;
  GetStackCommand(this.stack);

  @override
  List<String> execute() {
    return stack.getStack();
  }
}
//#endregion

//#region Calculator

class Calculator{
  Stacks stack;

  Calculator(this.stack);

  String Addition(String a, String b){
    double? doubleA = double.tryParse(a);
    double? doubleB = double.tryParse(b);
    return (doubleA! + doubleB!).toString();
  }
  String Subtraction(String a, String b){
    double? doubleA = double.tryParse(a);
    double? doubleB = double.tryParse(b);
    return (doubleA! - doubleB!).toString();
  }
  String Multiplikation(String a, String b){
    double? doubleA = double.tryParse(a);
    double? doubleB = double.tryParse(b);
    return (doubleA! * doubleB!).toString();
  }
  String Division(String a, String b){
    double? doubleA = double.tryParse(a);
    double? doubleB = double.tryParse(b);
    return (doubleA! / doubleB!).toString();
  }
  String Enter(String a){
    PushToStackCommand(stack, a).execute();
    return a;
  }
}

class AdditionCommand implements Command{
  Calculator calculator;
  AdditionCommand(this.calculator);

  @override
  String execute() {
    return calculator.Addition(calculator.stack.list.last, calculator.stack.list.elementAt(calculator.stack.list.length - 2));
  }
}
class SubtractionCommand implements Command{
  Calculator calculator;
  SubtractionCommand(this.calculator);

  @override
  String execute() {
    return calculator.Subtraction(calculator.stack.list.last, calculator.stack.list.elementAt(calculator.stack.list.length - 2));
  }
}
class MultiplikationCommand implements Command{
  Calculator calculator;
  MultiplikationCommand(this.calculator);

  @override
  String execute() {
    return calculator.Multiplikation(calculator.stack.list.last, calculator.stack.list.elementAt(calculator.stack.list.length - 2));
  }
}
class DivisionCommand implements Command{
  Calculator calculator;
  DivisionCommand(this.calculator);

  @override
  String execute() {
    return calculator.Division(calculator.stack.list.last, calculator.stack.list.elementAt(calculator.stack.list.length - 2));
  }
}
class EnterCommand implements Command{
  Calculator calculator;
  String a;
  EnterCommand(this.calculator, this.a);

  @override
  String execute() {
    return calculator.Enter(a);
  }
}

//#endregion