import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/author_controller.dart';
import 'package:parse_learning/book_app/controller/genre_controller.dart';
import 'package:parse_learning/book_app/controller/publisher_controller.dart';
import 'package:parse_learning/book_app/model/author_model.dart';
import 'package:parse_learning/book_app/model/genre_model.dart';
import 'package:parse_learning/book_app/model/publisher_model.dart';
import 'package:parse_learning/book_app/service/registration_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'registration_controller.g.dart';

enum RegistrationType { genre, publisher, author }

extension RegistrationTypeMember on RegistrationType {
  String get className {
    switch (this) {
      case RegistrationType.author:
        return 'Author';
      case RegistrationType.genre:
        return 'Genre';
      case RegistrationType.publisher:
        return 'Publisher';
      default:
        return 'Invalid Registration Type';
    }
  }
}

@riverpod
RegistrationController registrationController(RegistrationControllerRef ref) {
  final registrationService = ref.watch(registrationServiceProvider);
  return RegistrationController(
    registrationService: registrationService,
    ref: ref,
  );
}

class RegistrationController {
  final RegistrationService registrationService;
  final Ref ref;

  RegistrationController({
    required this.registrationService,
    required this.ref,
  });

  Future<bool> addRegistrationByType({
    required RegistrationType registrationType,
    required String name,
  }) async {
    debugPrint('RegistrationController - addRegistrationByType');
    final res = await registrationService.add(registrationType, name);
    if (!res.success || res.results == null) {
      return false;
    }
    return true;
  }

  Future<bool> fetchAllRegistration() async {
    try {
      final res = await Future.wait([
        registrationService.gets(RegistrationType.author),
        registrationService.gets(RegistrationType.genre),
        registrationService.gets(RegistrationType.publisher),
      ], eagerError: true);
      for (int i = 0; i < res.length; i++) {
        for (int j = 0; j < res[i].length; j++) {
          debugPrint(res[i][j].toString());
        }
      }
      final authors = res[0].map((e) {
        return AuthorModel.fromParseObject(e);
      }).toList();
      ref.read(authorControllerProvider.notifier).addAll(authors);

      final genres = res[1].map((e) {
        return GenreModel.fromParseObject(e);
      }).toList();
      ref.read(genreControllerProvider.notifier).addAll(genres);

      final publishers = res[2].map((e) {
        return PublisherModel.fromParseObject(e);
      }).toList();
      ref.read(publisherControllerProvider.notifier).addAll(publishers);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return true;
  }
}
