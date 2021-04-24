import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: Text(
          'Collections',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
