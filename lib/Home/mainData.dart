import 'dart:convert';
import 'dart:math';

Map<String, dynamic> foodApp = {
  "appheader": "Find your test!",
  "pins": [
    "Recommend",
    "Indian",
    "Gujarati",
    "Panjabi",
    "Veg",
    "Non-Veg",
    "American",
    "Chainese",
    "Maxixan",
    "Italian",
    "Japanese"
  ],
  "buttons": {
    "viewall": "View all",
    "cart": "Add to Cart",
    "order": "Order Now"
  },
  "foods": [
    {
      "name": "Pizza",
      "quote": [
        {
          "item": "Neapolitan Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Chicago Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Sicilian Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Greek Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "California Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Detroit Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        }
      ]
    },
    {
      "name": "Burger",
      "quote": [
        {
          "item": "Lentil and Mushroom Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Stuffed Bean Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Lamb Burger with Radish Slaw",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Potato Corn Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Supreme Veggie Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Pizza Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
      ]
    },
    {
      "name": "Fries",
      "quote": [
        {
          "item": "Zucchini Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Shoestring Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Crinkle Cut Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Potato Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Onion-Patato Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Waffle Fries Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Polenta Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        },
        {
          "item": "Curly Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2),
          "like": Random().nextInt(2000),
          "duration": "${Random().nextInt(60)} Minutes"
        }
      ],
    }
  ]
};
List<String> keywords = [
  'pizza',
  'burger',
  'cheese',
  'maggie',
  'noodles',
  'chicken',
  'bread',
  'fry',
  'egg',
  'fruite',
  'panjabi-dish',
  'fast-food'
];

FoodApp FoodAppFromJson(String str) => FoodApp.fromJson(json.decode(str));

String FoodAppToJson(FoodApp data) => json.encode(data.toJson());

class FoodApp {
  FoodApp({
    required this.appheader,
    required this.buttons,
    required this.pins,
    required this.foods,
  });

  String appheader;
  Buttons buttons;
  List<String> pins;
  List<Food> foods;

  factory FoodApp.fromJson(Map<String, dynamic> json) => FoodApp(
        appheader: json["appheader"],
        buttons: Buttons.fromJson(json["buttons"]),
        pins: List<String>.from(json["pins"].map((x) => x)),
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appheader": appheader,
        "buttons": buttons.toJson(),
        "pins": List<dynamic>.from(pins.map((x) => x)),
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

  String getLink(String content) {
    return 'https://source.unsplash.com/1280x720/?$content';
  }

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

FoodApp fetchMain() {
  return FoodApp.fromJson(foodApp);
}
