




import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';
import 'package:phone_number_example/features/feature_customer/domain/repository/customer_repository.dart';

import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/use_case.dart';

class GetAllCustomerUseCase implements UseCase<DataState<List<CustomerEntity?>>, NoParams>{
  final CustomerRepository _customerRepository;
  GetAllCustomerUseCase(this._customerRepository);

  @override
  Future<DataState<List<CustomerEntity>>> call(NoParams params) {
    return _customerRepository.getAllCustomerFromDB();
  }
}