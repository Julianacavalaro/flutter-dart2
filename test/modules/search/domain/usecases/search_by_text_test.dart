

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
// coloquei o async pois vou trabalhar com uma Future

    when(repository.search(any))
        // .thenAnswer((_) => Future.value(Right(<ResultSearch>)));
        // ignore: prefer_const_constructors
        .thenAnswer((_) async => Right(<ResultSearch>[]));
//quando chama o mockito ele vai retornar
//async transforma o que tem dentro em uma Future

    final result = await usecase("jacob");

    // expect(result, isA<Right>());
    expect(result! | null, isA<List<ResultSearch>>());
  });

  test('deve retornar uma exception caso o texto seja invalido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    //expect(result!.isLeft(), true);
    // expect(result.fold((l) => l, (r) => r)
    expect(result!.fold(id, id), isA<InvalidTextError>()); //id e do dartz

    result = await usecase("");
    expect(result!.fold(id, id), isA<InvalidTextError>()); //id e do dartz
  });
}
