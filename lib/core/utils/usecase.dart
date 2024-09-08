abstract interface class Usecase<Return, Params> {
  Future<Return> call(Params params);
}
