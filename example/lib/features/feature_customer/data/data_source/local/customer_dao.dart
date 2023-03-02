
import 'package:floor/floor.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';

@dao
abstract class CustomerDao{
  @Query('SELECT * FROM CustomerEntity')
  Future<List<CustomerEntity>> getAllCustomers();

  @Query('SELECT * FROM CustomerEntity WHERE firstName = :firstName')
  Future<CustomerEntity?> findCustomerByFirstName(String firstName);

  @Query('SELECT * FROM CustomerEntity WHERE lastName = :lastName')
  Future<CustomerEntity?> findCustomerByLastName(String lastName);

  @Query('SELECT * FROM CustomerEntity WHERE email = :email')
  Future<CustomerEntity?> findCustomerByEmail(String email);


  @insert
  Future<void> insertCustomer(CustomerEntity customer);
}