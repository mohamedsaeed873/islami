import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/db/myData.dart';
import 'package:islami/model/hadithe.dart';

import '../../Widget/HadithWidget.dart';
import '../../utils/Strings.dart';


class AudioHadithScreen extends StatefulWidget {
  const AudioHadithScreen({Key? key}) : super(key: key);

  @override
  State<AudioHadithScreen> createState() => _AudioHadithScreenState();
}

class _AudioHadithScreenState extends State<AudioHadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
                Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(''),
                        SvgPicture.asset("assets/svg/logo.svg"),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_forward_ios , color: Colors.black,))

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextApp.NameApp,
                        ),

                      ],
                    )
                  ],
                )
              ],
            ),flex: 1,),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
                FutureBuilder(builder: (BuildContext context , AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      // childAspectRatio: 3/2,
                    ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context , index){
                          Hadith item= snapshot.data[index];
                          return Ayah(item.key! , item.nameHadith);

                        });
                  }
                  else
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                  future: MyData.getAllData(),
                )
              ],
            ),flex: 1,),
        ],
      ),
    );
  }
}
