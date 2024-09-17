import 'package:enchanted/model/elixir_model.dart';
import 'package:enchanted/model/house_model.dart';
import 'package:enchanted/model/spell_model.dart';
import 'package:enchanted/provider/providers/data.dart';
import 'package:enchanted/provider/providers/filtered_elixirs.dart';
import 'package:enchanted/view/screens/elixir.dart';
import 'package:enchanted/view/screens/elixir_filter.dart';
import 'package:enchanted/view/screens/error.dart';
import 'package:enchanted/view/screens/house.dart';
import 'package:enchanted/view/screens/spell.dart';
import 'package:enchanted/view/screens/splash.dart';
import 'package:enchanted/view/screens/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget? _screenWidget;
  int? _selectedPageIndex;
  String? _screenTitle;
  var houses;
  var spells;
  var elixirs;

  @override
  void initState() {
    _showStartScreen();
    super.initState();
  }

  void _setProviders() {
    houses = ref.watch(houseProvider);
    spells = ref.watch(spellProvider);
    elixirs = ref.watch(filteredElixirsProvider);
  }

  void _showStartScreen() {
    setState(() {
      _screenWidget = StartScreen(start: () {
        _selectedPageIndex = 0;
        _showHouses();
      });
    });
  }

  void _showHouses() {
    setState(() {
      _screenTitle = 'Explore Hogwarts Houses';
      _screenWidget = FutureBuilder<List<House>?>(
        future: houses,
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            return HouseScreen(
              houses: snap.data!,
            );
          } else {
            if (snap.connectionState == ConnectionState.done &&
                snap.data == null) {
              return const ErrorScreen();
            }
            return const SplashScreeen();
          }
        },
      );
    });
  }

  void _showSpells() {
    setState(() {
      _screenTitle = 'Spells Library';
      _screenWidget = FutureBuilder<Map<String, List<Spell>>?>(
        future: spells,
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            return SpellScreen(
              spells: snap.data!,
            );
          } else {
            if (snap.connectionState == ConnectionState.done &&
                snap.data == null) {
              return const ErrorScreen();
            }
            return const SplashScreeen();
          }
        },
      );
    });
  }

  void _showElixirs() {
    setState(() {
      _screenTitle = 'Elixirs Encyclopedia';
      _screenWidget = const ElixirScreenWithData();
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });

    switch (index) {
      case 0:
        _showHouses();
        break;
      case 1:
        _showSpells();
        break;
      case 2:
        _showElixirs();
        break;
      default:
    }
  }

  @override
  Widget build(context) {
    _setProviders();
    return Scaffold(
      appBar: _selectedPageIndex != null
          ? AppBar(
              title: Text(
                _screenTitle!,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              actions: [
                if (_screenTitle == 'Elixirs Encyclopedia')
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push<Map<Difficulty, bool>>(
                        MaterialPageRoute(
                            builder: (ctx) => const FiltersScreen()),
                      );
                    },
                    icon: const Icon(Icons.tune_rounded),
                  )
              ],
            )
          : null,
      body: _screenWidget,
      bottomNavigationBar: _selectedPageIndex != null
          ? BottomNavigationBar(
              onTap: _selectPage,
              currentIndex: _selectedPageIndex!,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.castle_rounded),
                  label: 'Houses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.electric_bolt_rounded),
                  label: 'Spells',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.water_drop_rounded),
                  label: 'Elixirs',
                ),
              ],
            )
          : null,
    );
  }
}

class ElixirScreenWithData extends ConsumerWidget {
  const ElixirScreenWithData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elixirAsyncValue = ref.watch(filteredElixirsProvider);

    return elixirAsyncValue.when(
      data: (elixirs) => ElixirScreen(elixirs: elixirs),
      loading: () => const SplashScreeen(),
      error: (error, stackTrace) => const Center(
        child: Text('Something went wrong'),
      ),
    );
  }
}
