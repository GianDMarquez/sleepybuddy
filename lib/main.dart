import 'package:flutter/material.dart';

// I want to import my pages here!
import 'journal_page.dart';
import 'alarm_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SleepList App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        //primarySwatch: Colors.blue
        useMaterial3: true,
        // TODO: THEMES
        //textTheme:
        //scaffoldBackgroundColor: Colors.blue, //Color(0xDAD7CD) , //gray
      ),
      home: const MyHomePage(title: 'App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  //start bottomNavStuffHere
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Tasks Page'),
    AlarmPage(),
    JournalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep List'),
        backgroundColor: Colors.blueGrey[800] //primary dark?
        /*actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 247, 239, 167),
              padding: const EdgeInsets.all(16.0)
            ),
            onPressed: () {
              //handle
            }, 
            child: const Text('Sign Up'))
        ]
        //top bar
        //for sign up button*/
      ),
      drawer: _AndroidDrawer(), // Use _AndroidDrawer as the drawer
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle the tap on the custom button
                Navigator.pop(context); // Close the drawer
                // Add your logic here for the button action
              },/*

              child: Container(
                color: Colors.grey.shade200, // Background color of the button
                child: Center(
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}


// Define your BottomNavBar widget
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: 'Alarm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Journal',
        ),
      ],
      currentIndex: selectedIndex,
      //TODO: make colors
      selectedItemColor: Color(0xFF778DA9), // Set the selected item color
      unselectedItemColor: Color(0xFFE0E1DD), // Set the unselected item color
      onTap: onItemTapped,
    );
  }
}