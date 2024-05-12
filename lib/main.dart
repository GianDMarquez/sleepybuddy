import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:provider/provider.dart';
// I want to import my pages here!
import 'view/theme/colors.dart';
import 'models/entry_database.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/home_page.dart';
import 'view/screens/journal_page.dart'   ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // did this for databse
  await EntryDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => EntryDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SleepyBuddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        scaffoldBackgroundColor: secondaryColorDark, //DO NOT change PLEASE
        useMaterial3: true,
        //textField Theme
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColorLight),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColorLight),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    JournalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
  initializeEntry();
  super.initState();
  }
  
void initializeEntry() async {
  if (mounted) {
    bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun == true) {
      context.read<EntryDatabase>().createIntialData();
    }
  }
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
// Should move to it's own class and take index but one thing at a time
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: primaryColorDark,
      items: const <BottomNavigationBarItem>[
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