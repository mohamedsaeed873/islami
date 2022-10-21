
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget myCard (Color color1,color2,String text,path1,path2,){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 48),
    child: Card(
      elevation: 20,
      child: Container(

          height: 117,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10),
                    blurRadius: 40

                )
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(colors: [
                color1,
                color2,
              ],begin: AlignmentDirectional.topEnd,end: AlignmentDirectional.bottomStart

              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(path1),
              Text(text),
              SvgPicture.asset(path2)
            ],
          )
      ),
    ),
  );
}