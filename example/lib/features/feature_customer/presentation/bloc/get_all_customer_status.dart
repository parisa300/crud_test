


import 'package:equatable/equatable.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';



abstract class GetAllCustomerStatus extends Equatable{}

// loading state
class GetAllCustomerLoading extends GetAllCustomerStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loaded state
class GetAllCustomerCompleted extends GetAllCustomerStatus{
  final List<CustomerEntity> customer;
  GetAllCustomerCompleted(this.customer);

  @override
  // TODO: implement props
  List<Object?> get props => [customer];
}

// error state
class GetAllCustomerError extends GetAllCustomerStatus{
  final String? message;
  GetAllCustomerError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}