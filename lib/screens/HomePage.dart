import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Movies.dart';
import 'package:provider/provider.dart';

import '../widget/tabcontainer.dart';
import './moviepage.dart';
import './celebpage.dart';
import './collectionspage.dart';
import './creditspage.dart';
import './discoverpage.dart';
import './tvpage.dart';

//import '../Icons/tmdb_icons.dart';

class HomePage extends StatefulWidget {
  //create function which changes a variable to a specific index depending on what tab was clicked
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isinit = true;
  PageController controller = PageController(
    initialPage: 0,
  );

  //final moviedata = Provider.of(context)

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    if (_isinit) {
      Provider.of<Movies>(context).getmovieslist();
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final moviedata = Provider.of<Movies>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
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
        color: Colors.white54,
        child: Column(
          children: [
            BarContainer(
              controller: controller,
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  MoviePage(
                    poplist: moviedata.popular,
                  ),
                  TvPage(),
                  CelebPage(),
                  DiscoverPage(),
                  CreditsPage(),
                  CollectionsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
