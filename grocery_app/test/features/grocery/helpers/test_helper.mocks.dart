// Mocks generated by Mockito 5.4.4 from annotations
// in grocery_app/test/features/grocery/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:grocery_app/core/errors/failures.dart' as _i5;
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart'
    as _i6;
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GroceryRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGroceryRepository extends _i1.Mock implements _i3.GroceryRepository {
  MockGroceryRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.GroceryEntity>>> getGroceries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGroceries,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.GroceryEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.GroceryEntity>>(
          this,
          Invocation.method(
            #getGroceries,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.GroceryEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.GroceryEntity>> getGrocery(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getGrocery,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.GroceryEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.GroceryEntity>(
          this,
          Invocation.method(
            #getGrocery,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.GroceryEntity>>);
}
