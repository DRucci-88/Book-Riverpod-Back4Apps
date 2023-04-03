import 'package:parse_learning/book_app/controller/registration_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_service.g.dart';

@riverpod
RegistrationService registrationService(RegistrationServiceRef ref) {
  return RegistrationService();
}

class RegistrationService {
  RegistrationService();

  Future<ParseResponse> add(
    RegistrationType registrationType,
    String name,
  ) async {
    final res = ParseObject(registrationType.className)..set('name', name);
    return await res.save();
  }

  Future<List<ParseObject>> gets(
    RegistrationType registrationType,
  ) async {
    final queryRegistration =
        QueryBuilder(ParseObject(registrationType.className));
    final apiResponse = await queryRegistration.query();
    if (!apiResponse.success || apiResponse.results == null) {
      return [];
    }
    return apiResponse.results as List<ParseObject>;
  }
}
