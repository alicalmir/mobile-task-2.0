import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_task/screens/create_post.dart';
import 'package:mobile_task/screens/home_screen.dart';

class NavButtonHome extends StatefulWidget {
  const NavButtonHome({super.key});

  @override
  State<NavButtonHome> createState() => _NavButtonHomeState();
}

List<Widget> screens = [
  const HomePage(),
  const CreatePost(),
  const Center(
    child: Text('Profile'),
  )
];

int activeIndex = 0;

class _NavButtonHomeState extends State<NavButtonHome> {
  ontap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TWITTER PRO'),
        centerTitle: true,
      ),
      body: screens.elementAt(activeIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.shifting,
          currentIndex: activeIndex,
          onTap: (value) => ontap(value),
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.plus), label: 'Add Post'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.personHiking), label: 'Profile'),
          ]),
    );
  }
}
