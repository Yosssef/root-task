import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/home/data/model/itemcarddata.dart';
import 'package:untitled/features/home/data/rops/home_repo.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit(this.homeRepo) : super(FetchDataInitial());
  final HomeRepo homeRepo;
  Future<void> fetchData() async {
    emit(FetchDataLoading());
    var respons = await homeRepo.fetchData();
    respons.fold((failure) {
      emit(const FetchDataFailure("error"));
    }, (products) {
      emit(FetchDataSuccess(products));
    });
  }
}
