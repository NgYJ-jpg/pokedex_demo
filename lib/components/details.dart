
import 'package:flutter/material.dart';
import 'package:pokedex_demo/components/label.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[200]),
      // height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: const CustomLabel()
    );
  }
  
}
