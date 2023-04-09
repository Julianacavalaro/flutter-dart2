import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:github_search/modules/search/infra/repositories/datasource/search_datasource.dart';

class GithubDatasource implements SearchDataSource {
  @override
  Future<List<ResultSearchModel?>?>? getSearch(String? searchText) {
    // TODO: implement getSearch
    throw UnimplementedError();
  }

}
class Youtube implements SearchDataSource {
  @override
  Future<List<ResultSearchModel?>?>? getSearch(String? searchText) {
    // TODO: implement getSearch
    throw UnimplementedError();
  }
}