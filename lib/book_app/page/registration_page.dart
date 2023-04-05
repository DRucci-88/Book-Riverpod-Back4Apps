import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/author_controller.dart';
import 'package:parse_learning/book_app/controller/genre_controller.dart';
import 'package:parse_learning/book_app/controller/publisher_controller.dart';
import 'package:parse_learning/book_app/controller/registration_controller.dart';
import 'package:parse_learning/book_app/model/registration_model.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({
    super.key,
    required this.registrationType,
  });

  final RegistrationType registrationType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _textCtl = TextEditingController();
  RegistrationType get registrationType => widget.registrationType;

  void addRegistrarion() async {
    final isSuccess =
        await ref.read(registrationControllerProvider).addRegistrationByType(
              registrationType: registrationType,
              name: _textCtl.text.trim(),
            );
    _textCtl.clear();
    debugPrint('Add ${registrationType.className} : $isSuccess');
  }

  @override
  Widget build(BuildContext context) {
    List<RegistrationModel> registrationList = [];

    if (registrationType == RegistrationType.author) {
      registrationList = ref.watch(authorControllerProvider);
    } else if (registrationType == RegistrationType.genre) {
      registrationList = ref.watch(genreControllerProvider);
    } else if (registrationType == RegistrationType.publisher) {
      registrationList = ref.watch(publisherControllerProvider);
    }

    for (int i = 0; i < registrationList.length; i++) {
      debugPrint(registrationList[i].toString());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('New ${registrationType.name}'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _textCtl,
                    decoration: InputDecoration(
                      labelText: "New ${widget.registrationType.name}",
                      labelStyle: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: addRegistrarion,
                  child: const Text("ADD"),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: registrationList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(registrationList[index].name),
                );
              },
            ),
          ),
          // Expanded(
          //   child: FutureBuilder<List<ParseObject>>(
          //     future: doListRegistration(),
          //     builder: (context, snapshot) {
          //       switch (snapshot.connectionState) {
          //         case ConnectionState.none:
          //         case ConnectionState.waiting:
          //           return Center(
          //             child: Container(
          //                 width: 100,
          //                 height: 100,
          //                 child: CircularProgressIndicator()),
          //           );
          //         default:
          //           if (snapshot.hasError) {
          //             return Center(
          //               child: Text("Error..."),
          //             );
          //           } else {
          //             return ListView.builder(
          //                 padding: EdgeInsets.only(top: 10.0),
          //                 itemCount: snapshot.data.length,
          //                 itemBuilder: (context, index) {
          //                   return ListTile(
          //                     title: Text(
          //                         snapshot.data[index].get<String>('name')),
          //                   );
          //                 });
          //           }
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
