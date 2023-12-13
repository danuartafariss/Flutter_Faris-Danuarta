import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final List<String> kontak = ['Faris', 'Abdul', 'Udil', 'Susanti'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: kontak.length,
        itemBuilder: (context, index) {
          String nama = kontak[index];

          return ListTile(
            tileColor: Colors.white,
            title: Text(
              nama,
              style: TextStyle(color: Colors.black),
            ),
          );
        });
  }
}
