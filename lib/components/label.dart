import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key});
  
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(child: Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[50]),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[100]), 
              padding: const EdgeInsets.all(10),
              child: const Text('label'),
              
          ),),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(10),
              // child: Flexible(
                child: Text(List.generate(100, (int ind) => 'descriptor').join(''),)
              // )
            )
          )
        ],
      ),
    ));
  }
  
}
