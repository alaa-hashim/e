// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecommerce_app/core/class/satusrequst.dart';
import 'package:ecommerce_app/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/services.dart';

class ApiHandler {
  Future<Either<StatusRequst, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {


      Myservices myservices = Get.put(Myservices());

      String? username = myservices.sharedpreferences.getString("username");


      if(username!=null){
        data['username']=username;
      }
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        print(jsonDecode(response.body));

        return Right(responsebody);
      } else {
        return const Left(StatusRequst.serverfailure);
      }
    } else {
      return const Left(StatusRequst.offlinefailure);
    }
  }


}
