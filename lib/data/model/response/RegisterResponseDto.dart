

import '../../../domin/enitity/auth_result_Entity.dart';
import 'ErrorDto.dart';
import 'UserDto.dart';




class RegisterResponseDto {
  RegisterResponseDto(
      {this.message, this.user, this.token, this.statusMsg, this.errorDto});

  RegisterResponseDto.fromJson(dynamic json) {

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errorDto =
        json['errors'] != null ? ErrorDto.fromJson(json['errors']) : null;

    token = json['token'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  ErrorDto? errorDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (errorDto != null) {
      map['errors'] = errorDto?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()

    );
  }
}
