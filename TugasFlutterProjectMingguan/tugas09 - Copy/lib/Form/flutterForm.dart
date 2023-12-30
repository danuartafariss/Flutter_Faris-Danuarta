import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MaterialApp(
    home: AddContactPage(),
  ));
}

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<Map<dynamic, dynamic>> contacts = [];
  int indexContact = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(201, 0, 0, 0),
          title: const Text('Add Contact'),
          titleTextStyle: TextStyle(
              color: Color.fromARGB(219, 255, 255, 255),
              fontWeight: FontWeight.w400,
              fontSize: 20),
          centerTitle: true,
        ),
        body: ListView(
            padding: EdgeInsets.fromLTRB(
              20,
              60,
              20,
              20,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone_android, size: 40.0),
                ],
              ),
              const SizedBox(height: 4.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Create New Contact",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24.0, thickness: 2.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(37, 158, 158, 158),
                        hintText: "Insert Your Name",
                        labelText: "Name",
                        icon: const Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.zero,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(37, 158, 158, 158),
                        hintText: "+62...",
                        labelText: "Number",
                        icon: const Icon(Icons.phone),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .end, // Tombol Submit di sebelah kanan
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate() &&
                                indexContact == -1) {
                              dynamic name = nameController.text;
                              dynamic number = numberController.text;
                              Map<dynamic, dynamic> contact = {
                                'name': name,
                                'number': number,
                              };

                              setState(() {
                                contacts.add(contact);
                              });
                            } else {
                              setState(() {
                                contacts[indexContact] = {
                                  'name': nameController.text,
                                  'number': numberController.text
                                };
                                indexContact = -1;
                              });
                            }
                            nameController.clear();
                            numberController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                          child: Text(
                            indexContact == -1 ? 'Submit' : 'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "List Contacts",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 2.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: contacts.asMap().entries.map((entry) {
                  final contact = entry.value;
                  int index = contacts.indexOf(contact);
                  return Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    (contact['name']?.isNotEmpty ?? false)
                                        ? contact['name']![0].toUpperCase()
                                        : '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${contact['name']}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${contact['number']}",
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  indexContact = index;
                                  nameController.text = contact['name'];
                                  numberController.text = contact['number'];
                                },
                              ),
                              const SizedBox(width: 0.1),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  setState(() {
                                    contacts.remove(contact);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ]));
  }
}
