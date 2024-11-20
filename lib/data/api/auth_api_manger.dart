import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import '../model/request/LoginReguest.dart';
import '../model/request/RegisterRequst.dart';
import '../model/response/LoginResponseDto.dart';
import '../model/response/RegisterResponseDto.dart';
import 'api_const.dart';

class ApiManger {
//https://ecommerce.routemisr.com/api/v1/auth/signup
  ApiManger._();

  static ApiManger? instance;

  static ApiManger getInstance() {
    instance ??= ApiManger._();
    return instance!;
  }

  ///register
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity()); // User defined class
    if (connectivityResult == ConnectivityResult.none) {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check ahmed Internet Connection'));
    } else {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.registerApi);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.errorDto != null
                ? registerResponse.errorDto!.msg!
                : registerResponse.message));
      }
    }
  }

  ///login
  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    } else {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.loginApi);
      var loginRequest = LoginReguest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    }
  }
}
