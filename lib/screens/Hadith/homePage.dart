
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/Widget/Card.dart';
import 'package:islami/utils/colors.dart';

import '../../utils/Strings.dart';
import '../Sipha/SiphaScreen.dart';
import 'AudioHadithScreen.dart';
import '../Quran/homeQuran.dart';
import 'HadithScreen.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [

            SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20,),
                    SvgPicture.asset("assets/svg/logo.svg"),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextApp.NameApp,
                        ),

                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HadithScreen()));
                            },
                            child: myCard(ColorApp.green1, ColorApp.green2,"الاحاديث الاربعين","assets/quran.png",'assets/svg/one.svg')),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeQuran()));
                            },
                            child: myCard(ColorApp.yellow1, ColorApp.red2,"القرأن الكريم","assets/quran.png",'assets/svg/twoo.svg')),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SiphaScreen()));
                            },
                            child: myCard(Colors.blue, ColorApp.offWhite,"سبحة","assets/quran.png",'assets/svg/three.svg')),

                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        )
    );
  }
}


