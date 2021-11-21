import 'package:contacts/data/contact_dao.dart';
import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/create_contact_screen.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactDao _contactDao = ContactDao();
  List<Contact> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CreateContactScreen())
          ).then((value) {
            setState(() { });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _contactDao.all(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          _contacts = snapshot.data;
          return ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // TODO: open contact edit form
                },
                child: Card(
                  child: ListTile(
                    title: Text(_contacts[index].name),
                    subtitle: Text(_contacts[index].number),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
