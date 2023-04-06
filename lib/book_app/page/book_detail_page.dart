import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/model/book_model.dart';

class BookDetailPage extends ConsumerWidget {
  const BookDetailPage({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Title: ${book.title}'),
        const SizedBox(height: 8),
        Text('Year: ${book.year}'),
        const SizedBox(height: 8),
        const Divider(),
        // Text('Genre: $bookGenre'),
        const SizedBox(height: 8),
        const Divider(),
        // Text('Publisher: $bookPublisher'),
        const SizedBox(height: 8),
        const Divider(),
        const Text('Authors'),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: bookAuthors.map((a) => Text(a)).toList(),
        // )
      ],
    );
  }
}
