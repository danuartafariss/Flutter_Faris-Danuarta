import 'package:flutter/foundation.dart';

class GalleryProvider extends ChangeNotifier {
  final List<String> _imageAsset = ["1", "2", "3", "4", "5", "6", "7", "8"];

  List<String> get imageAsset => _imageAsset;

  // Fungsi untuk mengganti nama foto
  void changePhotoName(int index, String newName) {
    _imageAsset[index] = newName;
    notifyListeners();
  }
}
