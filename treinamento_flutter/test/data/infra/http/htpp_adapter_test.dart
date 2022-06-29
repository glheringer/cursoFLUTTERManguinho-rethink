import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);

  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  }) async {
    final headers = {
      'content-type': 'aplication/json',
      'accept': 'aplication/json'
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    await client.post(url, headers: headers, body: jsonBody ); //metodo que passa para o teste, construtor
  }
}

class ClientSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
     client = ClientSpy();
     sut = HttpAdapter(client);
     url = faker.internet.httpUrl();
  });
  group('post', () {
    test('Should call post with correct values', () async {
      await sut.request(url: url, method: 'post', body : {'any_key' : 'any_value'}); //testando se  o body está vindo corretamente

      verify(client.post(
      url, 
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      },
      body: '{"any_key" : "any_value"}',
      ));
    });

      test('Should call post without body', () async {
      await sut.request(url: url, method: 'post'); //testando caso nao seja passado um body
      verify(client.post(
      any,
      headers: anyNamed('headers'),
      
      ));
    });
  });
}
