import 'package:flutter/material.dart';
import 'package:wolf_library/component/book_card.dart';
import 'package:wolf_library/component/search_component.dart';

import '../api/book_list.dart';
import '../controller/book_list_controller.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  var bookViewModel = books;
  BookListController controller = BookListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4F7978),
          title: const Text(
            'WOLF LIBRARY',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SearchComponent(onSearchCompleted),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bookViewModel.length,
              itemBuilder: (context, index) {
                return BookCard(
                  book: bookViewModel[index],
                  handleUrl: (String url) {
                    controller.launchURL(url);
                  },
                );
              },
            ),
          ]),
        ));
  }
  void onSearchCompleted(String term) {
    setState(() {
      bookViewModel = controller.search(books, term);
    });
  }
}
