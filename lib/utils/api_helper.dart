import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../screen/modal/rendomModel.dart';

class Apihelper
{
  static Apihelper apihelper=Apihelper();
  Future<RendomModel> getApi()
  async {
    String link='https://randomuser.me/api/';
    var responce=await http.get(Uri.parse(link));
    var json=jsonDecode(responce.body);
    RendomModel randomModel=RendomModel.fromJson(json);
    return randomModel;
  }
}