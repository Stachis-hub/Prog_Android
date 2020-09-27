import 'package:channsonnierfirebase/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference chantCollection = Firestore.instance.collection('chants');

  Future updateUserData(String author, String title, int popularity) async {
    return await chantCollection.document((uid)).setData({
      'author': author,
      'title': title,
      'popularity': popularity,
    });
  }

  //brew list from snapshot

  List<Song> _songListFromSnapshot (QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Song(
        title:  doc.data['title'] ?? '',
        author: doc.data['author'] ?? '',
        popularity: doc.data['popularity'] ?? 0

      );
    }).toList();

  }

  // get songs stream
  Stream<List<Song>> get songs {
    return chantCollection.snapshots().map(_songListFromSnapshot);
  }

}