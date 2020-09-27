import 'package:channsonnierfirebase/models/song.dart';
import 'package:channsonnierfirebase/services/auth.dart';
import 'package:channsonnierfirebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Song>>.value(
      value: DatabaseService().songs,
      child: Scaffold(
      backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text('Nouvelle Application avec Firebase'),
            backgroundColor: Colors.blue[600],
            elevation: 0.0,
            actions: <Widget>[
        FlatButton.icon(
        icon: Icon(Icons.person_outline),
        label: Text('LogOut'),
        onPressed: () async{
          await _auth.signOut();

        },
    )
    ]
    ),
    ));
  }
}
