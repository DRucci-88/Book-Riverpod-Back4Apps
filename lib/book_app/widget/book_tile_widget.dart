import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/model/book_model.dart';
import 'package:parse_learning/book_app/page/book_detail_page.dart';

class BookTileWidget extends ConsumerStatefulWidget {
  const BookTileWidget({
    super.key,
    required this.books,
  });

  final List<BookModel> books;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookTileWidgetState();
}

class _BookTileWidgetState extends ConsumerState<BookTileWidget> {
  List<BookModel> get books => widget.books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text(books[index].title),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BookDetailPage(
                  book: books[index],
                );
              },
            ));
          },
        );
      },
    );
  }
}
