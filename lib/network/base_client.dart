import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

//todo inject to dependency and close accordingly
class BaseClient extends GetxService {
  var baseClient = http.Client();

  static const int timeOutDuration = 20;

  //GET
  Future<dynamic> get(String endpoint) async {
    try {
      var uri = Uri.parse(endpoint);
      var response = await baseClient
          .get(uri)
          .timeout(const Duration(seconds: timeOutDuration));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        //throw exception
        _handleResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('Api not responding');
    }

    //implement
    //use page controller 'with' BaseController
    //showLoading();
    // var response1= await BaseClient().get(endpoint).catchError(handleError);
    //hideLoading();
    // if (response1 == null) return;
    // else {
    //   print(response1.body);
    //   var user = user.fromjson(response);
    // }
  }

  // Future<dynamic> post(String endpoint, dynamic object) async {
  //   try {
  //     var uri = Uri.parse(baseUrl + endpoint);
  //     var _payload = json.encode(object);
  //     var response = await client
  //         .post(uri, body: _payload, headers: _headerPost)
  //         .timeout(const Duration(seconds: timeOutDuration));
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       return response.body;
  //     } else {
  //       //throw exception
  //       _handleResponse(response);
  //     }
  //   } on SocketException {
  //     throw FetchDataException('No internet connection');
  //   } on TimeoutException {
  //     throw ApiNotRespondingException('Api not responding');
  //   }

  //   //implement
  //   // var user = User(
  //   // name: 'Akhil',
  //   // age: '28',
  //   // );
  //   // var response1= await BaseClient().post(endpoint, user).catchError(handleError);
  //   // if (response1 == null) return;
  //   // else {
  //   //   print(response1.body);
  //   //   var user = user.fromjson(response);
  //   // }
  // }

  // Future<dynamic> put(String endpoint, dynamic object) async {
  //   try {
  //     var uri = Uri.parse(baseUrl + endpoint);
  //     var _payload = json.encode(object);
  //     var response = await client
  //         .put(uri, body: _payload, headers: _headerPost)
  //         .timeout(const Duration(seconds: timeOutDuration));
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       return response.body;
  //     } else {
  //       //throw exception
  //       _handleResponse(response);
  //     }
  //   } on SocketException {
  //     throw FetchDataException('No internet connection');
  //   } on TimeoutException {
  //     throw ApiNotRespondingException('Api not responding');
  //   }

  //   //implement

  //   // var id = 2;
  //   // var user = User(
  //   // name: 'Akhil',
  //   // age: '30', //changed value
  //   // );
  //   // var response1= await BaseClient().put(endpoint+'/$id', user).catchError(handleError);
  //   // if (response1 == null) return;
  //   // else {
  //   //   print(response1.body);
  //   //   var user = user.fromjson(response);
  //   // }
  // }

  // Future<dynamic> delete(String endpoint) async {
  //   try {
  //     var uri = Uri.parse(baseUrl + endpoint);
  //     var response = await client
  //         .get(uri, headers: _header)
  //         .timeout(const Duration(seconds: timeOutDuration));
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       return response.body;
  //     } else {
  //       //throw exception
  //       _handleResponse(response);
  //     }
  //   } on SocketException {
  //     throw FetchDataException('No internet connection');
  //   } on TimeoutException {
  //     throw ApiNotRespondingException('Api not responding');
  //   }
  //   //implement
  //   // var id = 2;
  //   // var response1= await BaseClient().delete(endpoint+'$id').catchError(handleError);
  //   // if (response1 == null) return;
  //   // else {
  //   //   print(response1.body);
  //   //   var user = user.fromjson(response);
  //   // }
  // }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }
}
