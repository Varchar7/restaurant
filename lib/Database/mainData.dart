import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    required this.main,
  });

  Main main;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    main: Main.fromJson(json["main"]),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
  };
}

class Main {
  Main({
    required this.appheader,
    required this.link,
    required this.pins,
    required this.buttons,
    required this.foods,
  });

  String appheader;
  String link;
  List<String> pins;
  Buttons buttons;
  List<Food> foods;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    appheader: json["appheader"],
    link: json["link"],
    pins: List<String>.from(json["pins"].map((x) => x)),
    buttons: Buttons.fromJson(json["buttons"]),
    foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "appheader": appheader,
    "link": link,
    "pins": List<dynamic>.from(pins.map((x) => x)),
    "buttons": buttons.toJson(),
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
  };
}

class Buttons {
  Buttons({
    required this.viewall,
    required this.cart,
    required this.order,
  });

  String viewall;
  String cart;
  String order;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
    viewall: json["viewall"],
    cart: json["cart"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "viewall": viewall,
    "cart": cart,
    "order": order,
  };
}

class Food {
  Food({
    required this.name,
    required this.quote,
  });

  String name;
  List<Quote> quote;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    name: json["name"],
    quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quote": List<dynamic>.from(quote.map((x) => x.toJson())),
  };
}

class Quote {
  Quote({
    required this.item,
    required this.rate,
    required this.price,
    required this.like,
    required this.duration,
  });

  String item;
  String rate;
  String price;
  int like;
  String duration;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    item: json["item"],
    rate: json["rate"],
    price: json["price"],
    like: json["like"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "item": item,
    "rate": rate,
    "price": price,
    "like": like,
    "duration": duration,
  };
}
