import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/page/book_list_page.dart';
import 'package:parse_learning/book_app/page/book_page.dart';
import 'package:parse_learning/book_app/page/registration_page.dart';
import 'package:parse_learning/book_app/controller/registration_controller.dart';

class BookRiverpodApp extends ConsumerStatefulWidget {
  const BookRiverpodApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookRiverpodAppState();
}

class _BookRiverpodAppState extends ConsumerState<BookRiverpodApp> {
  @override
  void initState() {
    super.initState();
    ref
        .read(registrationControllerProvider)
        .fetchAllRegistration()
        .then((value) => debugPrint('fetchAllRegistration: $value'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: Image.network(
                  'https://blog.back4app.com/wp-content/uploads/2017/11/logo-b4a-1-768x175-1.png'),
            ),
            const Center(
              child: Text('Flutter on Back4app - Associations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('Add Genre'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage(
                            registrationType: RegistrationType.genre)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('Add Publisher'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage(
                            registrationType: RegistrationType.publisher)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('Add Author'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage(
                            registrationType: RegistrationType.author)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('Add Book'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('List Publisher/Book'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookListPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
