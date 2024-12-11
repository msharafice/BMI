import 'package:flutter/material.dart';


class RightBar extends StatelessWidget {
  final double barwidth;
  const RightBar({super.key, required this.barwidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 25,
          width: barwidth,
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
