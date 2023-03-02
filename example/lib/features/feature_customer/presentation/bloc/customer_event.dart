part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent {}

class GetAllCustomerEvent extends CustomerEvent {}


class SaveCwEvent extends CustomerEvent {
  final CustomerParams customerParams;
  // final String firstName;
  // final String lastName;
  // final String email;
  // final String dateOfBirth;
  // final String phoneNumber;
  // final String bankAccountNumber;
  SaveCwEvent(this.customerParams);
}

class SaveCustomerInitialEvent extends CustomerEvent {}


