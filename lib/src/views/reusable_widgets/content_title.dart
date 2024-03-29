import 'package:flutter/material.dart';
import 'package:nuphonic_front_end/src/views/utils/consts.dart';

class ContentTitle extends StatelessWidget {
  final String label;

  ContentTitle({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Text(
          label,
          style: normalFontStyle.copyWith(
              color: whitishColor.withOpacity(0.9),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2),
        ),
      ),
    );
  }
}
