import 'package:channsonnierfirebase/services/auth.dart';
import 'package:channsonnierfirebase/shared/constants.dart';
import 'package:channsonnierfirebase/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _FormKey = GlobalKey<FormState>();
  bool loading = false;


  //text field state
  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[80],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: Text('Sign up and Start'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              })
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 70.0),
          child: Form(
              key: _FormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      decoration: textInputDeclaration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Entrez un email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      decoration: textInputDeclaration.copyWith(hintText: 'password'),
                      validator: (val) => val.length < 6
                          ? 'Le mot de passe doit avoir +6 caractères'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => pwd = val);
                      }),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.red[300],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        if (_FormKey.currentState.validate()) {
                          setState(()
                            => loading = true
                          );
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, pwd);
                          if (result == null) {
                            setState(
                                () {
                                  error = 'entrez une adresse mail valide';
                                  loading = false;
                                });
                          }
                        }
                      }),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  ),
                ],
              ))),
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
