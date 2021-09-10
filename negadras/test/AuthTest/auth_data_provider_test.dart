import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:negadras/auth/Constants/constants.dart';
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/models/models.dart';
import 'package:negadras/auth/models/response/loginResponse.dart';
import 'package:negadras/auth/models/response/registerResponse.dart';

import 'auth_data_provider_test.mocks.dart';

@GenerateMocks([http.Client])
main(){
    group('AuthProvider test',()
    {
      test('registers a user', () async {
        final client = MockClient();
        final String _baseUrl = "${StringConstants.BASE_URL_DEVICE}/auth";

        when(client
            .post(Uri.parse("$_baseUrl/register"),
            headers: anyNamed('headers'),
            body: anyNamed('body')))
            .thenAnswer((_) async => http.Response(
            '{ "username": "username", "firstName": "firstname","lastName": "lastname", "_id":"someID"}',
            200)
            );

        AuthDataProvider authDataProvider = new AuthDataProvider(client);

        expect(
            await authDataProvider
                .createRegister(
                Register(username: "username",
                    password: "password",
                    firstname: "firstName",
                    lastname: "lastName"))
            , isA<RegisterResponse>());
      });

      test('Register: throws an exception if the http call completes with an error', () {
        final client = MockClient();
        final String _baseUrl = "${StringConstants.BASE_URL_DEVICE}/auth";

        when(client
            .post(Uri.parse("$_baseUrl/register"),
            headers: anyNamed('headers'),
            body: anyNamed('body')))
            .thenAnswer((_) async =>
            http.Response(
                'Not Found',
                400));

        AuthDataProvider authDataProvider = new AuthDataProvider(client);

        expect(authDataProvider
            .createRegister(
            Register(username: "username",
                password: "password",
                firstname: "firstName",
                lastname: "lastName"))
            , throwsException);
      });

      test('login a user', () async {
        final client = MockClient();
        final String _baseUrl = "${StringConstants.BASE_URL_DEVICE}/auth";

        when(client
            .post(Uri.parse("$_baseUrl/login"),
            headers: anyNamed('headers'),
            body: anyNamed('body')))
            .thenAnswer((_) async =>
            http.Response(
                '{ "username": "username", "password": "password","token":"someToken", "id":"someID"}',
                200));

        AuthDataProvider authDataProvider = new AuthDataProvider(client);

        expect(
            await authDataProvider
                .readLogin(
                Login(username: "username",
                    password: "password"))
            , isA<LoginResponse>());
      });

      test('Login user: throws an exception if the http call completes with an error', () {
        final client = MockClient();
        final String _baseUrl = "${StringConstants.BASE_URL_DEVICE}/auth";

        when(client
            .post(Uri.parse("$_baseUrl/login"),
            headers: anyNamed('headers'),
            body: anyNamed('body')))
            .thenAnswer((_) async =>
            http.Response(
                'Not Found',
                400));

        AuthDataProvider authDataProvider = new AuthDataProvider(client);

        expect(authDataProvider
            .readLogin(
            Login(username: "username",
                password: "password"))
            , throwsException);
      });
    });
}