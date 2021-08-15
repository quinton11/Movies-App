import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Movies.dart';
import 'package:movie_app/Providers/Tvprovider.dart';
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
  var _isLoading = true;
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
      Provider.of<TvProvider>(context).getLists();
      setState(() {
        _isLoading = false;
      });
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final moviedata = Provider.of<Movies>(context);
    final tvdata = Provider.of<TvProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Shows',
          style: TextStyle(
            color: Color.fromRGBO(38, 192, 171, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        color: Color.fromRGBO(37, 43, 51, 1),
        child: Column(
          children: [
            BarContainer(
              controller: controller,
            ),
            moviedata.popular == null
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(37, 43, 51, 1),
                      ),
                    ),
                  )
                : Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [
                        MoviePage(
                          poplist: moviedata.popular,
                          nowplayinglist: moviedata.nowplaying,
                          topratedlist: moviedata.toprated,
                          upcominglist: moviedata.upcoming,
                          latest: moviedata.latest,
                        ),
                        TvPage(
                          airingtoday: tvdata.tvairingtoday,
                          ontheair: tvdata.tvontheair,
                          popular: tvdata.populartv,
                          toprated: tvdata.topratedtv,
                        ),
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
