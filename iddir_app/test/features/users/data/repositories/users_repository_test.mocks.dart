// Mocks generated by Mockito 5.4.6 from annotations
// in iddir_app/test/features/users/data/repositories/users_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:iddir_app/features/users/data/data_sources/users_remote_datasource.dart'
    as _i4;
import 'package:iddir_app/features/users/data/models/users_model.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUsersModel_1 extends _i1.SmartFake implements _i3.UsersModel {
  _FakeUsersModel_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [UsersRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersRemoteDatasource extends _i1.Mock
    implements _i4.UsersRemoteDatasource {
  MockUsersRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio =>
      (super.noSuchMethod(
            Invocation.getter(#dio),
            returnValue: _FakeDio_0(this, Invocation.getter(#dio)),
          )
          as _i2.Dio);

  @override
  _i5.Future<List<_i3.UsersModel>> getAllUsers(String? token) =>
      (super.noSuchMethod(
            Invocation.method(#getAllUsers, [token]),
            returnValue: _i5.Future<List<_i3.UsersModel>>.value(
              <_i3.UsersModel>[],
            ),
          )
          as _i5.Future<List<_i3.UsersModel>>);

  @override
  _i5.Future<_i3.UsersModel> getUser(String? token, String? userId) =>
      (super.noSuchMethod(
            Invocation.method(#getUser, [token, userId]),
            returnValue: _i5.Future<_i3.UsersModel>.value(
              _FakeUsersModel_1(
                this,
                Invocation.method(#getUser, [token, userId]),
              ),
            ),
          )
          as _i5.Future<_i3.UsersModel>);

  @override
  _i5.Future<bool> deleteUser({
    required String? token,
    required String? userId,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#deleteUser, [], {
              #token: token,
              #userId: userId,
            }),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);
}
