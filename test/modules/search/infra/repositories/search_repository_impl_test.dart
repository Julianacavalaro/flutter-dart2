

import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../../lib/modules/search/infra/repositories/datasource/search_datasource.dart';
import '../../../../../lib/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDataSource {}

 main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);


  test('deve retornar uma lista de ResultSearch', (){
    when(datasource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[]);
  });

}
