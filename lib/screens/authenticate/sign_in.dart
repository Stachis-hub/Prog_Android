import 'package:channsonnierfirebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[80],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: Text('Sign in to our application'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
            onPressed: () {
                widget.toggleView();
            }
          )
        ],
      ),
      body:
      Container(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 70.0),
        child:
          Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    onChanged: (val){
                      setState(() => email = val);
                    }
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                      obscureText: true,
                    onChanged: (val){
                      setState(() => pwd = val);
                    }
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.red[300],
                    child:Text(
                      'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                    onPressed: () async {
                      print(email);
                      print(pwd);
                    },
                  )
                ],
              )
          )


        /*RaisedButton(
          child: Text('Sign In anonymously'),
          onPressed: () async{
           dynamic result = await _auth.signInAnon();
           if (result == null){
             print('error signing in');
           }else{
             print('Signed in');
             print(result.uid);
           }
          },
        ),*/
      ),

    );
  }
}
