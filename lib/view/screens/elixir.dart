import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/controller/providers/search_elixir.dart';
import 'package:enchanted/view/screens/elixir_detail.dart';
import 'package:enchanted/view/widgets/elixir_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElixirScreen extends ConsumerStatefulWidget {
  const ElixirScreen({
    super.key,
    required this.elixirs,
  });

  final List<Elixir> elixirs;

  @override
  ConsumerState<ElixirScreen> createState() => _ElixirScreenState();
}

class _ElixirScreenState extends ConsumerState<ElixirScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 12; 
  List<Elixir> _displayedElixirs = [];

  @override
  void initState() {
    super.initState();
    _displayedElixirs = widget.elixirs.take(_currentMax).toList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreElixirs();
      }
    });
  }

  void _loadMoreElixirs() {
    setState(() {
      if (_currentMax < widget.elixirs.length) {
        _currentMax += 12; 
        _displayedElixirs = widget.elixirs.take(_currentMax).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredElixirs =
        ref.watch(filteredSearchedElixirsProvider(_displayedElixirs));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search keyword',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (query) {
                  ref
                      .read(searchElixirQueryProvider.notifier)
                      .setSearchQuery(query);
                },
              ),
            ),
            const SizedBox(height: 10),
            filteredElixirs.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: filteredElixirs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (ctx, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ElixirDetail(
                                elixir: filteredElixirs[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: ElixirItem(
                            elixir: filteredElixirs[index],
                          ),
                        ),
                      ),
                    ),
                  )
                : const Text('No results'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
