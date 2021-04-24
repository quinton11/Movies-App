import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: Text(
          'Credits',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
