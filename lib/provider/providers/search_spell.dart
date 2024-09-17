import 'package:enchanted/model/spell_model.dart';
import 'package:riverpod/riverpod.dart';

class SpellSearchNotifier extends StateNotifier<String> {
  SpellSearchNotifier() : super('');

  void setSearchQuery(String query) {
    state = query;
  }
}

final searchSpellQueryProvider = StateNotifierProvider<SpellSearchNotifier, String>(
  (ref) => SpellSearchNotifier(),
);

final filteredSpellsProvider =
    Provider.family<List<Spell>, Map<String, List<Spell>>>((ref, spells) {
  final query = ref.watch(searchSpellQueryProvider).toLowerCase();
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (query.isEmpty) {
    return spells[selectedCategory] ?? [];
  } else {
    return spells[selectedCategory]!.where((spell) {
      if (spell.name.toLowerCase().contains(query) ||
          (spell.incantation != null &&
              spell.incantation!.toLowerCase().contains(query)) ||
          (spell.effect != null &&
              spell.effect!.toLowerCase().contains(query)) ||
          (spell.creator != null &&
              spell.creator!.toLowerCase().contains(query)) ||
          (spell.light != null && spell.light!.toLowerCase().contains(query))) {
        return true;
      }
      return false;
    }).toList();
  }
});

final selectedCategoryProvider = StateProvider<String>((ref) => '');
