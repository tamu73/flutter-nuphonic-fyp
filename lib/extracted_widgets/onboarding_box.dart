import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuphonic_front_end/shared/shared.dart';

class OnboardingBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String appName;
  final String subTitle;

  OnboardingBox({this.imagePath, this.title, this.appName, this.subTitle});


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: height - 83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(imagePath),
            Column(
              children: [
                Text(
                  title,
                  style: normalFontStyle.copyWith(
                    color: whitishColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                  ),
                ),
                appName != null
                    ? Column(
                  children: [
                    Text(
                      appName,
                      style: appNameFontStyle.copyWith(
                        color: whitishColor,
                        fontSize: 32
                      )
                    ),
                    SizedBox(height: 40,)
                  ],
                )
                    : SizedBox(),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: normalFontStyle.copyWith(
                    color: whitishColor.withOpacity(0.5),
                    fontSize: 18
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
