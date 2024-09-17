import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/model/house_model.dart';
import 'package:enchanted/model/spell_model.dart';
import 'package:enchanted/provider/api/wizard.dart';
import 'package:riverpod/riverpod.dart';

final houseProvider = Provider((ref) async {
  var data = await WizardApi().fetchData('houses');
  if (data != null) {
    List<House> houses = (data as List).map((houseData) {
      return House.parse(houseData);
    }).toList();
    return houses;
  }
  return null;
});

final spellProvider = Provider((ref) async {
  var data = await WizardApi().fetchData('spells');
  if (data != null) {
    List<Spell> spells = (data as List).map((spellData) {
      return Spell.parse(spellData);
    }).toList();
    Map<String, List<Spell>> groupedSpells = groupSpellsByType(spells);
    return groupedSpells;
  }
  return null;
});

final elixirProvider = Provider((ref) async {
  var data = await WizardApi().fetchData('elixirs');
  if (data != null) {
    List<Elixir> elixirs = (data as List).map((elixirData) {
      return Elixir.parse(elixirData);
    }).toList();
    return elixirs;
  }
  return null;
});
