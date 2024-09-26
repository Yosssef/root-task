part of 'fetch_data_cubit.dart';


abstract class FetchDataState extends Equatable {
  const FetchDataState();

  @override
  List<Object> get props => [];
}
final class FetchDataInitial extends FetchDataState {}

final class FetchDataLoading extends FetchDataState {}

final class FetchDataSuccess extends FetchDataState {
  final List<Product> products;

  const FetchDataSuccess(this.products);
}

final class FetchDataFailure extends FetchDataState {
  final String errMessage;
  const FetchDataFailure(this.errMessage);
}
