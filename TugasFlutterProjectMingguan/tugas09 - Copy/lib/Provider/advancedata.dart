import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  final List<Map<String, String>> _contacts = [];

  List<Map<String, String>> get contacts =>
      List<Map<String, String>>.from(_contacts);

  void editContact(int index, Map<String, String> updatedContact) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] = updatedContact;
      notifyListeners();
    }
  }

  void addContact(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void removeContact(int index) {
    if (index >= 0 && index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }

  void deleteContact(Map<String, String> contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
}
