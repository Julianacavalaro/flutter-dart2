 import 'dart:convert';
 import 'package:flutter_test/flutter_test.dart';
 import 'package:dio/dio.dart';
 import 'package:github_search/modules/search/domain/errors/errors.dart';
 import 'package:github_search/modules/search/external/datasource/github_datasource.dart';
import 'package:mockito/mockito.dart';

//import 'package:flutter_driver/flutter_driver.dart';

import '../../utils/github_response.dart';
class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  //p funcionar crio uma inst"ancia dele
  // ignore: unused_local_variable
  final datasource = GithubDatasource(dio);
var resp = Response(data: jsonDecode(githubResult), statusCode: 200 );

  test("deve retornar uma lista de ResultSearchModel", () async {
      var answer = when(dio.get(any))
        .thenAnswer((_)  async =>  Response(data: jsonDecode(githubResult), statusCode: 200 ));

 
    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });


    test("deve retornar um erro se o codigo nao for 200", () async {
      when(dio.get(any))

    .thenAnswer((_) async =>  Response(data: null, statusCode: 401));

 
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });    test("deve retornar um erro se o codigo nao for 200", () async {
      when(dio.get(any))

    .thenAnswer((_) async =>  Response(data: null, statusCode: 401));

 
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });

}
