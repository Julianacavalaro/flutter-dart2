import 'package:github_search/modules/search/presenter/search/states/state.dart';

import '../domain/entities/result_search.dart';
//state mae/pai
abstract class SeachState {}

// states filhos
class SearchSucess implements SearchState {
  final  List<ResultSearch> list;

  SearchSucess(this.list);
}

class SearchStart  implements SeachState{}

class SearchLoading  implements SeachState{}

class SearchErro  implements SeachState{}
