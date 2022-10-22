import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/botombar.dart';
import 'package:islami/db/myData.dart';
import 'package:islami/model/hadithe.dart';

import '../../Widget/HadithWidget.dart';
import '../../utils/Strings.dart';

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
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                        child: Text("الاحاديث الاربعون",
                            textDirection: TextDirection.rtl , style: GoogleFonts.tajawal(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),)),
                  ],
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            // childAspectRatio: 3/2,
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Hadith item = snapshot.data[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeHadith(
                                            hadith: item,
                                          )));
                                },
                                child: Ayah(item.key!, item.nameHadith));
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  future: MyData.getAllData(),
                )
              ],
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
