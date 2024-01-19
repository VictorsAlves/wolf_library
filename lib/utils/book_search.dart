import 'dart:convert' show ascii;
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
      var key = _normalize(word);
      _index.putIfAbsent(key, () => <Book>{}).add(book);
    }
  }

  String _normalize(String word) {
    return ascii.decode(
        word.toLowerCase().runes.map((r) => r < 128 ? r : _fallback(r)).toList());
  }

  int _fallback(int rune) {
    const accents = 'áàâäãåçéèêëíìîïñóòôöõúùûüýÿ';
    const nonAccents = 'aaaaaaceeeeiiiinooooouuuuyy';

    var index = accents.runes.toList().indexOf(rune);
    return index != -1 ? nonAccents.codeUnitAt(index) : rune;
  }

  List<Book> search(String query) {
    var normalizedQuery = _normalize(query);
    var words = normalizedQuery.split(' ');
    Set<Book>? resultBooks;
    for (var word in words) {
      var booksForKey = _index[word];
      if (booksForKey != null) {
        resultBooks = resultBooks != null
            ? resultBooks.intersection(booksForKey)
            : booksForKey;
      } else {
        // Busca por letras iniciais, se necessário
        for (int i = 1; i <= word.length && resultBooks == null; i++) {
          resultBooks = _searchByInitialLetters(word.substring(0, i));
        }
        if (resultBooks == null) return [];
      }
    }
    return resultBooks?.toList() ?? [];
  }

  Set<Book>? _searchByInitialLetters(String letters) {
    Set<Book>? booksStartingWith;
    for (var key in _index.keys) {
      if (key.startsWith(letters)) {
        booksStartingWith = booksStartingWith != null
            ? booksStartingWith.union(_index[key]!)
            : _index[key];
      }
    }
    return booksStartingWith;
  }
}
