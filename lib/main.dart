import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/form.dart';
import 'package:provider_projects/state.dart';

import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const ScreenPlayer()));
  }
}
