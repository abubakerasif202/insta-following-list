import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const InstaFollowingListApp());
}

class InstaFollowingListApp extends StatelessWidget {
  const InstaFollowingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Following List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
