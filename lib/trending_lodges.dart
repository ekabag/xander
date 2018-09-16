

import 'package:flutter/material.dart';

class TrendingLodges extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TrendingLodgesState();
  }
}

class _TrendingLodgesState extends State<TrendingLodges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: new Center(
        child: Text('Trending Lodges'),
      ),
    );
  }
}