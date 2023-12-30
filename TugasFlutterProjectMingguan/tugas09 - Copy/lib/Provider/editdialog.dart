import 'package:flutter/material.dart';

class EditContactDialog extends StatefulWidget {
  final Map<String, String> initialContact;

  const EditContactDialog({Key? key, required this.initialContact})
      : super(key: key);

  @override
  State<EditContactDialog> createState() => _EditContactDialogState();
}

class _EditContactDialogState extends State<EditContactDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Map<String, String> changes = {}; // Track changes

  @override
  void initState() {
    super.initState();
    nameController.text = widget.initialContact['name'] ?? '';
    numberController.text = widget.initialContact['number'] ?? '';
    dateController.text = widget.initialContact['date'] ?? '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = picked.toLocal().toString().split(' ')[0];
        // Track the change
        changes['date'] = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Contact'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('Name', nameController, 'name'),
            _buildTextField('Number', numberController, 'number'),
            _buildDateField('Date', dateController, context),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Only update the changed fields
            Map<String, String> updatedContact = {
              if (changes.containsKey('name')) 'name': changes['name']!,
              if (changes.containsKey('number')) 'number': changes['number']!,
              if (changes.containsKey('date')) 'date': changes['date']!,
            };

            if (updatedContact.isNotEmpty) {
              Navigator.of(context).pop(updatedContact);
            } else {
              // If there are no changes, simply close the dialog
              Navigator.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87, // Atur warna tombol Save
          ),
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87, // Atur warna tombol Save
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          onChanged: (value) {
            // Track the change
            changes[fieldName] = value;
          },
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDateField(
      String label, TextEditingController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
