
import 'package:equatable/equatable.dart';

import '../../domain/entities/customer_entity.dart';




abstract class SaveCustomerStatus extends Equatable{}

class SaveCustomerInitial extends SaveCustomerStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loading state
class SaveCustomerLoading extends SaveCustomerStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loaded state
class SaveCustomerCompleted extends SaveCustomerStatus{
  final CustomerEntity customer;
  SaveCustomerCompleted(this.customer);

  @override
  // TODO: implement props
  List<Object?> get props => [customer];
}

// error state
class SaveCustomerError extends SaveCustomerStatus{
  final String? message;
  SaveCustomerError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
