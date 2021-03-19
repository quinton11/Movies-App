import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final poplist;
  MoviePage({
    this.poplist,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.black12,
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
                              "Popular",
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
                      height: 280,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: 230,
                          height: 280,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 230,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        poplist[index].posterpath,
                                      ),
                                    )),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                ),
                                child: Text(
                                  '${index + 1}/n ${poplist[index].title}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 15,
                        ),
                        itemCount: poplist.length,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
