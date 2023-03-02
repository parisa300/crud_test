




import 'package:phone_number_example/core/resource/data_state.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';

import '../../../../core/customer_params.dart';

abstract class CustomerRepository{

  Future<DataState<CustomerEntity>> saveCustomerToDB(CustomerParams params);

  Future<DataState<List<CustomerEntity>>> getAllCustomerFromDB();
}