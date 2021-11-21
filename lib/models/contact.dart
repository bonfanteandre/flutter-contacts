class Contact {
  int? id;
  String name;
  String number;

  Contact({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'number': this.number
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(id: map['id'], name: map['name'], number: map['number']);
  }
}