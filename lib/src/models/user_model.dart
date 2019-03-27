class UserModel {
  final String token;
  final String name;

  UserModel.fromJson(Map<String, dynamic> parsedJson)
      : token = parsedJson['token'],
        name = parsedJson['name'];
}
