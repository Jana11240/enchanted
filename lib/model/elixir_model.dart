import 'dart:math';

enum Difficulty {
  Unknown,
  Advanced,
  Moderate,
  Beginner,
  OrdinaryWizardingLevel,
  OneOfAKind
}

class Elixir {
  const Elixir({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.characteristics,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
    required this.imageIndex,
  });

  final String id;
  final String? name;
  final String? effect;
  final String? sideEffects;
  final String? characteristics;
  final String? time;
  final Difficulty difficulty;
  final List<Ingredient>? ingredients;
  final List<Inventor>? inventors;
  final String? manufacturer;
  final int imageIndex;

  factory Elixir.parse(Map<String, dynamic> json) {
    List<Ingredient> ingredientList = [];
    for (Map<String, dynamic> ingredient in json['ingredients']) {
      ingredientList.add(Ingredient.parse(ingredient));
    }

    List<Inventor> inventorList = [];
    for (Map<String, dynamic> inventor in json['inventors']) {
      inventorList.add(Inventor.parse(inventor));
    }

    Difficulty difficulty = Difficulty.values.firstWhere(
      (e) => e.toString().split('.').last == json['difficulty'],
    );

    return Elixir(
      id: json['id'],
      name: json['name'],
      effect: json['effect'],
      sideEffects: json['sideEffects'],
      characteristics: json['characteristics'],
      time: json['time'],
      difficulty: difficulty,
      ingredients: ingredientList,
      inventors: inventorList,
      manufacturer: json['manufacturer'],
      imageIndex: Random().nextInt(10) + 1
    );
  }
}

class Ingredient {
  const Ingredient({
    required this.name,
  });

  final String? name;

  factory Ingredient.parse(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
    );
  }
}

class Inventor {
  const Inventor({
    required this.firstName,
    required this.lastName,
  });

  final String? firstName;
  final String? lastName;

  factory Inventor.parse(Map<String, dynamic> json) {
    return Inventor(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
