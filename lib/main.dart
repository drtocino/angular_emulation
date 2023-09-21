import 'package:angular_emulation/src/modules/contact/contact_list.dart';
import 'package:angular_emulation/src/modules/home/home_view.dart';
import 'package:angular_emulation/src/modules/meetings/meetings_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: true,
  ));
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      home: TabsBar(title: 'Angular'),
      
    );
  }
}

class TabsBar extends StatefulWidget {
  const TabsBar({super.key, required this.title});
  final String title;

  @override
  State<TabsBar> createState() => TabsState();
}

class TabsState extends State<TabsBar> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    ContactList(),
    const MeetingsCalendar(),
  ];

  List<BottomNavigationBarItem> screens = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Contact List'),
    const BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Meetings'),
  ];

  void onItemTapped(int index){
    setState((){
      selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Angular Em Architecture"),
        // index: selectedIndex,
        // children: widgetOptions,
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: screens,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }
}
