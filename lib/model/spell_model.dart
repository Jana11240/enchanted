class Spell {
  const Spell({
    required this.name,
    required this.incantation,
    required this.effect,
    required this.canBeVerbal,
    required this.type,
    required this.light,
    required this.creator,
  });

  final String name;
  final String? incantation;
  final String? effect;
  final bool? canBeVerbal;
  final String? type;
  final String? light;
  final String? creator;

  factory Spell.parse(Map<String, dynamic> json) {
    return Spell(
      name: json['name'],
      incantation: json['incantation'],
      effect: json['effect'],
      canBeVerbal: json['canBeVerbal'],
      type: json['type'],
      light: json['light'],
      creator: json['creator'],
    );
  }
}

Map<String, List<Spell>> groupSpellsByType(List<Spell> spells) {
  final Map<String, List<Spell>> groupedSpells = {};

  for (var spell in spells) {
    if (spell.type != null) {
      groupedSpells.putIfAbsent(spell.type!, () => []).add(spell);
    }
  }

  return groupedSpells;
}