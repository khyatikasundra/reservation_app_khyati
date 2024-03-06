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
        title: Center(child: Text(UiString.stringAsset.kPromo)),
      ),
      body: BlocBuilder<PromoCubit, PromoState>(
        builder: (context, state) {
          if (state is OnGetPromoPageInitialData) {
            _promoList = state.promoList;
          }
          return state is PromoLoadingState
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverList.builder(
                        itemCount: _promoList.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _promoItem(index, context);
                          }
                          if (_promoList[index].promoType !=
                              _promoList[index - 1].promoType) {
                            return _promoItem(index, context);
                          }
                          return NotificationCard(
                            notificationItem: _promoList[index],
                          );
                        })
                  ],
                );
        },
      ),
    );
  }

  Column _promoItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(index, context),
        NotificationCard(
          notificationItem: _promoList[index],
        )
      ],
    );
  }

  Widget _sectionTitle(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        _promoList[index]
                .promoType
                ?.toString()
                .substringAfterFullStop()
                .capitalizeFirstLetter() ??
            '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

extension SubstringAfterFullStop on String {
  String substringAfterFullStop() {
    int index = indexOf('.');
    if (index != -1) {
      return substring(index + 1).trim();
    } else {
      return '';
    }
  }
}

extension CapitalizeFirstLetter on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
