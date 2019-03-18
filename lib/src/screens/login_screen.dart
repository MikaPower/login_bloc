import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return new Container(
      margin: EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          new Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return new TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: new InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return new TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: new InputDecoration(
                hintText: 'Password',
                labelText: 'password',
                errorText: snapshot.error),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (BuildContext context, snapshot) {
          return RaisedButton(
            child: new Text("login"),
            color: Colors.blue,
            onPressed: snapshot.hasData
                ? bloc.submit()
                : null,
          );
        });
  }
}
