import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/tvscroll_list.dart';
import '../widget/carouseltv_widget.dart';

class TvPage extends StatelessWidget {
  final airingtoday;
  final ontheair;
  final popular;
  final toprated;

  TvPage({
    this.airingtoday,
    this.ontheair,
    this.popular,
    this.toprated,
  });

  @override
  Widget build(BuildContext context) {
    print(ontheair.length);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: CarouselWidget(
                  datalist: popular,
                  width: width,
                ),
              ),
              SizedBox(height: 20),
              TvScrollList(
                width: width,
                datalist: popular,
                title: 'Popular',
              ),
              TvScrollList(
                width: width,
                datalist: airingtoday,
                title: 'Airing Today',
              ),
              TvScrollList(
                width: width,
                datalist: toprated,
                title: 'Top Rated',
              ),
              TvScrollList(
                width: width,
                datalist: ontheair,
                title: 'On The Air',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
