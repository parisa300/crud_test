part of 'customer_bloc.dart';



class CustomerState extends Equatable{

  final SaveCustomerStatus saveCustomerStatus;
  final GetAllCustomerStatus getAllCustomerStatus;


  const CustomerState({

    required this.saveCustomerStatus,
    required this.getAllCustomerStatus,

  });

  CustomerState copyWith({

    SaveCustomerStatus? newSaveStatus,
    GetAllCustomerStatus? newGetAllCustomerStatus,

}){
    return CustomerState(

        saveCustomerStatus: newSaveStatus ?? saveCustomerStatus,
        getAllCustomerStatus: newGetAllCustomerStatus ?? getAllCustomerStatus,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [

    saveCustomerStatus,
    getAllCustomerStatus,

  ];
}
