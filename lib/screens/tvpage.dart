import 'package:flutter/material.dart';

class TvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Center(
        child: Text(
          'Tv',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
