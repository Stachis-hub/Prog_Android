import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:channsonnierfirebase/models/song.dart';
import 'package:channsonnierfirebase/screens/home/SongTile.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {

    final songs = Provider.of<List<Song>>(context);

    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return SongTile(song : songs[index]);
        },
    );
  }
}
