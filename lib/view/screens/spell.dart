import 'package:enchanted/model/spell_model.dart';
import 'package:enchanted/controller/providers/search_spell.dart';
import 'package:enchanted/view/widgets/spell_category_tabs.dart';
import 'package:enchanted/view/widgets/spell_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SpellScreen extends ConsumerStatefulWidget {
  const SpellScreen({
    super.key,
    required this.spells,
  });

  final Map<String, List<Spell>> spells;

  @override
  ConsumerState<SpellScreen> createState() => _SpellScreenState();
}

class _SpellScreenState extends ConsumerState<SpellScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        ref.read(selectedCategoryProvider.notifier).state = widget.spells.keys.first;
      });
    });
  }

  void _onCategoryChosen(int categoryIndex) {
    setState(() {
      ref.read(selectedCategoryProvider.notifier).state = widget.spells.keys.elementAt(categoryIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredSpells = ref.watch(filteredSpellsProvider(widget.spells));
    
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 160,
                maxHeight: 160,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for a spell',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                          onChanged: (query) {
                            ref.read(searchSpellQueryProvider.notifier).setSearchQuery(query);
                          },
                        ),
                      ),
                      // Spell category tabs
                      CategoryTabs(
                        types: widget.spells.keys,
                        onCategoryChosen: _onCategoryChosen,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body:  ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: filteredSpells.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SpellItem(
              spell: filteredSpells[index],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
