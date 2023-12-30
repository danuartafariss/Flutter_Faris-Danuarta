import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/gallery_data.dart';
import 'edit_photo.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageAsset = ["1", "2", "3", "4", "5", "6", "7", "8"];

  GalleryPage({
    Key? key,
    required void Function(String selectedFileName) onSelectImage,
  })  : _onSelectImage = onSelectImage,
        super(key: key);

  final void Function(String) _onSelectImage;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari GalleryProvider
    var galleryProvider = Provider.of<GalleryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Photo Gallery'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageAsset.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _showBottomSheet(context, index, galleryProvider),
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(
                      "asset/${imageAsset[index]}.png",
                      height: 130,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      galleryProvider.imageAsset[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk menampilkan bottom sheet
  void _showBottomSheet(
      BuildContext context, int index, GalleryProvider galleryProvider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              "asset/${imageAsset[index]}.png",
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      _navigateToAdvancePage(context, index, galleryProvider),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _navigateToEditPhotoPage(context, index, galleryProvider);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('No'),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }

  // Fungsi untuk navigasi ke halaman EditPhotoPage
  void _navigateToEditPhotoPage(
      BuildContext context, int index, GalleryProvider galleryProvider) async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPhotoPage(imageAssetIndex: index),
      ),
    );

    if (newName != null && newName is String) {
      galleryProvider.changePhotoName(index, newName);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Photo name edited successfully to $newName'),
        ),
      );
    }
  }

  // Fungsi untuk navigasi ke halaman AdvancePage
  void _navigateToAdvancePage(
      BuildContext context, int index, GalleryProvider galleryProvider) {
    _onSelectImage(galleryProvider.imageAsset[index]);
    Navigator.pop(context);
  }
}
