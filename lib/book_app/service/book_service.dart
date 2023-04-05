import 'package:parse_learning/book_app/controller/registration_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'book_service.g.dart';

@Riverpod(keepAlive: true)
BookService bookService(BookServiceRef ref) {
  return BookService();
}

class BookService {
  static const className = 'Book';

  Future<ParseResponse> add(
    String title,
    String year,
    String genreId,
    String publisherId,
  ) {
    final res = ParseObject(className)
      ..set('title', title)
      ..set('year', year)
      ..set(
        'genre',
        ParseObject(RegistrationType.genre.className)..objectId = genreId,
      )
      ..set(
        'publisher',
        ParseObject(RegistrationType.publisher.className)
          ..objectId = publisherId,
      );
    return res.save();
  }

  Future<List<ParseObject>> getsByPublihser(String publisherId) async {
    final queryBook = QueryBuilder(ParseObject(className))
      ..whereEqualTo(
        'publisher',
        (ParseObject(RegistrationType.publisher.className)
              ..objectId = publisherId)
            .toPointer(),
      )
      ..orderByAscending('title');
    final apiRes = await queryBook.query();
    if (!apiRes.success || apiRes.results == null) {
      return [];
    }
    return apiRes.results as List<ParseObject>;
  }
}
