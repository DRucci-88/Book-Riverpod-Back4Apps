import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/book_controller.dart';
import 'package:parse_learning/book_app/controller/publisher_controller.dart';
import 'package:parse_learning/book_app/widget/book_tile_widget.dart';

class BookListPage extends ConsumerWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publishers = ref.watch(publisherControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: publishers.length,
        itemBuilder: (context, index) {
          final books = ref
              .watch(getBooksByPublisherProvider(publishers[index].objectId));
          return ExpansionTile(
            title: Text(publishers[index].name),
            children: [
              books.when(
                data: (data) {
                  return BookTileWidget(books: data);
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
              )
            ],
          );
        },
      ),
    );
  }
}
