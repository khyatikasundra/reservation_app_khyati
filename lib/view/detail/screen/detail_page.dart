import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/screen/detail_screen.dart';

class DetailPage extends StatelessWidget {
  static const String tag = "Detail page";
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelSelected = ModalRoute.of(context)?.settings.arguments;
    print(hotelSelected);
    return BlocProvider<DetailBloc>(
      create: (context) => DetailBloc(),
      child: DetailScreen(
        hotelId: hotelSelected,
      ),
    );
  }
}
