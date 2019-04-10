import 'package:flutter/widgets.dart';
import 'screen.dart';

afterLayout(VoidCallback callBack) {
  WidgetsBinding.instance.addPersistentFrameCallback((Duration timeStamp) {
    callBack();
  });
}

fixedFontSize(double fontSize) {
  return fontSize / Screen.textScaleFactor;
}