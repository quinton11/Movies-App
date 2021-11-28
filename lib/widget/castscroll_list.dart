import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Movies.dart';
import 'package:provider/provider.dart';

class CastList extends StatelessWidget {
  static const color = Color.fromRGBO(38, 192, 171, 1);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<Movies>(context).actors;

    return Container(
      height: 180,
      width: width,
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, index) => Container(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              data[index].profilepath != null
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/h632' +
                                data[index].profilepath,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
              Container(
                child: Text(
                  data[index].name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (BuildContext ctx, index) => SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
