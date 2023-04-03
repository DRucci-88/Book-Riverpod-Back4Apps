import 'package:parse_learning/book_app/model/genre_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'genre_controller.g.dart';

@Riverpod(keepAlive: true)
class GenreController extends _$GenreController {
  @override
  List<GenreModel> build() {
    return [];
  }

  void add(GenreModel genre) {
    state = [...state, genre];
  }

  void addAll(List<GenreModel> genres) {
    state = genres;
  }
}
