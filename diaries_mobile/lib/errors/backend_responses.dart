abstract class BackEndResponse {}

class BackEndFailure {
  final int? code;
  final String? errorMessage;
  BackEndFailure({this.code, this.errorMessage});
}

class BackEndSuccess<T> {
  final T? data;
  BackEndSuccess({this.data});
}
