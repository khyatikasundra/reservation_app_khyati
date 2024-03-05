import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/notification/widget/notification_card.dart';
import 'package:reservation_app/view/promo/cubit/promo_cubit.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  late PromoCubit _promoCubit;
  List<NotificationModel> _promoList = [];
  @override
  void initState() {
    _promoCubit = context.read<PromoCubit>();
    _promoCubit.getPromoPageInitialData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UiString.stringAsset.kPromo),
      ),
      body: BlocBuilder<PromoCubit, PromoState>(
        builder: (context, state) {
          if (state is OnGetPromoPageInitialData) {
            _promoList = state.promoList;
          }
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                  itemCount: _promoList.length,
                  itemBuilder: (context, index) =>
                      NotificationCard(notificationItem: _promoList[index]))
            ],
          );
        },
      ),
    );
  }
}
