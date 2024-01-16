import 'package:flutter/material.dart';

import '../api/book_list.dart';
import '../component/book_card.dart';
import '../component/search_component.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4F7978),
          title: const Text(
            'WOLF LIBRARY',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
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
