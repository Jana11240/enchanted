import 'package:enchanted/model/house_model.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class HouseItem extends StatelessWidget {
  const HouseItem({
    super.key,
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecondaryColor, Color.fromARGB(255, 37, 9, 84)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: Padding(
            padding: const EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(house.logo),
            ),
          ),
          subtitle: Text(
            house.name,
            style: kBodyText3.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
