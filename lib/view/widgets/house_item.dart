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
            colors: [kPrimaryColor, Colors.white, kPrimaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(house.logo),
            ),
          ),
          subtitle: Text(
            house.name,
            style: kBodyText3.copyWith(color: kSecondaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
