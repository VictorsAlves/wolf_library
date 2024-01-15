import 'package:flutter/material.dart';
import 'api/book_list.dart';
import 'component/book_card.dart';
import 'component/search_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolf Libary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wolf Libary'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SearchComponent(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(book: books[index]);
              },
            ),
          ]),
        ));
  }
}
