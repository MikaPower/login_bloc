import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_bloc/src/common/functions/saveCurrentLogin.dart';
import 'dart:convert';

import 'package:login_bloc/src/common/functions/showDialogSingleButton.dart';
import 'package:login_bloc/src/models/user_model.dart';



Future<UserModel> requestLoginAPI( String username, String password) async {
  final url = "https://www.yoururl.com/login";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };


  //LOGIN CALL
  final response = await http.post(
    url,
    body: body,
  );



  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
   // Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return UserModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    //showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}