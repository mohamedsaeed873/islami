import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiphaScreen extends StatefulWidget {
  const SiphaScreen({Key? key}) : super(key: key);

  @override
  State<SiphaScreen> createState() => _SiphaScreenState();
}

class _SiphaScreenState extends State<SiphaScreen> {
  int counter=0;

  void pushCounter(){
    setState(() {
      counter++;
    });
  }

  void popCounter(){
    setState(() {
      counter=0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logoo.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$counter" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 50),),
                  Text("عدد التسبيح" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 50),),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(

                              onTap: (){
                                popCounter();
                              },
                            child: Container(
                              height: 50,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: Container(
                                height: 50,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.settings_backup_restore , size: 30,),
                                    ),
                                    Text('تصفير' , style: TextStyle(fontSize: 22),),

                                  ],
                                ),
                              ),
                            ),

                          ),
                        ),
                        SizedBox(width: 40,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              pushCounter();
                            },
                            child: Container(
                              height: 50,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.fingerprint , size: 30,),
                                  ),
                                  Text('تسبيح' , style: TextStyle(fontSize: 22),),

                                ],
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
