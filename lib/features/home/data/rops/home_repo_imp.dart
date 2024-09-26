import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/core/utils/api_service.dart';
import 'package:untitled/features/home/data/model/itemcarddata.dart';
import 'package:untitled/features/home/data/rops/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failures, List<Product>>> fetchData() async {

   final List<Map<String, dynamic>>  data = await apiService.get();
      List<Product> products = [];
      for (var item in data  ) {
        print(item);
        products.add(Product.fromJson(item ));
      }
      return right(products);
    // } catch (e) {
    //   print("no");
    //   return left(ServerFailur());
    // }
  }
}
