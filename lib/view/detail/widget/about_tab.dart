import 'package:flutter/material.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/widget/material_loader.dart';

class AboutTab extends StatelessWidget {
  final String aboutHotelDescription;
  final DetailBloc detailBloc;
  final DetailState state;
  const AboutTab(
      {required this.detailBloc,
      required this.aboutHotelDescription,
      required this.state,
      super.key});

  @override
  Widget build(BuildContext context) {
    return state is AboutLoadingState
        ? const MaterialLoader()
        : CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(aboutHotelDescription),
              )
            ],
          );
  }
}
