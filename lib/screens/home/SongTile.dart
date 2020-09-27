import 'package:flutter/material.dart';
import 'package:channsonnierfirebase/models/song.dart';

class SongTile extends StatelessWidget {

  final Song song;
  SongTile({this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:  8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[song.popularity],
          ),
          title: Text(song.title),
          subtitle: Text('by ${song.author}'),
        ),
      ),
    );
  }
}
