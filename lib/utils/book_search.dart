import 'package:wolf_library/model/book.dart';

class BookSearch {
  final List<Book> books;
  final Map<String, Set<Book>> _index = {};

  BookSearch(this.books) {
    _buildIndex();
  }

  void _buildIndex() {
    for (var book in books) {
      _indexBook(book.title, book);
      _indexBook(book.description, book);
    }
  }

  void _indexBook(String text, Book book) {
    var words = text.split(' ');
    for (var word in words) {
      var key = word.toLowerCase();
      _index.putIfAbsent(key, () => <Book>{}).add(book);
    }
  }

  List<Book> search(String query) {
    var words = query.toLowerCase().split(' ');
    Set<Book>? resultBooks;
    for (var word in words) {
      var booksForKey = _index[word];
      if (booksForKey != null) {
        resultBooks = resultBooks != null
            ? resultBooks.intersection(booksForKey)
            : booksForKey;
      } else {
        return []; // Se uma palavra da consulta não estiver no índice, não há correspondências
      }
    }
    return resultBooks?.toList() ?? [];
  }
}
