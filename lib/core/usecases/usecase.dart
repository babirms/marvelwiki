import 'package:dartz/dartz.dart';
import 'package:marvelwiki/core/network/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
