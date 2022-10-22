
import 'package:flutter/material.dart';

abstract class TextApp {
  static const Text NameApp=const Text("اسلامي"
    ,style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,fontSize: 36),);

  static const Text splashScreen=const Text("اسلامي"
    ,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 36),);


  static const Text bookOneScreen=const Text("ألأحاديث الاربعون");
  static const Text bookTwoScreen=const Text("ألأستماع للأحاديث");
  static const Text bookThreeScreen=const Text("ألأحاديث المحفوظه");
}