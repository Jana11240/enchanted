import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class ElixirItem extends StatelessWidget {
  const ElixirItem({
    super.key,
    required this.elixir,
  });

  final Elixir elixir;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset(
              'assets/elixir_images/potion${elixir.imageIndex}.png',
              width: 80,
            ),
          ),
          Center(
            child: SizedBox(
              width: 91,
              child: Text(
                elixir.name ?? 'Unknown name',
                style: kExtraSmallText.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
