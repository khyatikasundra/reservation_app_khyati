import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/notification/widget/notification_card.dart';
import 'package:reservation_app/view/promo/cubit/promo_cubit.dart';
import 'package:reservation_app/widget/sliver_loader.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  late PromoCubit _promoCubit;
  List<NotificationModel> _hottestList = [];
  List<NotificationModel> _recommendationList = [];
  @override
  void initState() {
    _promoCubit = context.read<PromoCubit>();
    _promoCubit.getPromoInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(UiString.stringAsset.kPromo)),
        ),
        body: CustomScrollView(
          slivers: [
            _promoCategoryTitle(context, UiString.stringAsset.kHottest),
            _buildHottestList(),
            _promoCategoryTitle(context, UiString.stringAsset.kRecommendation),
            _buildRecommendationList(),
          ],
        ));
  }

  Widget _buildHottestList() {
    return BlocBuilder<PromoCubit, PromoState>(
      builder: (context, state) {
        if (state is OnGetHottestPromoData) {
          _hottestList = state.hottestList;
        }
        return state is HottestDataLoadingState
            ? const SliverLoader()
            : SliverList.builder(
                itemBuilder: (context, index) =>
                    NotificationCard(notificationItem: _hottestList[index]),
                itemCount: _hottestList.length,
              );
      },
    );
  }

  Widget _buildRecommendationList() {
    return BlocBuilder<PromoCubit, PromoState>(
      builder: (context, state) {
        if (state is OnGetRecommendationPromoData) {
          _recommendationList = state.recommendationList;
        }
        return state is RecommendationDataLoadingState
            ? const SliverLoader()
            : SliverList.builder(
                itemBuilder: (context, index) => NotificationCard(
                    notificationItem: _recommendationList[index]),
                itemCount: _recommendationList.length,
              );
      },
    );
  }

  SliverToBoxAdapter _promoCategoryTitle(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
