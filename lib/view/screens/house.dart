import 'package:enchanted/model/house_model.dart';
import 'package:enchanted/view/screens/house_detail.dart';
import 'package:enchanted/view/widgets/house_item.dart';
import 'package:flutter/material.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({
    super.key,
    required this.houses,
  });

  final List<House> houses;

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: widget.houses.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HouseDetail(
                  house: widget.houses[index],
                ),
              ),
            );
          },
          child: HouseItem(
            house: widget.houses[index],
          ),
        ),
      ),
    );
  }
}
