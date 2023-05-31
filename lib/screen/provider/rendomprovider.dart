import 'package:flutter/foundation.dart';
import 'package:rendom_api/utils/api_helper.dart';

import '../modal/rendomModel.dart';

class RandomProvider extends ChangeNotifier {
  RendomModel randomModel = RendomModel();

  void randomGet() async {
    randomModel = await Apihelper.apihelper.getApi();
    notifyListeners();
  }
}
