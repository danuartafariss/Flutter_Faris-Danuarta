import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _anotherFieldController = TextEditingController();
  List<Map<String, dynamic>> _formDataList = [];
  int _editingIndex =
      -1; // Index of the data being edited, -1 means no data is being edited

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editable TextFormField and Map'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _anotherFieldController,
              decoration: InputDecoration(
                labelText: 'Another field',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Check if we are editing existing data or adding new data
                if (_editingIndex == -1) {
                  // Add new data to the list
                  setState(() {
                    _formDataList.add({
                      'textField': _textFieldController.text,
                      'anotherField': _anotherFieldController.text,
                    });
                  });
                } else {
                  // Edit existing data in the list
                  setState(() {
                    _formDataList[_editingIndex] = {
                      'textField': _textFieldController.text,
                      'anotherField': _anotherFieldController.text,
                    };
                    _editingIndex = -1; // Reset editing index
                  });
                }

                // Clear the input fields
                _textFieldController.clear();
                _anotherFieldController.clear();
              },
              child: Text(_editingIndex == -1 ? 'Add Data' : 'Save Edit'),
            ),
            SizedBox(height: 20.0),
            Column(
              children: _formDataList.map((data) {
                int index = _formDataList.indexOf(data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Set the data of the selected item to the input fields for editing
                      setState(() {
                        _editingIndex = index;
                        _textFieldController.text = data['textField'];
                        _anotherFieldController.text = data['anotherField'];
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          '${index + 1}:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Data ${index + 1}: ${data['textField']}, ${data['anotherField']}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _anotherFieldController.dispose();
    super.dispose();
  }
}
