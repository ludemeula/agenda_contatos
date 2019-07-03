import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String CONTACT_TABLE = 'contactHelper';
final String ID_COLUMN = 'idColumn';
final String NAME_COLUMN = 'nameColumn';
final String EMAIL_COLUMN = 'emailColumn';
final String PHONE_COLUMN = 'idCophoneColumnlumn';
final String IMAGE_COLUMN = 'imageColumn';

class ContactHelper {

  static final ContactHelper _instance = ContactHelper.internal();
  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (db != null)
      return _db;
    else
      _db = await initDb();
      return _db;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'contacts.db');

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async{
      await db.execute(
        ' CREATE TABLE $CONTACT_TABLE($ID_COLUMN INTEGER PRIMARY KEY, '
            '$NAME_COLUMN TEXT,'
            '$EMAIL_COLUMN TEXT,'
            '$PHONE_COLUMN TEXT,'
            '$IMAGE_COLUMN TEXT ) '
      );
    });
  }

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