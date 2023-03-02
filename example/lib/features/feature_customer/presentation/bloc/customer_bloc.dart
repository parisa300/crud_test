

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:phone_number_example/features/feature_customer/presentation/bloc/save_customer_status.dart';
import '../../../../core/customer_params.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/use_cases/get_all_customer_usecase.dart';
import '../../domain/use_cases/save_customer_usecase.dart';

import 'get_all_customer_status.dart';
part 'customer_event.dart';
part 'customer_state.dart';
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {

  SaveCustomerUseCase saveCustomerUseCase;
  GetAllCustomerUseCase getAllCustomerUseCase;


  CustomerBloc(

      this.saveCustomerUseCase,
      this.getAllCustomerUseCase,

      ) : super(CustomerState(

      saveCustomerStatus: SaveCustomerInitial(),
      getAllCustomerStatus: GetAllCustomerLoading(),

  )) {



    /// get All customer
    on<GetAllCustomerEvent>((event, emit) async {

      /// emit Loading state
      emit(state.copyWith(newGetAllCustomerStatus: GetAllCustomerLoading()));

      DataState dataState = await getAllCustomerUseCase(NoParams());

      /// emit Complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newGetAllCustomerStatus: GetAllCustomerCompleted(dataState.data)));
      }

      /// emit Error state
      if(dataState is DataFailed){
        emit(state.copyWith(newGetAllCustomerStatus: GetAllCustomerError(dataState.error)));
      }
    });



    /// Save Customer Event
    on<SaveCwEvent>((event, emit) async {

      /// emit Loading state
      emit(state.copyWith(newSaveStatus: SaveCustomerLoading()));

      DataState dataState = await saveCustomerUseCase(event.customerParams);

      /// emit Complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newSaveStatus: SaveCustomerCompleted(dataState.data)));
      }

      /// emit Error state
      if(dataState is DataFailed){
        emit(state.copyWith(newSaveStatus: SaveCustomerError(dataState.error)));
      }
    });


  }
}
