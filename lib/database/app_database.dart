import 'package:nucard/components/my_card.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'nucard.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE myCard('
          'id INTEGER PRIMARY KEY, '
          'title TEXT, '
          'description INTEGER)');
    }, version: 1);
  });
}

void save(MyCard myCard) {
  createDatabase().then((db) {
    final Map<String, dynamic> myCardMap = Map();
    myCardMap['id'] = myCard.id;
    myCardMap['title'] = myCard.title;
    myCardMap['description'] = myCard.description;

    db.insert('myCard', myCardMap);
  });
}

Future<MyCard> findAll() {
  return createDatabase().then((db) {
    return db.query('myCards').then((maps) {
      final List<MyCard> myCards = List();
      for (Map<String, dynamic> map in maps) {
        final MyCard myCard = MyCard(
          map['title'],
          map['description'],
        );
        myCards.add(myCard);
      }
      return myCards;
    });
  });
}
