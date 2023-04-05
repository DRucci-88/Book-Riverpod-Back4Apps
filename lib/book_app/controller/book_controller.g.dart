// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBooksByPublisherHash() =>
    r'753996c70477028a2138e2910e3981ae11b21ef3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetBooksByPublisherRef = AutoDisposeFutureProviderRef<List<BookModel>>;

/// See also [getBooksByPublisher].
@ProviderFor(getBooksByPublisher)
const getBooksByPublisherProvider = GetBooksByPublisherFamily();

/// See also [getBooksByPublisher].
class GetBooksByPublisherFamily extends Family<AsyncValue<List<BookModel>>> {
  /// See also [getBooksByPublisher].
  const GetBooksByPublisherFamily();

  /// See also [getBooksByPublisher].
  GetBooksByPublisherProvider call(
    String publisherId,
  ) {
    return GetBooksByPublisherProvider(
      publisherId,
    );
  }

  @override
  GetBooksByPublisherProvider getProviderOverride(
    covariant GetBooksByPublisherProvider provider,
  ) {
    return call(
      provider.publisherId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getBooksByPublisherProvider';
}

/// See also [getBooksByPublisher].
class GetBooksByPublisherProvider
    extends AutoDisposeFutureProvider<List<BookModel>> {
  /// See also [getBooksByPublisher].
  GetBooksByPublisherProvider(
    this.publisherId,
  ) : super.internal(
          (ref) => getBooksByPublisher(
            ref,
            publisherId,
          ),
          from: getBooksByPublisherProvider,
          name: r'getBooksByPublisherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBooksByPublisherHash,
          dependencies: GetBooksByPublisherFamily._dependencies,
          allTransitiveDependencies:
              GetBooksByPublisherFamily._allTransitiveDependencies,
        );

  final String publisherId;

  @override
  bool operator ==(Object other) {
    return other is GetBooksByPublisherProvider &&
        other.publisherId == publisherId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, publisherId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$bookControllerHash() => r'f00e15bc55485fd3078c579c1d04e79725798cf0';

/// See also [BookController].
@ProviderFor(BookController)
final bookControllerProvider =
    AsyncNotifierProvider<BookController, List<BookModel>>.internal(
  BookController.new,
  name: r'bookControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookController = AsyncNotifier<List<BookModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
