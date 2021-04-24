import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: Text(
          'Discover',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
