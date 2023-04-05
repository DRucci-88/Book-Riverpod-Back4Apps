import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_learning/book_app/model/book_model.dart';
import 'package:parse_learning/book_app/service/book_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_controller.g.dart';

@Riverpod(keepAlive: true)
class BookController extends _$BookController {
  // final BookService bookService = ref.watch(bookServiceProvider);

  late final BookService bookService;

  // BookController() {
  //   debugPrint('');
  // }

  @override
  List<BookModel> build() {
    bookService = ref.watch(bookServiceProvider);
    return [];
  }

  Future<bool> addBook({
    required String title,
    required String year,
    required String genreId,
    required String publisherId,
  }) async {
    final res = await bookService.add(title, year, genreId, publisherId);
    if (!res.success || res.results == null) {
      return false;
    }
    final book = BookModel.fromParseObject(res.results![0]);
    state = [...state, book];
    return true;
  }
}
