import 'package:flutter/material.dart';
import './contact_page.dart';

@override
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 99, 0, 238),
      ),
      body: ContactPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color.fromARGB(255, 99, 0, 238),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
              ),
              label: 'Information'),
        ],
      ),
    );
  }
}
