import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../screen/modal/rendomModel.dart';

class Apihelper
{
  static Apihelper apihelper=Apihelper();
  Future<RandomModel> getApi()
  async {
    String link='https://randomuser.me/api/';
    var responce=await http.get(Uri.parse(link));
    var json=jsonDecode(responce.body);

    RandomModel randomModel=RandomModel.fromJson(json);
    print(randomModel);

    return randomModel;
  }
}