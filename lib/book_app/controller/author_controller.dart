import 'package:parse_learning/book_app/model/author_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'author_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthorController extends _$AuthorController {
  @override
  List<AuthorModel> build() {
    return [];
  }

  void add(AuthorModel author) {
    state = [...state, author];
  }

  void addAll(List<AuthorModel> authors) {
    // debugPrint('AuthorController - Add All - Before');
    // for (int i = 0; i < state.length; i++) {
    //   debugPrint(state[i].toString());
    // }
    state = authors;
    // debugPrint('AuthorController - Add All - After');
    // for (int i = 0; i < state.length; i++) {
    //   debugPrint(state[i].toString());
    // }
  }
}

// final authorControllerProvider =
//     StateNotifierProvider<AuthorController, List<AuthorModel>>((ref) {
//   return AuthorController();
// });

// class AuthorController extends StateNotifier<List<AuthorModel>> {
//   AuthorController() : super([]);

//   void add(AuthorModel author) {
//     state = [...state, author];
//   }

//   void addAll(List<AuthorModel> authors) {
//     state = [...authors];
//   }
// }
