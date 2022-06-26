// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      home: ProfileBox(),
    ),
  );
}

class ProfileBox extends StatefulWidget {
  @override
  _ProfileBoxState createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  List<Widget> MyList = [];
  void createList() {
    for (int i = 0; i < 20; i++) {
      MyList.add(getCard());
    }
  }

  @override
  void initState() {
    super.initState();
    createList();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.4;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: !closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: !closeTopContainer ? 0 : size.height * .08,
                alignment: Alignment.topCenter,
                width: size.width,
                child: Container(
                  color: Color.fromRGBO(96, 9, 100, 1),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              "2022-01",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              "Expense : 1000",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Income : 4000",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: closeTopContainer ? 0 : categoryHeight,
              //alignment: Alignment.topCenter,
              width: size.width,
              child: Container(
                color: Color.fromRGBO(96, 9, 100, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "2022-02 Balance",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "3000",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Expense : 1000",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Income : 4000",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Budget Setting",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Color.fromRGBO(238, 238, 238, 1.0),
                                height: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: MyList.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MyList[index];
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget getCard() {
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: [
          Card(
              color: Colors.grey[300],
              child: ListTile(
                  title: Text("Jan 30,2022"),
                  trailing: Text("Expense: 1500.0"))),
          Card(
              child: ListTile(
                  title: Text("Food"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/food.png')),
                  trailing: Text("500.0"))),
          Card(
              child: ListTile(
                  title: Text("Entertainment"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/entertainment.png')),
                  trailing: Text("500.0"))),
          Card(
              child: ListTile(
                  title: Text("Health"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/health.png')),
                  trailing: Text("500.0"))),
        ],
      ),
    );
  }
}
