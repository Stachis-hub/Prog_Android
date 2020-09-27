import 'package:channsonnierfirebase/models/user.dart';
import 'package:channsonnierfirebase/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

  // create a user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
}

// auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymously

   Future signInAnon() async{

     try{
       AuthResult result = await _auth.signInAnonymously();
       FirebaseUser user = result.user;
       return _userFromFirebaseUser(user);
     } catch(e){

       print(e.toString());
       return null;

     }
   }


  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String pwd) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }



  //register with email and password
Future registerWithEmailAndPassword(String email, String pwd) async{
     try{
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
       FirebaseUser user = result.user;

       //create a new document for the user with the uid
       await DatabaseService(uid : user.uid).updateUserData('Stachis', 'Mon premier chant', 1);
       print(user.email);

       return _userFromFirebaseUser(user);
     }catch(e){
       print(e.toString());
       return null;
     }
}

  // sign out

Future signOut() async {
     try{
       return await _auth.signOut();
     }catch(e){
       print(e.toString());
       return null;
     }
}


}