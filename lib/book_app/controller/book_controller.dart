import 'package:parse_learning/book_app/model/book_model.dart';
import 'package:parse_learning/book_app/service/book_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_controller.g.dart';

@riverpod
Future<List<BookModel>> getBooksByPublisher(
  GetBooksByPublisherRef ref,
  String publisherId,
) async {
  final bookService = ref.watch(bookServiceProvider);
  final res = await bookService.getsByPublihser(publisherId);
  if (res.isEmpty) return [];
  final books = res.map((e) => BookModel.fromParseObject(e)).toList();
  return books;
}

@Riverpod(keepAlive: true)
class BookController extends _$BookController {
  late final BookService bookService;

  @override
  FutureOr<List<BookModel>> build() {
    bookService = ref.watch(bookServiceProvider);
    return [];
  }

  // Future<void> getBooksByPublisher(String publisherId) async {
  //   state = const AsyncValue.loading();

  //   state = await AsyncValue.guard(() async {
  //     final res = await bookService.getsByPublihser(publisherId);
  //     if (res.isEmpty) return [];
  //     final books = res.map((e) => BookModel.fromParseObject(e)).toList();
  //     return books;
  //   });
  // }

  Future<bool> addBook({
    required String title,
    required String year,
    required String genreId,
    required String publisherId,
    required List<String> authorsId,
  }) async {
    state = const AsyncValue.loading();
    final res = await bookService.add(
      title,
      year,
      genreId,
      publisherId,
      authorsId,
    );
    if (!res.success || res.results == null) {
      return false;
    }
    final book = BookModel.fromParseObject(res.results![0]);
    state = await AsyncValue.guard(() {
      return Future.delayed(
        const Duration(seconds: 2),
        () => [...?state.value, book],
      );
    });
    return true;
  }
}

// @Riverpod(keepAlive: true)
// class BookController extends _$BookController {
//   late final BookService bookService;

//   @override
//   List<BookModel> build() {
//     bookService = ref.watch(bookServiceProvider);
//     return [];
//   }

  
// }


/*
List<Book>
...state equivalent state[0], state[1], ...state[n-1]

state = [...state, book]
state = [state[0], state[1], state[n-1], book]

final List<BookModel> books =
        response.map((e) => BookModel.fromMap(e)).toList();
state = books;

state = [...state, ...books]


Future<bool> getBooks() async {
  final response = await authorRepository.get();
  if (response.isEmpty) {
    return false;
  }
  final List<BookModel> books =
      response.map((e) => BookModel.fromMap(e)).toList();
  state = books;
  return true;
}

*/