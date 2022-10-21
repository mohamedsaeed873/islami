import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/Strings.dart';


class HadithScreen extends StatefulWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
             children: [
               SvgPicture.asset("assets/svg/background.svg"),
               Column(
                 children: [
                   SizedBox(height: 50,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text(''),
                       SvgPicture.asset("assets/svg/logo.svg"),
                   //    SvgPicture.asset("assets/svg/logo.svg"),

                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       TextApp.topHomeScreen,
                       TextApp.headerHomeScreen,
                     ],
                   )
                 ],
               )
             ],
            ),flex: 1,),
          Expanded(
            child: Stack(),flex: 1,),
        ],
      ),
    );
  }
}
