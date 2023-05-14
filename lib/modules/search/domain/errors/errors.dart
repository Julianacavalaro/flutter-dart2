abstract class FailureSearch implements Exception {
}

class InvalidTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  String message= "Retorna se o c[odigo nao for 200]";
  

  DatasourceError({this.message});
}
