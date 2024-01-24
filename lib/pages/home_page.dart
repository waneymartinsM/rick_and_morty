import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/card_page.dart';
import 'package:rick_and_morty/pages/favorite_page.dart';
import 'package:rick_and_morty/pages/widgets/character_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [const CardPage(), const FavoritePage()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text("Rick and Morty"),
        //     const SizedBox(height: 10),
        //     _buildSearch(),
        //   ],
        // ),
        title: const Text("Rick and Morty"),
        actions: [_buildSearch()],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Personagens'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: 'Favoritos'),
          ],
        ),
      ),
    );
  }

  IconButton _buildSearch() {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CharacterSearch());
        },
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(Icons.search_rounded, size: 25));
  }
}
