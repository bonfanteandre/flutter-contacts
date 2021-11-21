import 'package:contacts/data/database_connection.dart';
import 'package:contacts/models/contact.dart';

class ContactDao {

  Future add(Contact contact) async {
    final database = await DatabaseConnection.getDatabaseConnection();
    database.insert('contacts', contact.toMap());
  }
  
  Future update(Contact contact) async {
    final database = await DatabaseConnection.getDatabaseConnection();
    database.update('contacts', contact.toMap(), where: 'id = ?', whereArgs: [contact.id]);
  }

  Future<List<Contact>> all() async {
    final database = await DatabaseConnection.getDatabaseConnection();
    final contactsMaps = await database.query('contacts');
    return contactsMaps.map((contactMap) {
      return Contact.fromMap(contactMap);
    }).toList();
  }

  Future<Contact> findById(int id) async {
    final database = await DatabaseConnection.getDatabaseConnection();
    List<Map<String, dynamic>> contactsMap = await database.query('contacts', columns: ['id', 'name', 'number'], where: 'id = ?', whereArgs: [id]);
    if (contactsMap.isNotEmpty) {
      return Contact.fromMap(contactsMap.first);
    }
    return Contact(id: 0, name: '', number: '');
  }

}