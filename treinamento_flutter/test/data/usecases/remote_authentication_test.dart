import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:treinamento_flutter/data/http/http.dart';
import 'package:treinamento_flutter/data/usecases/usecases.dart';

import 'package:treinamento_flutter/domain/usescases/authentication.dart';
import 'package:treinamento_flutter/domain/usescases/helpers/helpers.dart';




class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;
  AuthenticationParams params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(
        httpClient: httpClient, url: url); //system under test = sut
     params = AuthenticationParams(email: faker.internet.email(), secret: faker.internet.password());

  });
  test('Should call HttpClient with correct URL', () async {
    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
  test('Should throw UnexpectedError if HttpClient returns 400', () async {
      when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'),body: anyNamed('body'))).thenThrow(HttpError.badRequest);

      final future = sut.auth(params);

      expect(future, throwsA(DomainError.unexpected));

  });
  test('Should throw UnexpectedError if HttpClient returns 404', () async {
      when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'),body: anyNamed('body'))).thenThrow(HttpError.notFound);

      final future = sut.auth(params);

      expect(future, throwsA(DomainError.unexpected));

  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
      when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'),body: anyNamed('body'))).thenThrow(HttpError.serverError);

      final future = sut.auth(params);

      expect(future, throwsA(DomainError.unexpected));

  });
}
