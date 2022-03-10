/* import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RestaurantDB {
  static String path = '';
  static Database? database;
  static createDB() async {
    String? dbPath = await getDatabasesPath();
    path = join(dbPath!, 'restaurant.db');
  }

  static createTable() async {
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE PRODUCT(id integer PRIMARY KEY autoincrement, item text,rate text,price text,like integer ,duration text,qty integer);
          ''');
      },
    );
  }

  static insertRecord(Product product) {
    database!.insert(
      'PRODUCT',
      {
        "item": product.item,
        "rate": product.rate,
        "price": product.price,
        "like": product.like,
        "duration": product.duration,
        "qty": product.qty
      },
    );
  }

  static getRecords() async {
    var data = await database!.rawQuery('SELECT * FROM PRODUCT');
    print(data);
  }
}

class Product {
  String item;
  String rate;
  String price;
  int like;
  int qty;
  String duration;
  Product({
    required this.item,
    required this.duration,
    required this.like,
    required this.price,
    required this.qty,
    required this.rate,
  });
}
 */