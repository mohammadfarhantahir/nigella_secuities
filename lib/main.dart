import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/splash/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //  title: 'Flutter Demo',
    home:  splashScreen(),
  )
  ));

}
