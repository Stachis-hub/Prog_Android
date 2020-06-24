import 'package:channsonnierfirebase/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign up and Sart'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 70.0),
          child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => pwd = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.red[300],
                    child: Text(
                      'Register',
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
      ),
    );
  }
}


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
