import 'package:flutter/material.dart';

// I want to import my pages here!
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleeper List App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        //primarySwatch: Colors.blue
        useMaterial3: true,
        // TODO: text Theme
        //textTheme:
        //scaffoldBackgroundColor: Colors.blue, //Color(0xDAD7CD) , //gray

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  //idk what this.tittle means? Is that saying it's just forced to print MyHomePage

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
//start bottomNavStuffHere
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Tasks Page'),
    Text('Alarm Page'),
    Text('Journal Page'),
  ];

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //Scaffold to contain the bottom navigation
     return MaterialApp(
      home: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
               Tab(
                text: 'Home',
                icon: Icon(Icons.home)),
               Tab(
                text: 'Tasks',
                icon: Icon(Icons.task)),
               Tab(
                text: 'Alarm',
                icon: Icon(Icons.alarm)),
               Tab(
                text: 'Journal',
                icon: Icon(Icons.book)),
            ]
          )
        )
        )
      )
     );
  }
}
