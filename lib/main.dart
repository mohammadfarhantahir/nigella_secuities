import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/intro/screen/intro_screen.dart';
import 'features/splash/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //  title: 'Flutter Demo',
    home:  OnBoard(),
  )
  ));

}
