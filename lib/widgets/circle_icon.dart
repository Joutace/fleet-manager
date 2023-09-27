import 'package:flutter/material.dart';


class CircleIcon extends StatelessWidget {
  final Color backgroundColor;
  final IconData iconData;
  final double size;

  CircleIcon(this.iconData,
      {this.size = 30, this.backgroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Icon(iconData, color: Colors.white, size: size),
      ),
    );
  }
}
