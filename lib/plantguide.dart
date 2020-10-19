import 'dart:convert';
import 'package:flutter_staggedview_app/plantguide_jason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class plantguide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String arrayObjsText =
        '{"tags": [{"name": "Taha", "id": 1,"img" : "assets/images/storyone.jpg"}, '
        '{"name": "Aarab", "id": 2,"img" : "assets/images/storyone.jpg"}, '
        '{"name": "Faris", "id": 3,"img" : "assets/images/storyone.jpg"}]}';

    var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
    List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

    print(tagObjs);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stagged View'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: tagObjs.length,

          itemBuilder: (BuildContext context, int index) =>
          new Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage( image: AssetImage("${tagObjs[index].img}"),
                fit: BoxFit.cover)
              ),
              child: Center(
                 child: Text("${tagObjs[index].name}",style: TextStyle(color: Colors.white,fontSize: 30.0),),

              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}