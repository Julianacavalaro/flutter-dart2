import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/infra/repositories/datasource/search_datasource.dart';

// interface de adaptacao
class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
// intercepta;ao de dados externos
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DatasourceError());
    }
  }
}
