import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  final String aboutHotelDescription;
  const AboutTab({required this.aboutHotelDescription, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(aboutHotelDescription),
        )
      ],
    );
  }
}
