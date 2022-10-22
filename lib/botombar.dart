


import 'package:flutter/material.dart';
import 'package:islami/screens/Hadith/infoScreen.dart';
import 'package:islami/utils/colors.dart';
import 'package:share/share.dart';
import 'model/hadithe.dart';
import 'networking/networking_page.dart';

class HomeHadith extends StatefulWidget {
  final Hadith? hadith;
  HomeHadith({this.hadith});

  @override
  State<HomeHadith> createState() => _HomeHadithState();
}

class _HomeHadithState extends State<HomeHadith> {
  bool bol = true;
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.hadith!.textHadith!;
  }
  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText ) {
    setState(() {
      selectedIndex = index;
      text = buttonText + ' \n';
    });
  }
  void navTo(int index, BuildContext context ) {
    setState(() {
      setState(() {
        selectedIndex = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfoScreen()));
      });
    });
  }
  Widget getWedjet(bool bol) {
    if (bol) {
      return NetworkingPage(text,widget.hadith!.nameHadith,);
    }
    else{
   return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            getWedjet(bol),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black38,
          onPressed: () {
            setState(() {
              clickedCentreFAB = !clickedCentreFAB; //to update the animated container
            });
            //          Share text
            Share.share(text, subject: widget.hadith!.nameHadith);
          },
          tooltip: "Centre FAB",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.share),
          ),
          elevation: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  //update the bottom app bar view each time an item is clicked
                  onPressed: () {
                    bol = true;
                    updateTabSelection(0, widget.hadith!.textHadith!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.book,
                    //darken the icon if it is selected or else give it a different color
                    color: selectedIndex == 0
                        ? ColorApp.yellow1
                        : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(1, widget.hadith!.explanationHadith!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.library_books,
                    color: selectedIndex == 1
                        ? ColorApp.yellow1
                        : Colors.white,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(2, widget.hadith!.translateNarrator!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.collections_bookmark,
                    color: selectedIndex == 2
                        ? ColorApp.yellow1
                        : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bol = false;
                   // navTo(3 , context);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.info,
                    color: selectedIndex == 3
                        ? ColorApp.yellow1
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //to add a space between the FAB and BottomAppBar
          shape: CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: ColorApp.green1,
        ));
  }
}
