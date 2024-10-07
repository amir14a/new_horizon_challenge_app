import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/home.dart';
import 'package:new_horizon_challenge_app/utils/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        home: HomePage(),
        theme: mainTheme,
        scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        }),
      ),
    );
  }
}
