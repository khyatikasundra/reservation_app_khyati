import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/notification/bloc/notification_bloc.dart';
import 'package:reservation_app/view/notification/screen/notification_screen.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: const NotificationScreen(),
    );
  }
}
