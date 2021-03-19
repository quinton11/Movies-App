import 'package:flutter/material.dart';

import '../widget/tabcontainer.dart';

//import '../Icons/tmdb_icons.dart';

class HomePage extends StatefulWidget {
  //create function which changes a variable to a specific index depending on what tab was clicked
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            BarContainer(
              controller: controller,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: width,
                height: height - 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Movies',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Tv',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Celebs',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Discover',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Credits',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Collections',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
