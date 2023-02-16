import 'package:flutter/material.dart';
import 'package:pokedex_demo/models/pokemon_basic.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({super.key, required this.data});

  final PokemonBasic data;
  static const double _defaultMaxRadius = 40;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('clicked'),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        // decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5)), color: Colors.blue[300]),
        child: Column(
          children: [
            CircleAvatar(
                radius: _defaultMaxRadius + 1.5,
                // minRadius: _defaultMaxRadius - 10 + 1,
              child: CircleAvatar(
                radius: _defaultMaxRadius,
                // minRadius: _defaultMaxRadius - 10,
                backgroundImage: AssetImage(data.imagePath),
                backgroundColor: Colors.blue[100],
              // backgroundImage: AssetImage('graphics/sprites/pokemon/1.png')
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10),),
            Text(data.name, style: const TextStyle(fontWeight: FontWeight.w600),)
          ]
        )
      )
    );
  }
}
