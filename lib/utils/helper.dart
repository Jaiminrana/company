import 'package:flutter/services.dart';

void setAppOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
