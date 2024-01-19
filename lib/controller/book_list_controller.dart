import 'package:url_launcher/url_launcher.dart';
import 'package:wolf_library/utils/book_search.dart';

import '../model/book.dart';

class BookListController {
  Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir $urlString';
    }
  }

  List<Book>search(List<Book> books, String term){
    BookSearch bookSearch = BookSearch(books);
    return bookSearch.search(term);
  }



}
