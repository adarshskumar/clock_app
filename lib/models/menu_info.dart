import 'package:clock_app/enum.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType, this.title, this.imageSource);

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners(); //to modify all the consumers listening to it
  }
}
