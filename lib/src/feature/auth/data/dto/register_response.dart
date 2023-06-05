class RegisterResponse {
  late String userId;
  late String userUsername;
  late String email;

  RegisterResponse(this.userId, this.userUsername, this.email);

  RegisterResponse.fromJson(Map json) {
    userId = json['user_id'];
    userUsername = json['user_username'];
    email = json['user_email'];
  }
}