import 'package:flutter/material.dart';


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
  var _isLoading = false;
  PageController controller = PageController(
    initialPage: 0,
  );

  //final moviedata = Provider.of(context)

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    /*  if (_isinit) {
      setState(() {
        _isLoading = true;
      });
    }
    Provider.of<Movies>(context).getmovieslist().then((_) {
      setState(() {
        _isLoading = false;
      });
    }); */
    // Provider.of<TvProvider>(context).getLists();

    _isinit = false;
    super.didChangeDependencies();
  }

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
            color: Color.fromRGBO(38, 192, 171, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 25,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: width,
              height: height,
              color: Color.fromRGBO(37, 43, 51, 1),
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
                        MoviePage(),
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
