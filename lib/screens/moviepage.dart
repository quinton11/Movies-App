import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final poplist;
  final upcominglist;
  final topratedlist;
  final nowplayinglist;
  final latest;
  MoviePage({
    this.poplist,
    this.nowplayinglist,
    this.topratedlist,
    this.upcominglist,
    this.latest,
  });
  @override
  Widget build(BuildContext context) {
    //print(poplist[0]);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white38,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ScrollSection(
                datalist: poplist,
                title: 'Popular',
              ),
              SizedBox(
                height: 30,
              ),
              ScrollSection(
                datalist: upcominglist,
                title: 'Upcoming',
              ),
              SizedBox(
                height: 30,
              ),
              ScrollSection(
                datalist: nowplayinglist,
                title: 'Now Playing',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollSection extends StatelessWidget {
  const ScrollSection({
    this.title,
    Key key,
    @required this.datalist,
  }) : super(key: key);

  final datalist;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 410,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 230,
                height: 410,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                datalist[index].posterpath,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 230,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 200,
                            child: Text(
                              '#${index + 1} \n ${datalist[index].title}',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${datalist[index].voteaverage}',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 15,
              ),
              itemCount: datalist.length,
            ),
          )
        ],
      ),
    );
  }
}
