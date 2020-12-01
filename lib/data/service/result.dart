import 'package:flutter/foundation.dart';
import 'app_error.dart';

abstract class Result {
  Result._();
  factory Result.success({dynamic data}) => Success(data: data);

  factory Result.failure({@required AppError error}) = Failure;
}

extension ResultObjectExt<T> on T {
  Result get asSuccess => Result.success(data: this);

  Result asFailure(Exception e) => Result.failure(error: AppError(e));
}

class Success extends Result {
  dynamic data;
  Success({
    this.data,
  }) : super._();
}

class Failure extends Result {
  AppError error;
  Failure({
    this.error,
  }) : super._();
}
