import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Container(
      margin: EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          new Container(
            margin: EdgeInsets.only(top:25.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(){
    return new TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Adress'
      ),
    );
  }

  Widget passwordField(){
    return new TextField(
      obscureText: true,
      decoration: new InputDecoration(
        hintText: 'Password',
        labelText: 'password',
        errorText:
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: new Text("login"),
      color: Colors.blue,
      onPressed: (){},
    );
  }

}