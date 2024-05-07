import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// I want to import my pages here!
import 'view/colors.dart';
import 'view/screens/home_page.dart';
import 'view/screens/journal_page.dart';
import 'view/screens/alarm_page.dart';
import 'model/journalEntry.dart';
import 'view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize(); // Initialize Android Alarm Manager
  await Hive.initFlutter();

  // Registering the adapter
  Hive.registerAdapter(journalEntryAdapter());

  //hive open journal box
  var journalBox = await Hive.openBox<journalEntryAdapter>("Journal");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SleepList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        scaffoldBackgroundColor: secondaryColorDark, //DO NOT change PLEASE
        useMaterial3: true,
        //textTheme:
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    AlarmPage(),
    HomePage(),
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
      backgroundColor: primaryColorDark,
      //drawer: _AndroidDrawer(), // Use _AndroidDrawer as the drawer
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
              }, /*

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
      backgroundColor: primaryColorDark,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: 'Alarm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Journal',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: secondaryColorLight, // Set the selected item color
      unselectedItemColor: primaryColorGray, // Set the unselected item color
      onTap: onItemTapped,
    );
  }
}
