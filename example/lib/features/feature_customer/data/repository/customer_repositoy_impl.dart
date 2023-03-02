
import '../../../../core/customer_params.dart';
import '../../../../core/resource/data_state.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/repository/customer_repository.dart';
import '../data_source/local/customer_dao.dart';

class CustomerRepositoryImpl extends CustomerRepository{
  CustomerDao customerDao;
  CustomerRepositoryImpl(this.customerDao);



  /// call get All customer from DB and set status
  @override
  Future<DataState<List<CustomerEntity>>> getAllCustomerFromDB() async {
    try{
      List<CustomerEntity> customer =  await customerDao.getAllCustomers();
      return DataSuccess(customer);
    }catch(e){
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<CustomerEntity>> saveCustomerToDB(CustomerParams params) async{
         try{

        // check firstName exist or not
           CustomerEntity? checkFirstName = await customerDao.findCustomerByFirstName(params.firstName);
        if(checkFirstName != null){
          return DataFailed("${params.firstName} has Already exist");
        }
        // check lastName exist or not
        CustomerEntity? checkLastName = await customerDao.findCustomerByLastName(params.lastName);
        if(checkLastName != null){
          return DataFailed("${params.lastName} has Already exist");
        }


        // check email exist or not
        CustomerEntity? checkEmail = await customerDao.findCustomerByEmail(params.email);
        if(checkEmail != null){
          return DataFailed("${params.email} has Already exist");
        }


        // insert customer to database
        CustomerEntity customer = CustomerEntity(firstName: params.firstName,lastName:params.lastName,dateOfBirth:params.dateOfBirth,email:params.email,bankAccountNumber:params.bankAccountNumber, phoneNumber: params.phoneNumber);
        await customerDao.insertCustomer(customer);
        return DataSuccess(customer);

      }catch(e){
        print(e.toString());
        return DataFailed(e.toString());
      }
  }


  }

