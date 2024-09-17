import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class House {
  const House({
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.logo,
    required this.elementIcon,
  });

  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<Head> heads;
  final List<Trait> traits;

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final String logo;
  final Icon elementIcon;

  factory House.parse(Map<String, dynamic> json) {
    List<Head> headsList = [];
    for (Map<String, dynamic> head in json['heads']) {
      headsList.add(Head.parse(head));
    }

    List<Trait> traitsList = [];
    for (Map<String, dynamic> trait in json['traits']) {
      traitsList.add(Trait.parse(trait));
    }

    Color c1 = kHouseColorMap['${json['name'][0]}1']!;
    Color c2 = kHouseColorMap['${json['name'][0]}2']!;
    Color c3 = kHouseColorMap['${json['name'][0]}3']!;
    Color c4 = kHouseColorMap['${json['name'][0]}4']!;

    String houseLogo = 'assets/house_images/${json['name'][0]}.png';

    Icon elementIcon = kHouseElementIconsMap['${json['name'][0]}']!;

    return House(
      name: json['name'],
      houseColours: json['houseColours'],
      founder: json['founder'],
      animal: json['animal'],
      element: json['element'],
      ghost: json['ghost'],
      commonRoom: json['commonRoom'],
      heads: headsList,
      traits: traitsList,
      color1: c1,
      color2: c2,
      color3: c3,
      color4: c4,
      logo: houseLogo,
      elementIcon: elementIcon,
    );
  }

  // List<Head> getHeadList(List<Map<String, dynamic>> heads) {
  //   List<Head> headsList = [];
  //   for (Map<String, dynamic> head in heads) {
  //     headsList.add(Head.parse(head));
  //   }
  //   return headsList;
  // }
}

class Head {
  const Head({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  factory Head.parse(Map<String, dynamic> json) {
    return Head(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class Trait {
  const Trait({
    required this.name,
  });

  final String name;

  factory Trait.parse(Map<String, dynamic> json) {
    return Trait(
      name: json['name'],
    );
  }
}
