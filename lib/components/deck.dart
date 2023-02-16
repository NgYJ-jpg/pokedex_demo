import 'package:flutter/material.dart';
import 'package:pokedex_demo/models/pokemon_basic.dart';
import 'package:pokedex_demo/components/card.dart';

class Deck extends StatelessWidget {
  const Deck({super.key, required this.entries, this.scrollController});

  final List<PokemonBasic> entries;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SingleChildScrollView(
        controller: scrollController,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Wrap(
            children: entries.map((entry) => BasicCard(data: entry)).toList(),
          )
        )
      )
    );

  }
}
