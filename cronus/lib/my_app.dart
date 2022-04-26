import 'package:flutter/material.dart';

import 'pages/initial_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return 
      MaterialApp(
        title: 'Info Unity Study',
        debugShowCheckedModeBanner: false,
        // theme: theme(),
        home: const InitialPage(),
      );
  }
}