import 'UserEnitity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmut8tji@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTU1OGY1YmU4YjUyMzIzNWMzM2Y5MiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyNjc1MDYxLCJleHAiOjE3MjA0NTEwNjF9.mD1KEz2jkRFVJ1Uq4QgleJZlBkDqNJ2dromhL0zEzyk"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;


}