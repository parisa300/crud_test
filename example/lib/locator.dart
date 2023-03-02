

import 'package:get_it/get_it.dart';

import 'features/feature_customer/data/data_source/local/app_database_customer.dart';
import 'features/feature_customer/data/repository/customer_repositoy_impl.dart';
import 'features/feature_customer/domain/repository/customer_repository.dart';
import 'features/feature_customer/domain/use_cases/get_all_customer_usecase.dart';
import 'features/feature_customer/domain/use_cases/save_customer_usecase.dart';
import 'features/feature_customer/presentation/bloc/customer_bloc.dart';


GetIt locator = GetIt.instance;

setup() async {


  final database = await $FloorAppDataBaseCustomer.databaseBuilder('app_database_customer.db').build();
  locator.registerSingleton<AppDataBaseCustomer>(database);
  /// repositories
  locator.registerSingleton<CustomerRepository>(CustomerRepositoryImpl(database.customerDao));


  /// use case

  locator.registerSingleton<SaveCustomerUseCase>(SaveCustomerUseCase(locator()));
  locator.registerSingleton<GetAllCustomerUseCase>(GetAllCustomerUseCase(locator()));


 ///bloc

  locator.registerSingleton<CustomerBloc>(CustomerBloc(locator(),locator()));
}