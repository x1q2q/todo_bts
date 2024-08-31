import 'package:flutter/material.dart';
import 'package:todo_bts/src/utils/index.dart';

class CardTile extends StatelessWidget {
  final double? height;
  final Function() onTap;
  final Widget widget;
  const CardTile(
      {super.key, this.height = 75, required this.onTap, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
            child: Container(
                    height: height,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: widget)
                .addInkWell(
                    color: AppColors.lightgray,
                    splash: Colors.white54,
                    onPress: onTap))
        .addBdRadius(18);
  }
}
