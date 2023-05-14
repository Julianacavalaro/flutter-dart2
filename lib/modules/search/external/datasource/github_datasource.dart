// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';

import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:github_search/modules/search/infra/repositories/datasource/search_datasource.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

//Poliformismo
class GithubDatasource implements SearchDataSource {
  final Dio dio;
 //  final dioAdapter = DioAdapter(dio: dio);

  GithubDatasource(
    this.dio,
  );

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(
        "https://api.github.com/search/users?q=${searchText?.normalize()}");
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }
}
