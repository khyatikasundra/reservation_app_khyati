import 'package:flutter/material.dart';

class MaterialLoader extends StatelessWidget {
  const MaterialLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:
          SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
    );
  }
}
