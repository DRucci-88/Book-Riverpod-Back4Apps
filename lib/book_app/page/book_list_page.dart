import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/book_controller.dart';
import 'package:parse_learning/book_app/controller/publisher_controller.dart';
import 'package:parse_learning/book_app/page/book_tile_widget.dart';

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
          return ExpansionTile(
            title: Text(publishers[index].name),
            children: [
              BookTileWidget(publisherId: publishers[index].objectId),
            ],
          );
        },
      ),
    );
  }
}
