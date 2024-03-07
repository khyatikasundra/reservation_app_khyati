import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/notification/cubit/notification_cubit.dart';
import 'package:reservation_app/view/notification/widget/notification_card.dart';
import 'package:reservation_app/view/notification/widget/sort_item_card.dart';
import 'package:reservation_app/widget/material_loader.dart';
import 'package:reservation_app/widget/sliver_loader.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationCubit _notificationCubit;
  List<NotificationModel> _notificationList = [];
  List<NotificationCategory> _notificationTypeList = [];
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    _notificationCubit = context.read<NotificationCubit>();
    _notificationCubit.notificationScreenInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UiString.stringAsset.kNotification),
      ),
      body: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) => _notificationListener(state),
          builder: (context, state) {
            _notificationBuildersListener(state);
            return state is NotificationLoadingState
                ? const MaterialLoader()
                : CustomScrollView(
                    slivers: [_sortingPanel(), _notificationListBuilder(state)],
                  );
          }),
    );
  }

//!Function
  void _notificationListener(NotificationState state) {
    if (state is OnGetFilteredNotification) {
      _notificationList = state.notificationList;
    }
    if (state is OnGetSelectedItemState) {
      _selectedCategoryIndex = state.selectedIndex;
    }
  }

  void _notificationBuildersListener(NotificationState state) {
    if (state is OnGetNotificationPageInitialData) {
      _notificationList = state.notificationList;
      _notificationTypeList = state.notificationTypeList;
    }
  }

//!Widget Method

  Widget _notificationListBuilder(NotificationState state) {
    return state is OnGetNotificationFilteredDataLoadingState
        ? const SliverLoader()
        : SliverList.builder(
            itemCount: _notificationList.length,
            itemBuilder: (context, index) => NotificationCard(
                  notificationItem: _notificationList[index],
                ));
  }

  Widget _sortingPanel() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: PointSize.value40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _notificationTypeList.length,
            itemBuilder: (context, index) {
              return SortItemCard(
                notificationTypeItem: _notificationTypeList[index],
                notificationCubit: _notificationCubit,
                index: index,
                selectedCategoryIndex: _selectedCategoryIndex,
              );
            }),
      ),
    );
  }
}
