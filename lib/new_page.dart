import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'halfscreen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new_page(),
    );
  }
}

class new_page extends StatefulWidget {
  const new_page({Key? key}) : super(key: key);

  @override
  State<new_page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<new_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
          backgroundColor: Color.fromRGBO(96, 9, 100, 1),
          elevation: 0,
          actions: [
            Icon(Icons.checklist),
          ],
          leading: Icon(Icons.arrow_back),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Color.fromRGBO(
                  96,
                  9,
                  100,
                  1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.ac_unit),
                    ),
                    Text(
                      "500.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                height: 70,
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(171, 204, 203, 203),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                height: 300,
              ),
            ),
          ],
        ));
  }
}

void bottomSheets(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(children: [Text("Here")]),
    ),
  );
}
