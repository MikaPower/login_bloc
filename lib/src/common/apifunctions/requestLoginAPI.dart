import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_bloc/src/common/functions/showDialogSingleButton.dart';



Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
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
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}