
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
    );
  }
}