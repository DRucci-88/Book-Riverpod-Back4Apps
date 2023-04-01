import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RegistrationType { genre, publisher, author }

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
  final textCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New ${widget.registrationType.name}'),
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
                      controller: textCtl,
                      decoration: InputDecoration(
                          labelText: "New ${widget.registrationType.name}",
                          labelStyle: const TextStyle(color: Colors.blue)),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text("ADD"),
                    onPressed: () => '',
                    // onPressed: addRegistration,
                  )
                ],
              )),
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
