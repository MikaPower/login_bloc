import 'dart:_http';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_bloc/src/models/user_model.dart';

Future<UserModel> requestLogoutAPI(BuildContext context) async {
  final url = "https://www.yoururl.com/logout";


  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}