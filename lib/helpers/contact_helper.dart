import 'package:sqflite/sqflite.dart';

final String ID_COLUMN = 'idColumn';
final String NAME_COLUMN = 'nameColumn';
final String EMAIL_COLUMN = 'emailColumn';
final String PHONE_COLUMN = 'idCophoneColumnlumn';
final String IMAGE_COLUMN = 'imageColumn';

class ContactHelper {


}

class Contact {

  int id;
  String name;
  String email;
  String phone;
  String image;

  Contact.fromMap(Map map) {
    id = map[ID_COLUMN];
    name = map[NAME_COLUMN];
    email = map[EMAIL_COLUMN];
    phone = map[PHONE_COLUMN];
    image = map[IMAGE_COLUMN];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      NAME_COLUMN: name,
      EMAIL_COLUMN: email,
      PHONE_COLUMN: phone,
      IMAGE_COLUMN: image
    };

    if (id != null)
      map[ID_COLUMN] = id;

    return map;
  }

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, email: $email, phone: $phone, image: $image';
  }
}