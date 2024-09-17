import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/controller/providers/filtered_elixirs.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter by Difficulty'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Difficulty.Beginner]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.Beginner, isChecked);
            },
            title: Text(
              'Beginner',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Difficulty.Moderate]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.Moderate, isChecked);
            },
            title: Text(
              'Moderate',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Difficulty.Advanced]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.Advanced, isChecked);
            },
            title: Text(
              'Advanced',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Difficulty.OneOfAKind]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.OneOfAKind, isChecked);
            },
            title: Text(
              'One of a kind',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Difficulty.OrdinaryWizardingLevel]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.OrdinaryWizardingLevel, isChecked);
            },
            title: Text(
              'Ordinary Wizarding Level',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Difficulty.Unknown]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Difficulty.Unknown, isChecked);
            },
            title: Text(
              'Unknown',
              style: kBodyText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: kSecondaryColor,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
