import 'package:flutter/material.dart';
import 'package:agri_guard/resources/app_color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.shadowColor,
    this.color,
  });
  final Color? shadowColor;
  final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: whiteColor,
      color: darkBackgroundColor,
      child: child,
    );
  }
}
