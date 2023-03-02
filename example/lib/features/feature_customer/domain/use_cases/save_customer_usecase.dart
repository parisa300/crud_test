




import 'package:phone_number_example/features/feature_customer/domain/repository/customer_repository.dart';

import '../../../../core/customer_params.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/customer_entity.dart';

class SaveCustomerUseCase implements UseCase<DataState<CustomerEntity>,CustomerParams >{
  final CustomerRepository _customerRepository;
  SaveCustomerUseCase(this._customerRepository);

  @override
  Future<DataState<CustomerEntity>> call(CustomerParams params) {
    return _customerRepository.saveCustomerToDB(params);
  }
}