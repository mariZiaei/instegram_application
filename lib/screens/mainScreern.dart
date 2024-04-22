import 'package:flutter/material.dart';
import 'package:flutter_instegram/screens/ActivitiScreen.dart';
import 'package:flutter_instegram/screens/UserProfileScreen.dart';
import 'package:flutter_instegram/screens/homeScreen.dart';
import 'package:flutter_instegram/screens/postScreen.dart';
import 'package:flutter_instegram/screens/search_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottemNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedBottemNavigationItem,
              onTap: (int index) {
                setState(() {
                  _selectedBottemNavigationItem = index;
                });
              },
              backgroundColor: Color(0xff1C1F2E),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_home.png'),
                    activeIcon: Image.asset('images/icon_active_home.png'),
                    label: 'test'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_search_navigation.png'),
                    activeIcon:
                        Image.asset('images/icon_search_navigation_active.png'),
                    label: 'test1'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_add_navigation_active.png'),
                    activeIcon:
                        Image.asset('images/icon_add_navigation_active.png'),
                    label: 'test1'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_activity_navigation.png'),
                    activeIcon: Image.asset(
                        'images/icon_activity_navigation_active.png'),
                    label: 'test1'),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Image.asset('images/profile.png'),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 167, 160, 162)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    activeIcon: Container(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Image.asset('images/profile.png'),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    label: 'test1'),
              ]),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottemNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScrean(),
      PostScreen(),
      ActivitiScreen(),
      UserProfile(),
      Container(
        color: Colors.green,
        child: Center(child: TextField()),
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.pink,
      ),
    ];
  }
}
