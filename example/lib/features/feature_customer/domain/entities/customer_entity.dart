
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
@entity
class CustomerEntity extends Equatable{

  @PrimaryKey(autoGenerate: true)
  int? id;

  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  CustomerEntity( {required this.firstName,required this.lastName, required this.dateOfBirth, required this.phoneNumber, required this.email,required this.bankAccountNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,dateOfBirth,phoneNumber,email,bankAccountNumber];

}