// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';
import 'new_page.dart';

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
  int index = 0;
  final Screens = [MyHome(), Mello(), shello()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Welcome'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      body: Screens[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(96, 9, 100, 1),
        child: Icon(Icons.add, color: Colors.white, size: 40),
        //child widget inside this button
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 214, 136, 228),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: Duration(seconds: 2),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(
                  Icons.home_filled,
                  color: Color.fromRGBO(96, 9, 100, 1),
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.menu),
                selectedIcon: Icon(
                  Icons.menu,
                  color: Color.fromRGBO(96, 9, 100, 1),
                ),
                label: ''),
            NavigationDestination(
                icon: Icon(Icons.camera),
                selectedIcon: Icon(
                  Icons.camera,
                  color: Color.fromRGBO(96, 9, 100, 1),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  String email = "gmail@email.com";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 9, 100, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text('Detail'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //code to execute when this button is pressed
              }),

          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                //code to execute when this button is pressed
              }),

          //more widgets to place here
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/food.png'), // no matter how big it is, it won't overflow
                    ),
                    title: const Text(
                      'Food',
                      textScaleFactor: 1,
                    ),
                    trailing: const Text("500.0"),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.category, color: Colors.black),
                    title: const Text(
                      'Category',
                      textScaleFactor: 1,
                    ),
                    trailing: const Text("Expenses"),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_month_rounded,
                        color: Colors.black),
                    title: const Text(
                      'Date',
                      textScaleFactor: 1,
                    ),
                    trailing: const Text("Jan 30,2022"),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.edit_outlined, color: Colors.black),
                    title: const Text(
                      'Remark',
                      textScaleFactor: 1,
                    ),
                    trailing: const Text("hello"),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new_page()));
            },
            icon: Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                    Icon(Icons.edit_outlined)), //icon data for elevated button
            label: Padding(
              padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
              child: Text("EDIT"),
            ), //label text
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(
                  96, 9, 100, 1), //elevated btton background color
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
