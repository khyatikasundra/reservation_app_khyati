import 'package:flutter/material.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool isAnyItemAdd;
  final double totalPrice;
  const CustomBottomSheet(
      {required this.isAnyItemAdd, required this.totalPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.amber,
      builder: (context) => Padding(
        padding: EdgeInsets.all(PointSize.value20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(UiString.stringAsset.kIDR + totalPrice.toStringAsFixed(2)),
            _reservationButton(context)
          ],
        ),
      ),
      onClosing: () {},
    );
  }

  ElevatedButton _reservationButton(BuildContext context) {
    return ElevatedButton(
        style: _reservationButtonStyle(),
        onPressed: () {},
        child: Text(
          isAnyItemAdd
              ? UiString.stringAsset.kOrder
              : UiString.stringAsset.kReservation,
          style: Theme.of(context).textTheme.labelSmall,
        ));
  }

  ButtonStyle _reservationButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
  }
}
