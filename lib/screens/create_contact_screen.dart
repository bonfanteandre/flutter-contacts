import 'package:contacts/data/contact_dao.dart';
import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';

class CreateContactScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New contact'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                  },
                ),
                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Number is required";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final contact = Contact(
                            name: _nameController.text,
                            number: _numberController.text,
                          );
                          _contactDao.add(contact);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
