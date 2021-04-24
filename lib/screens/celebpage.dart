import 'package:flutter/material.dart';

class CelebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: Text(
          'Celebs',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
