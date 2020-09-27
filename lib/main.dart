import 'package:flutter/material.dart';
import 'package:myapp/Logic.dart';

void main() {
  runApp(InteractiveStory());
}
Logic appLogic = Logic();
class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainView(),
    );
  }
}

var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkBlue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Card (
                color: blue,
                child: Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        appLogic.getStory()[0],
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )
                    ),
                  ),
                ),
              ),
            ),
            choiceButton(context, appLogic.getStory()[1], () {
              setState(() {
                appLogic.nextStory(1);
              });
            }, orange, true),
            choiceButton(context, appLogic.getStory()[2], () {
              setState(() {
                appLogic.nextStory(2);
              });
            }, orange, appLogic.isVisible()),
            choiceButton(context, appLogic.getStory()[3], () {
              setState(() {
                appLogic.nextStory(3);
              });
            }, orange,  appLogic.isVisible()),
          ],
        ),
      ),
    );
  }
}
Widget choiceButton(context, title, onpress, color, visibilty) {
  return Container (
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(bottom: 10.0),
    height: 70,
    child: Visibility(
      visible: visibilty,
      child: RaisedButton(
        color: color,
        onPressed: onpress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        )
      )
    ),
  );
}