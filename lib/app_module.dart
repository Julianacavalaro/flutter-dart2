
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'package:flutter/src/widgets/framework.dart';
import 'package:github_search/app_widget.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/external/datasource/github_datasource.dart';
import 'package:github_search/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:github_search/modules/search/presenter/search/search_page.dart';

class AppModule extends Module {
// @override
// List<Bind> get binds => throw UnimplementedError();

@override
List<Router> get routers => throw UnimplementedError();

@override
Widget get bootstrap => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();

  @override
   List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];
//  @override
//   final List<Bind> binds = [];

  //@override
  // List<ModularRoute> routes = [];
@override
  List<Router> get routers => [
      Router('/', child: (_, __) => SearchPage()),
    // Router(restorationScopeId: '/', routerDelegate: Null,
    // child:(_, _) => SearchPage()),
  ];//throw UnimplementedError();


}

// class MainModule {

  
//   // @override
//   // List<Router> get routers {
//   //   var router = Router(restorationScopeId: "/", routerDelegate: null,
//   //   child: (_, _) =>  SearchPage());
//   //   return [
//   //   router
//   // ];
//   // }
// }