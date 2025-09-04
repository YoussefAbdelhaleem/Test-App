import 'package:flutter/material.dart';

import 'navbar pages/home.dart';
import 'navbar pages/profile.dart';
import 'navbar pages/settings.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectIndex = 0;
  List<Widget> pages = [Home(), Profile(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 100),
            ListTile(
              title: const Text("Profile"),
              subtitle: const Text("View Profile"),
              trailing: const Icon(Icons.person),
            ),
            ListTile(
              title: const Text("Contact Us"),
              subtitle: const Text("Contact info"),
              trailing: const Icon(Icons.contact_mail),
            ),
            ListTile(
              title: const Text("Settings"),
              subtitle: const Text("App Settings"),
              trailing: const Icon(Icons.settings),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              title: const Text("log Out"),
              subtitle: const Text("Log Out from app"),
              trailing: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: (index) {
          onitemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  onitemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
