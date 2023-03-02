//
// import 'package:crud_test/features/feature_customer/presentation/bloc/customer_bloc.dart';
// import 'package:crud_test/features/feature_customer/presentation/bloc/save_customer_status.dart';
// import 'package:crud_test/features/feature_customer/presentation/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import '../../../../core/customer_params.dart';
//
//
// class CustomerButtonClick extends StatelessWidget {
//   final CustomerParams params;
//
//   const CustomerButtonClick({super.key, required this.params});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final height = MediaQuery.of(context).size.height;
//
//
//     return BlocBuilder<CustomerBloc,CustomerState>(
//       buildWhen: (previous, current){
//         /// if state don't change => don't rebuild UI
//         if(current.getAllCustomerStatus == previous.getAllCustomerStatus){
//           return false;
//         }
//         return true;
//       },
//       builder: (context, state){
//         /// initial save Bloc
//         BlocProvider.of<CustomerBloc>(context).add(SaveCustomerInitialEvent());
//
//         // /// show Loading for CustomerStatus
//         // if(state.getCustomerStatus is GetCustomerLoading){
//         //   return const CircularProgressIndicator();
//         // }
//         //
//         // /// show completed for CustomerStatus
//         // if(state.getCustomerStatus is GetCustomerCompleted){
//         //
//         //   /// casting for Getting
//         //   final GetCustomerCompleted getCustomerCompleted = state.getCustomerStatus as GetCustomerCompleted;
//         //   final CustomerEntity? customer = getCustomerCompleted.;
//
//           return BlocConsumer<CustomerBloc, CustomerState>(
//             listenWhen: (previous, current){
//               /// if state don't change => don't listen to changes
//               if(current.saveCustomerStatus == previous.saveCustomerStatus){
//                 return false;
//               }
//               return true;
//             },
//             buildWhen: (previous, current){
//               /// if state don't change => don't rebuild UI
//               if(current.saveCustomerStatus == previous.saveCustomerStatus){
//                 return false;
//               }
//               return true;
//             },
//             listener: (context, customerState) {
//
//               /// show Error as SnackBar
//               if (customerState.saveCustomerStatus is SaveCustomerError) {
//                 /// cast for getting Error
//                 final SaveCustomerError saveCustomerError = customerState.saveCustomerStatus as SaveCustomerError;
//
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text(saveCustomerError.message!),
//                   behavior: SnackBarBehavior.floating, // Add this line
//                 ),);
//               }
//
//               /// show Success SnackBar
//               if (customerState.saveCustomerStatus is SaveCustomerCompleted) {
//                 /// cast for getting Data
//                 final SaveCustomerCompleted saveCustomerCompleted = customerState.saveCustomerStatus as SaveCustomerCompleted;
// /////
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text("${saveCustomerCompleted.customer.firstName} Added to Customer"),
//                   behavior: SnackBarBehavior.floating, // Add this line
//                 ),);
//               }
//             },
//             builder: (context, customerState) {
//
//               /// show UI for initial CustomerCity
//               if(customerState.saveCustomerStatus is SaveCustomerInitial){
//                 return CustomButton(
//                   onPressed: () {
//                     /// call event for save Current Customer in Database
//                     BlocProvider.of<CustomerBloc>(context).add(SaveCwEvent(params));
//                   },
//                  title: 'Add',);
//               }
//
//               /// show UI for Loading SaveCustomer
//               if (customerState.saveCustomerStatus is SaveCustomerLoading) {
//                 return const CircularProgressIndicator();
//               }
//
//               /// show UI for Completed or Error SaveCustomer
//               return CustomButton(
//                 onPressed: () {
//                   /// call event for save Current Customer in Database
//                   BlocProvider.of<CustomerBloc>(context).add(SaveCwEvent(params));
//                 },
//               title: 'Add',);
//
//             },
//           );
//         }
//
//         // /// show Error for CustomerStatus
//         // if(state.getCustomerStatus is GetCustomerError){
//         //   return IconButton(
//         //     onPressed: (){
//         //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //       //   content: Text("please load a customer!"),
//         //       //   behavior: SnackBarBehavior.floating, // Add this line
//         //       // ));
//         //     },
//         //     icon: const Icon(Icons.error,color: Colors.white,size: 35),);
//         // }
//
//         /// default value
//      ///   return Container();
//  //  },
//     );
//   }
// }
