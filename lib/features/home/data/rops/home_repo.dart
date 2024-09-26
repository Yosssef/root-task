import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/features/home/data/model/itemcarddata.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Product>>> fetchData();
}
