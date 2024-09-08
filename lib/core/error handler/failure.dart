import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError(String message) = ServerError;
  const factory Failure.clientError(String message) = ClientError;
  const factory Failure.networkError(String message) = NetworkError;
  const factory Failure.unauthorized(String message) = Unauthorized;
  // const factory Failure.unexpected(String message, StackTrace stackTrace) = UnexpectedError;
}
