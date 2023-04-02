import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/service/registration_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

class RegistrationController {
  final RegistrationService registrationService;

  RegistrationController({required this.registrationService});

  Future<bool> addRegistrationByType({
    required RegistrationType registrationType,
    required String name,
  }) async {
    debugPrint('RegistrationController - addRegistrationByType');
    final res = await registrationService.add(registrationType, name);
    if (!res.success || res.results == null) {
      return false;
    }
    return false;
  }
}
