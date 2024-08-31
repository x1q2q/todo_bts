import 'package:flutter/material.dart';

class AppBottomsheet extends StatelessWidget {
  final List<Widget> colWidget;
  const AppBottomsheet({super.key, required this.colWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Wrap(alignment: WrapAlignment.center, children: [
            Container(
              width: 60,
              height: 6,
              color: Colors.grey[200],
            ),
            ...colWidget
          ]),
        ));
  }
}
