import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utils/service_locator.dart';
import 'package:untitled/features/home/cuibt/fetch_data_cubit.dart';
import 'package:untitled/features/home/data/rops/home_repo_imp.dart';
import 'core/widget/custoumcard.dart';

void main() {
  setup(); //DI (injectable-get it) fun
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDataCubit(getIt.get<HomeRepoImp>())   //DI (injectable-get it)
        ..fetchData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataCubit, FetchDataState>(
      builder: (context, state) {
        if (state is FetchDataSuccess) {
          return SafeArea(
            child: Scaffold(
              body: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  childAspectRatio:
                      4 / 5.3, // Adjust the aspect ratio as needed
                  crossAxisSpacing: 15, // Space between columns
                  mainAxisSpacing: 20, // Space between rows
                ),
                itemCount: state.products.length, // Number of items
                itemBuilder: (context, index) {
                  return  CustomCard(item: state.products[index],);
                },
              ),
            ),
          );
        }  else if(state is FetchDataLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else   {
          return const Scaffold(
            body: Center(
              child: Text("error while loding the data"),
            ),
          );
        }
      },
    );
  }
}
