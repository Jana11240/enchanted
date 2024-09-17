import 'package:enchanted/model/elixir_model.dart';
import 'package:riverpod/riverpod.dart';

class ElixirSearchNotifier extends StateNotifier<String> {
  ElixirSearchNotifier() : super('');

  void setSearchQuery(String query) {
    state = query;
  }
}

final searchElixirQueryProvider =
    StateNotifierProvider<ElixirSearchNotifier, String>(
  (ref) => ElixirSearchNotifier(),
);

final filteredSearchedElixirsProvider =
    Provider.family<List<Elixir>, List<Elixir>>((ref, elixirs) {
  final query = ref.watch(searchElixirQueryProvider).toLowerCase();

  if (query.isEmpty) {
    return elixirs;
  } else {
    return elixirs.where((elixir) {
      if (elixir.name!.toLowerCase().contains(query) ||
          (elixir.effect != null &&
              elixir.effect!.toLowerCase().contains(query)) ||
          (elixir.time != null && elixir.time!.toLowerCase().contains(query)) ||
          (elixir.sideEffects != null &&
              elixir.sideEffects!.toLowerCase().contains(query))) {
        return true;
      }
      return false;
    }).toList();
  }
});