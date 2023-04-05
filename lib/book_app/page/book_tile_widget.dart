import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/book_controller.dart';
import 'package:parse_learning/book_app/model/book_model.dart';

class BookTileWidget extends ConsumerStatefulWidget {
  const BookTileWidget({
    super.key,
    required this.publisherId,
  });

  final String publisherId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookTileWidgetState();
}

class _BookTileWidgetState extends ConsumerState<BookTileWidget> {
  String get id => widget.publisherId;
  @override
  Widget build(BuildContext context) {
    debugPrint('Publisher ID : $id');

    final books = ref.watch(getBooksByPublisherProvider(id));
    return books.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 8),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(data[index].title),
              onTap: () {},
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("Error..."),
        );
      },
      loading: () {
        return const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
