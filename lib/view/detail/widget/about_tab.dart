import 'package:flutter/material.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';

class AboutTab extends StatefulWidget {
  final String aboutHotelDescription;
  final DetailBloc detailBloc;
  final DetailState state;
  const AboutTab(
      {required this.detailBloc,
      required this.aboutHotelDescription,
      required this.state,
      super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  void initState() {
    widget.detailBloc.add(GetAboutTabInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.state is AboutLoadingState
        ? const Center(child: CircularProgressIndicator())
        : CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(widget.aboutHotelDescription),
              )
            ],
          );
  }
}
