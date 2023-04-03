import 'package:parse_learning/book_app/model/publisher_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'publisher_controller.g.dart';

@Riverpod(keepAlive: true)
class PublisherController extends _$PublisherController {
  @override
  List<PublisherModel> build() {
    return [];
  }

  void add(PublisherModel publisher) {
    state = [...state, publisher];
  }

  void addAll(List<PublisherModel> publishers) {
    state = publishers;
  }
}
