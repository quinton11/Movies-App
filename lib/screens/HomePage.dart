import 'package:flutter/material.dart';

import '../widget/tabcontainer.dart';

//import '../Icons/tmdb_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        /*leading: Icon(
          Tmdb.music,
          color: Colors.black,
        ),*/
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Shows',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              TabContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

