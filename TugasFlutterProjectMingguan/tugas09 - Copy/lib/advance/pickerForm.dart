import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: InteractiveWidgetPage(),
  ));
}

class InteractiveWidgetPage extends StatefulWidget {
  const InteractiveWidgetPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InteractiveWidgetPageState createState() => _InteractiveWidgetPageState();
}

class _InteractiveWidgetPageState extends State<InteractiveWidgetPage> {
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.blue;
  TextEditingController colorController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _selectColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                  colorController.text = 'Color = $color';
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pick Files',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0))),
            onPressed: () async {
              final result = await _pickFile();
              if (result != null) {
                if (kDebugMode) {
                  print('Selected file: $result');
                }
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.folder_open),
                SizedBox(width: 10),
                Text('Pick and Open File'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<String?> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    return result.files.single.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widget Page'),
        backgroundColor: const Color.fromARGB(201, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Date',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                  borderRadius: BorderRadius.zero,
                ),
                labelText: 'Choose a Date',
                hintText: 'Select a date',
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select a Color',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: selectedColor, border: const Border()),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: colorController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Select a color',
                          hintText: 'Choose a Color',
                          suffixIcon: IconButton(
                            onPressed: () => _selectColor(context),
                            icon: const Icon(Icons.color_lens),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            buildFilePicker(),
          ],
        ),
      ),
    );
  }
}
