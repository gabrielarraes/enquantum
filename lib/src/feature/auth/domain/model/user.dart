class User {
  String? username;
  String? password;

  User({ this.username, this.password });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user['user_username'] = username;
    user['user_password'] = password;
    return user;
  }
}