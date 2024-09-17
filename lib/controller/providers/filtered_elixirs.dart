import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/controller/providers/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersNotifier extends StateNotifier<Map<Difficulty, bool>> {
  FiltersNotifier()
      : super({
          Difficulty.Advanced: true,
          Difficulty.Beginner: true,
          Difficulty.Moderate: true,
          Difficulty.OneOfAKind: true,
          Difficulty.OrdinaryWizardingLevel: true,
          Difficulty.Unknown: true,
        });

  void setFilter(Difficulty filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setAllFilters(Map<Difficulty, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Difficulty, bool>>((ref) {
  return FiltersNotifier();
});

final filteredElixirsProvider = FutureProvider<List<Elixir>>((ref) async {
  final elixirs = await ref.watch(elixirProvider);
  final activeFilters = ref.watch(filtersProvider);
  if (elixirs != null) {
    return elixirs.where((elixir) {
      if ((activeFilters[Difficulty.Advanced]! &&
              elixir.difficulty == Difficulty.Advanced) ||
          (activeFilters[Difficulty.Beginner]! &&
              elixir.difficulty == Difficulty.Beginner) ||
          (activeFilters[Difficulty.Moderate]! &&
              elixir.difficulty == Difficulty.Moderate) ||
          (activeFilters[Difficulty.OneOfAKind]! &&
              elixir.difficulty == Difficulty.OneOfAKind) ||
          (activeFilters[Difficulty.OrdinaryWizardingLevel]! &&
              elixir.difficulty == Difficulty.OrdinaryWizardingLevel) ||
          (activeFilters[Difficulty.Unknown]! &&
              elixir.difficulty == Difficulty.Unknown)) {
        return true;
      }

      return false;
    }).toList();
  }
  return [];
});
