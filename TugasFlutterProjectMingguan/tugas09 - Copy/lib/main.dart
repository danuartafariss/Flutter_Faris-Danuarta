import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/advancedata.dart';
import 'Provider/gallery_data.dart';
import 'material_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactProvider>(
            create: (_) => ContactProvider()),
        ChangeNotifierProvider<GalleryProvider>(
            create: (_) => GalleryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
