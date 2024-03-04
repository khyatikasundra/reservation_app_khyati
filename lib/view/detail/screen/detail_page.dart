import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/screen/detail_screen.dart';

class DetailPage extends StatelessWidget {
  final int hotelId;
  const DetailPage({required this.hotelId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBloc>(
      create: (context) => DetailBloc(),
      child: DetailScreen(
        hotelId: hotelId,
      ),
    );
  }
}
