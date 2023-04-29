import 'package:avangenio/core/error/exeptions.dart';
import 'package:avangenio/features/auth/data/datasource/user_local_data_source.dart';
import 'package:avangenio/features/auth/data/models/user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_local_data_source_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeSharedPreferences extends Mock implements SharedPreferences {}

@GenerateMocks([FakeSharedPreferences])
void main() {
  late UserLocalDataSourceImpl userLocalDataSourceImpl;
  late MockFakeSharedPreferences mockFakeSharedPreferences;

  setUp(() {
    mockFakeSharedPreferences = MockFakeSharedPreferences();
    userLocalDataSourceImpl =
        UserLocalDataSourceImpl(sharedPreferences: mockFakeSharedPreferences);
  });

  const UserModel user = UserModel(
    fullName: 'Roger',
    email: 'roger@gmail.com',
    password: 'Roger98@*.',
  );

  const String userJson =
      '{"fullName":"Roger","email":"roger@gmail.com","password":"Roger98@*."}';

  test('should get a user value from the shared_preferences', () async {
    //arrange
    when(mockFakeSharedPreferences.getString(any)).thenReturn(userJson);
    when(mockFakeSharedPreferences.setBool(any, true))
        .thenAnswer((_) async => true);
    when(mockFakeSharedPreferences.setString(any, user.email))
        .thenAnswer((_) async => true);

    //act
    final result = await userLocalDataSourceImpl.loginUserWithEmailAndPassword(
        email: user.email, password: user.password!);

    //asert
    verify(mockFakeSharedPreferences.getString(user.email));
    verify(mockFakeSharedPreferences.setBool('loged', true));
    verify(mockFakeSharedPreferences.setString('emailLoged', user.email));
    expect(result, equals(user));
  });

  test(
      'should throw a CacheException when there is no user in shared_preferences',
      () async {
    // Arrange
    when(mockFakeSharedPreferences.getString(any)).thenReturn(null);

    // Act
    final call = userLocalDataSourceImpl.loginUserWithEmailAndPassword;

    // Assert
    expect(() => call(email: user.email, password: user.password!),
        throwsA(isA<CacheExeption>()));
  });
}
