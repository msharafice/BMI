import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barwidth;
  const LeftBar({super.key, required this.barwidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 25,
          width: barwidth,
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}