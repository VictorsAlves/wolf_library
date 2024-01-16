import 'package:flutter/material.dart';
import 'package:wolf_library/page/book_list_page.dart';
import 'package:wolf_library/page/home_page.dart';
import 'package:wolf_library/utils/rotas_nomeadas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolf Libary',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      initialRoute: homePageRouteName,
      routes: {
        bookListPageRouteName: (context) => BookListPage(),
      },
    );
  }
}
