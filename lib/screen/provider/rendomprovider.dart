import 'package:flutter/foundation.dart';
import 'package:rendom_api/utils/api_helper.dart';

import '../modal/rendomModel.dart';

class RandomProvider extends ChangeNotifier

{

  Future<RendomModel> randomGet()
  async {
    RendomModel randomModel=await Apihelper.apihelper.getApi();
    return randomModel;
  }
}