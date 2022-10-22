import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';

Widget Ayah(String key, name) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset("assets/img.png"),
      SvgPicture.asset("assets/svg/grey.svg"),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(key, style: TextStyle(fontSize: 16, color: ColorApp.yellow1),),
          Text(name, style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorApp.yellow1), textScaleFactor: .5,),
        ],
      )

    ],
  );
}
