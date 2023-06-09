import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/presenter/search/search_bloc.dart';
import 'package:github_search/modules/search/states/state.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}
void main() {
    final usecase = SearchByTextMock();
    final bloc = SearchBloc(usecase);

  test("deve retornar os estados na ordem correta", (){

    when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(bloc, emitsInOrder([
      isA<SearchLoading>(),
      isA<SearchSucess>(),
    ]));
    bloc.add("jacob");
  });
}