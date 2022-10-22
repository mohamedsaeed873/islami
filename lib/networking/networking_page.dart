
import 'package:flutter/material.dart';

import 'networking_page_content.dart';

class NetworkingPage extends StatelessWidget {
String? data;
String? hadith;

NetworkingPage( this.data,  this.hadith);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [NetworkingPageContent(data: data,)],
      ),
    );
  }
}
