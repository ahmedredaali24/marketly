import 'package:dio/dio.dart';
import 'package:marketly/data/api/api_const.dart';

import '../../model/request/RegisterRequst.dart';

class AuthDioApi {
  Future<RegisterRequest?> register(String name, String email, String password,
      String rePassword, String phone) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.registerApi);
    RegisterRequest registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    Dio dio = Dio();
    dio.options=BaseOptions(receiveDataWhenStatusError: true);

    var response =
        await dio.post(url.toString(), data: registerRequest.toJson());

  }
}
