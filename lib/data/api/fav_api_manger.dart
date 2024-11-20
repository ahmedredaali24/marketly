import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../domin/enitity/failures.dart';
import '../../ui/utils/shared_pre.dart';
import '../model/response/FavoriteResponseDto.dart';
import '../model/response/GetFavoriteResponseDto.dart';
import 'api_const.dart';

class FavoriteApiManger {
  FavoriteApiManger._();

  static FavoriteApiManger? instance;

  static FavoriteApiManger getInstance() {
    instance ??= FavoriteApiManger._();
    return instance!;
  }

  Future<Either<Failures, FavoriteResponseDto>> addToFavorite(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity()); // User defined class
    if (connectivityResult == ConnectivityResult.none ) {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));

    } else {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.addToFavoriteApi);
      var token = SharedPre.getDate(key: "Token");
      var response = await http.post(url,
          body: {"productId": productId}, headers: {"token": token.toString()});
      var addToFavoriteResponse =
      FavoriteResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToFavoriteResponse.message));
      } else {
        return Left(ServerError(errorMessage: addToFavoriteResponse.message));
      }
    }
  }
  ///getFavorite
  Future<Either<Failures, GetFavoriteResponseDto>> getFavorite() async {
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.none ) {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));

    } else {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.addToFavoriteApi);
      var token = SharedPre.getDate(key: "Token");
      var response = await http.get(url, headers: {"token": token.toString()});
      var getFavoriteResponse =
      GetFavoriteResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getFavoriteResponse.message));
      } else {
        return Left(ServerError(errorMessage: getFavoriteResponse.message));
      }
    }
  }
/// deleteFavorite
  Future<Either<Failures, FavoriteResponseDto>> deleteFavorite(String productId) async {
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.none) {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));

    } else {
      Uri url = Uri.https(ApiConst.baseUrl, "${ApiConst.addToFavoriteApi}/$productId");
      var token = SharedPre.getDate(key: "Token");
      var response = await http.delete(url, headers: {"token": token.toString()});
      var deleteFavoriteResponse =
      FavoriteResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteFavoriteResponse.message));
      } else {
        return Left(ServerError(errorMessage: deleteFavoriteResponse.message));
      }
    }
  }

}
