import 'package:flutter/material.dart';

const Color skyBlue = Color(0xFF08A8F5);
const Color lightBlue = Color(0xFFEAF7FF);
const Color darkBlue = Color(0xFF102A56);

class CloudLogo extends StatelessWidget {
  final double iconSize;

  const CloudLogo({
    super.key,
    this.iconSize = 42,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize + 18,
      height: iconSize + 18,
      decoration: BoxDecoration(
        color: skyBlue.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.cloud_rounded,
        size: iconSize,
        color: skyBlue,
      ),
    );
  }
}