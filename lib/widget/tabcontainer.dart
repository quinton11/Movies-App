import 'package:flutter/material.dart';

class BarContainer extends StatefulWidget {
  final controller;

  BarContainer({
    this.controller,
  });

  @override
  _BarContainerState createState() => _BarContainerState();
}

class _BarContainerState extends State<BarContainer> {
  final color = Color.fromRGBO(222, 195, 122, 1);
  int selection = 0;

  final List<String> title = [
    'Movies',
    'Tv',
    'Celebs',
    'Discover',
    'Credits',
    'Collections'
  ];

  void changeselection(int index, controller) {
    setState(() {
      selection = index;
    });
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildTabElement(index),
          separatorBuilder: (context, index) => SizedBox(
            width: 30,
          ),
          itemCount: title.length,
        ),
      ),
    );
  }

  GestureDetector buildTabElement(int index) {
    return GestureDetector(
      onTap: () {
        changeselection(index, widget.controller);
      },
      child: Container(
        height: 50,
        child: Column(
          children: <Widget>[
            Text(
              title[index],
              style: TextStyle(
                color: selection == index ? Colors.white : Colors.grey[600],
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 2,
              width: 10,
              decoration: BoxDecoration(
                color: selection == index ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
