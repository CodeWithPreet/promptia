import 'package:fpdart/fpdart.dart';
import 'package:promptia/core/core.dart';

typedef ValiatorCallback = String? Function(String? args);
// typedef Error = String;
// typedef Success = Type;
// typedef FutureEither<Error, Success> = Future<Either<Error, Success>>;

// typedef FutureEither<L, R> = Future<Either<L, R>>;
typedef FEither<L, R> = Future<Either<Failure, R>>;
// typedef FutureEitherVoid = FutureEither<Exception, void>;
