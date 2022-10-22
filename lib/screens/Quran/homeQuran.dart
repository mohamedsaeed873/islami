import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/screens/Quran/reading_page.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';

import '../../model/surah.dart';
import '../../utils/colors.dart';

class HomeQuran extends StatefulWidget {
  @override
  _HomeQuranState createState() => _HomeQuranState();
}

class _HomeQuranState extends State<HomeQuran> with TickerProviderStateMixin {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: surahList.length == null
          ? Center(child: CircularProgressIndicator())
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(''),
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.topRight,
                      child: Text(
                        "القرأن الكريم",
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
          flex: 1,
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(chapters[index].id.toString()),
                    ),
                    title: Text(chapters[index].name),
                    subtitle: Text(chapters[index].versesCount.toString()),
                    trailing: Text(
                      chapters[index].arabicName,
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            SurahPage(surah: chapters[index]),
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.white,
              ),
              itemCount: chapters.length,
            ),
          ),
        ),
      ],
    );
  }
}
