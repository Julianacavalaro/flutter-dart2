import 'package:bloc/bloc.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/presenter/search/states/state.dart';

class SearchBloc extends Bloc<String, SearchState> {

  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async*{
    yield SearchLoanding();
    final result = await  usecase(SearchText);
    yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
    
    // // TODO: implement mapEventToState
    // throw UnimplementedError();
  }
 // SearchBloc(List<ResultSearch> initialState) : super(initialState);

  // @override
  // Stream<List<ResultSearch>> mapEventToState(String event) {
  //   // TODO: implement mapEventToState
  //   throw UnimplementedError();
  // }

}