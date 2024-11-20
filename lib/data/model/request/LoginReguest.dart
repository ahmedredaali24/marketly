/// email : "ahmedmutti@gmail.com"
/// password : "Ahmed@1123"

class LoginReguest {
  LoginReguest({
      this.email,
      this.password,});

  LoginReguest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}