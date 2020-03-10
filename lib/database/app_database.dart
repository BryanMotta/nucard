import 'package:nucard/components/my_card.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'nucard.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE mycard('
          'id INTEGER PRIMARY KEY, '
          'title TEXT, '
          'description INTEGER)');
    }, version: 1);
}

Future<int> save(MyCard myCard) async {
  final Database db = await getDatabase();

  final Map<String, dynamic> myCardMap = Map();
  myCardMap['id'] = myCard.id;
  myCardMap['title'] = myCard.title;
  myCardMap['description'] = myCard.description;

  return db.insert('mycard', myCardMap);
}

Future<List<MyCard>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('mycard');
  final List<MyCard> listMyCards = List();
  for (Map<String, dynamic> row in result) {
    final MyCard myCard = MyCard(
      row['title'],
      row['description'],
    );
    listMyCards.add(myCard);
  }
  return listMyCards;
}

Future<void> deleteDatabase() async{
  final String path = join(await getDatabasesPath(), 'nucard.db');
  return databaseFactory.deleteDatabase(path);
}
