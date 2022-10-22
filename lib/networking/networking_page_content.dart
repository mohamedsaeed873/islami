import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/utils/colors.dart';

import '../utils/Strings.dart';

class NetworkingPageContent extends StatefulWidget {
  final String? data;


  NetworkingPageContent({this.data});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(

        children: [
          Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(""),
                  SvgPicture.asset("assets/svg/logo.svg"),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ))
                ],
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.NameApp,

                ],
              ),
            ],
          ),
          _convertHadith(context, widget.data!),
        ],
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: TextStyle(fontSize: 22, color: ColorApp.yellow1),

      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
          ? TextSpan(text: text, style: TextStyle(color: ColorApp.primary,fontWeight: FontWeight.bold))
          : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}
