import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/author_controller.dart';
import 'package:parse_learning/book_app/controller/book_controller.dart';
import 'package:parse_learning/book_app/controller/genre_controller.dart';
import 'package:parse_learning/book_app/controller/publisher_controller.dart';
import 'package:parse_learning/book_app/controller/registration_controller.dart';
import 'package:parse_learning/book_app/model/author_model.dart';
import 'package:parse_learning/book_app/model/book_model.dart';
import 'package:parse_learning/book_app/model/genre_model.dart';
import 'package:parse_learning/book_app/model/publisher_model.dart';
import 'package:parse_learning/book_app/page/check_box_group_widget.dart';

class BookPage extends ConsumerStatefulWidget {
  const BookPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookPageState();
}

class _BookPageState extends ConsumerState<BookPage> {
  final _titleCtl = TextEditingController();
  final _yearCtl = TextEditingController();

  List<AuthorModel> authors = [];
  GenreModel? genre;
  PublisherModel? publisher;

  bool checkAddBookValidation() {
    if (_titleCtl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(
            'Empty Book Title',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
      return false;
    }

    if (_yearCtl.text.trim().length != 4) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(
            'Invalid Year',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
      return false;
    }

    if (genre == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(
            'Select Genre',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
      return false;
    }

    if (publisher == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(
            'Select Publisher',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
      return false;
    }

    if (authors.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(
            'Select Author',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
      return false;
    }
    return true;
  }

  void saveBook() {
    if (!checkAddBookValidation()) return;

    ref.read(bookControllerProvider.notifier).addBook(
          title: _titleCtl.text.trim(),
          year: _yearCtl.text.trim(),
          genreId: genre!.objectId,
          publisherId: publisher!.objectId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authorList = ref.watch(authorControllerProvider);
    final genreList = ref.watch(genreControllerProvider);
    final publisherList = ref.watch(publisherControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autocorrect: false,
              controller: _titleCtl,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              controller: _yearCtl,
              maxLength: 4,
              decoration: const InputDecoration(
                labelText: 'Year',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Publisher',
              style: TextStyle(fontSize: 16),
            ),
            CheckBoxGroupWidget(
              registrationType: RegistrationType.publisher,
              multipleSelection: false,
              items: publisherList,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  publisher = PublisherModel.fromRegisterModel(value.first);
                }
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Genre',
              style: TextStyle(fontSize: 16),
            ),
            CheckBoxGroupWidget(
              registrationType: RegistrationType.genre,
              multipleSelection: false,
              items: genreList,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  genre = GenreModel.fromRegisterModel(value.first);
                }
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Author',
              style: TextStyle(fontSize: 16),
            ),
            CheckBoxGroupWidget(
              registrationType: RegistrationType.author,
              multipleSelection: true,
              items: authorList,
              onChanged: (value) {
                authors =
                    value.map((e) => AuthorModel.fromRegisterModel(e)).toList();
              },
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: saveBook,
                child: const Text('Save Book'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
