import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class ElixirDetail extends StatelessWidget {
  const ElixirDetail({
    super.key,
    required this.elixir,
  });

  final Elixir elixir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: kBodyText3.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        title: Text(elixir.name ?? 'Elixir Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            _buildDetailCard('Effect', elixir.effect, context),
            _buildDetailCard('Side Effects', elixir.sideEffects, context),
            _buildDetailCard('Characteristics', elixir.characteristics, context),
            _buildDetailCard('Time', elixir.time, context),
            _buildDetailCard(
                'Difficulty', _getDifficultyText(elixir.difficulty), context),
            _buildDetailCard('Manufacturer', elixir.manufacturer, context),
            if (elixir.ingredients!.isNotEmpty) _buildIngredientsSection(context),
            if (elixir.inventors!.isNotEmpty) _buildInventorsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String? content, context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: kBodyText.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          content ?? 'Unknown',
          style: kBodyText.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientsSection(context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          'Ingredients',
          style: kBodyText.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: elixir.ingredients?.map((ingredient) {
              return ListTile(
                title: Text(
                  ingredient.name ?? 'Unknown Ingredient',
                  style: kBodyText.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              );
            }).toList() ??
            [const ListTile(title: Text('No ingredients available'))],
      ),
    );
  }

  Widget _buildInventorsSection(context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          'Inventors',
          style: kBodyText.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: elixir.inventors?.map((inventor) {
              return ListTile(
                title: Text(
                  '${inventor.firstName ?? 'Unknown'} ${inventor.lastName ?? ''}',
                  style: kBodyText.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              );
            }).toList() ??
            [const ListTile(title: Text('No inventors available'))],
      ),
    );
  }

  String _getDifficultyText(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.Unknown:
        return 'Unknown';
      case Difficulty.Advanced:
        return 'Advanced';
      case Difficulty.Moderate:
        return 'Moderate';
      case Difficulty.Beginner:
        return 'Beginner';
      case Difficulty.OrdinaryWizardingLevel:
        return 'Ordinary Wizarding Level';
      case Difficulty.OneOfAKind:
        return 'One of a Kind';
      default:
        return '';
    }
  }
}
