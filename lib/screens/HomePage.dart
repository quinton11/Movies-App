import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(222, 195, 122, 1),
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Movies app',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(222, 195, 122, 1),
        ),
        child: Center()
      ),
    );
  }
}
