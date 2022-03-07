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
  "foods": [
    {
      "name": "Pizza",
      "quote": [
        {
          "item": "Neapolitan Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Chicago Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Sicilian Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Greek Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "California Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Detroit Pizza",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        }
      ]
    },
    {
      "name": "Burger",
      "quote": [
        {
          "item": "Lentil and Mushroom Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Stuffed Bean Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Lamb Burger with Radish Slaw",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Potato Corn Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Supreme Veggie Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Pizza Burger",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
      ]
    },
    {
      "name": "Fries",
      "quote": [
        {
          "item": "Zucchini Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Shoestring Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Crinkle Cut Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Potato Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Onion-Patato Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Waffle Fries Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Polenta Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
        },
        {
          "item": "Curly Fries",
          "rate": (Random().nextDouble() * 5).toStringAsFixed(1),
          "price": (Random().nextDouble() * 10).toStringAsFixed(2)
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
FoodApp foodAppFromJson(String str) => FoodApp.fromJson(json.decode(str));

String foodAppToJson(FoodApp data) => json.encode(data.toJson());

class FoodApp {
  FoodApp({
    required this.appheader,
    required this.pins,
    required this.foods,
  });

  String appheader;
  List<String> pins;
  List<Food> foods;

  factory FoodApp.fromJson(Map<String, dynamic> json) => FoodApp(
        appheader: json["appheader"],
        pins: List<String>.from(json["pins"].map((x) => x)),
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appheader": appheader,
        "pins": List<dynamic>.from(pins.map((x) => x)),
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
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
        quote: List<Quote>.from(
          json["quote"].map(
            (x) => Quote.fromJson(
              x,
            ),
          ),
        ),
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
  });

  String item;
  String link =
      'https://source.unsplash.com/1280x720/?${keywords[Random().nextInt(11)]}';
  String rate;
  String price;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        item: json["item"],
        rate: json["rate"],
        price: "${json["price"]} \$",
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "rate": rate,
        "price": price,
      };
}

FoodApp fetchMain() {
  return FoodApp.fromJson(foodApp);
}
