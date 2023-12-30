import 'package:flutter/material.dart';
import 'assets/assets.dart';
import 'advance/pickerForm.dart';
import 'advance/advanceForm.dart';
import 'Form/flutterForm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.contact_page_rounded),
              title: const Text(
                'Form',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddContactPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.touch_app),
              title: const Text(
                'Picker',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InteractiveWidgetPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.control_point),
              title: const Text(
                'Advance Form',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdvancePage(
                    onSelectImage: '',
                    selectedFileName: '',
                  ),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.image_search_sharp),
              title: const Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GalleryPage(
                    onSelectImage: (String selectedFileName) {},
                  ),
                ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
      ]),
    );
  }
}
