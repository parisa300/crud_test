import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_example/core/customer_params.dart';
import 'package:phone_number_example/core/utils/show_snackbar.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';
import 'package:phone_number_example/features/feature_customer/presentation/bloc/customer_bloc.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/card_number_filed.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/custom_button.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/date_picker_button.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/email_field.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/region_picker.dart';
import 'package:phone_number_example/features/feature_customer/presentation/widgets/username_field.dart';

import '../../../../main.dart';
import '../../../../models/region.dart';
import '../../../../store.dart';
import '../../data/data_source/local/customer_dao.dart';
import '../bloc/get_all_customer_status.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen(this.store, {super.key});

  final Store store;

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  String firstName = "";
  String lastName = "";
  CustomerDao? customerDao;
  CustomerParams? params;
  Region? region;
  final numberCtrl = TextEditingController();
  final regionCtrl = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  bool _isValid = false;
  final TextEditingController birthdateController =
      TextEditingController(text: ' ');
  final TextEditingController cardController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  // late double width;
  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  @override
  void initState() {
    BlocProvider.of<CustomerBloc>(context).add(GetAllCustomerEvent());
    // width = MediaQuery.of(context).size.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CustomerBloc, CustomerState>(
      buildWhen: (previous, current) {
        /// rebuild UI just when allCustomerStatus Changed
        if (current.getAllCustomerStatus == previous.getAllCustomerStatus) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        /// show Loading for AllCustomerStatus
        if (state.getAllCustomerStatus is GetAllCustomerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /// show Completed for AllCustomerStatus
        if (state.getAllCustomerStatus is GetAllCustomerCompleted) {
          /// casting for getting customers
          GetAllCustomerCompleted getAllCustomerCompleted =
              state.getAllCustomerStatus as GetAllCustomerCompleted;
          List<CustomerEntity> customers = getAllCustomerCompleted.customer;

          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  _asyncInputDialog();
                },
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    /// show text in center if there is no customer
                    child: (customers.isEmpty)
                        ? const Center(
                            child: Text(
                              'there is no customer',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        : ListView.builder(
                            itemCount: customers.length,
                            itemBuilder: (context, index) {
                              CustomerEntity? customer = customers[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRect(
                                    child: Container(
                                      width: 100,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey.withOpacity(0.1)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              customer.firstName,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              customer.lastName,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                  ),
                ],
              ),
            ),
          );
        }

        /// show Error for AllCustomerStatus
        if (state.getAllCustomerStatus is GetAllCustomerError) {
          /// casting for getting Error
          GetAllCustomerError getAllCityError =
              state.getAllCustomerStatus as GetAllCustomerError;

          return Center(
            child: Text(getAllCityError.message!),
          );
        }

        /// show Default value
        return Container();
      },
    );
  }

  Future<Future<String?>> _asyncInputDialog() async {
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext c) {
        return SizedBox(
          // width: MediaQuery.of(context).size.width / 1,
          height: double.infinity,
          child: SingleChildScrollView(
            child: AlertDialog(
              title: const Text('Register Customer'),
              content: Form(
                key: _key,
                child: Form(
                  key: _form,
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildName(),
                        const SizedBox(height: 8),
                        _buildLastName(),
                        const SizedBox(height: 8),
                        _birthday(),
                        const SizedBox(height: 8),
                        _cardNumber(),
                        _phone(),
                        ElevatedButton(
                          onPressed: validate,
                          child: const Text('Validate'),
                        ),
                        _regin(),
                        const SizedBox(height: 8),
                        _email()
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                //   CustomerButtonClick( params: params!)

                CustomButton(
                  onPressed: () async {
                    _saveForm();
                    //  _snackKey.currentState.removeCurrentSnackBar();
                    if (firstName.isNotEmpty &&
                        lastName
                            .isNotEmpty /*& phoneNumber.isNotEmpty && cardNumber.isNotEmpty && date.isNotEmpty*/) {
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String date = birthdateController.text;
                      String phoneNumber = phoneNumberController.text;
                      String email = emailController.text;
                      String cardNumber = cardController.text;
                      //  _asyncInputDialog(context);
                      // var patient = CustomerEntity(
                      //     firstName: firstName,
                      //     lastName: lastName,
                      //     dateOfBirth: date,
                      //     phoneNumber: phoneNumber,
                      //     email: email,
                      //     bankAccountNumber: cardNumber);
                      // await customerDao!.insertCustomer(patient);

                      CustomerParams params = CustomerParams(
                        firstName,
                        lastName,
                        date,
                        phoneNumber,
                        email,
                        cardNumber,
                      );
                      BlocProvider.of<CustomerBloc>(context)
                          .add(SaveCwEvent(params));

                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter all filed'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  title: 'Add',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildName() {
    return UsernameField(
      hint: 'pleaseEnterFirstName',
      controller: firstNameController,
      textInputAction: TextInputAction.done,
      onChanged: (String value) {
        firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return UsernameField(
      hint: 'pleaseEnterLastName',
      controller: lastNameController,
      textInputAction: TextInputAction.done,
      onChanged: (String value) {
        lastName = value;
      },
    );
  }

  Widget _birthday() {
    return DatePickerButton(
      controller: birthdateController,
      title: 'toDateOfBirth',
      firstDate: DateTime(1920),
      onDateSelected: (DateTime dateSelected) {},
      onClearDate: () {},
    );
  }

  Widget _email() {
    return EmailField(controller: emailController);
  }

  Widget _cardNumber() {
    return CardNumberFiled(
      controller: cardController,
    );
  }

  Widget _phone() {
    return TextFormField(
      controller: numberCtrl,
      autocorrect: false,
      enableSuggestions: false,
      autofocus: true,
      keyboardType: TextInputType.phone,
      validator: (v) => v?.isEmpty == true ? 'Required' : null,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        helperText: '',
      ),
    );
  }

  Widget _regin() {
    return InkWell(
      onTap: chooseRegions,
      child: IgnorePointer(
        child: TextFormField(
          controller: regionCtrl,
          decoration: const InputDecoration(
            labelText: 'Region',
            helperText: '',
          ),
        ),
      ),
    );
  }

  Future<void> validate() async {
    if (_key.currentState!.validate()) {
      dismissKeyboard(context);

      final isValid = await widget.store.validate(
        numberCtrl.text,
        region: region,
      );
      log('isValid : $isValid');

      if (!mounted) return;
      ShowSnackBar.showSnackBar(
        context,
        "Validation Status: ${isValid ? 'Valid' : 'Invalid'}",
        prefix: Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          size: 20,
          color: isValid ? Colors.green : Colors.red,
        ),
        color: Colors.white,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> chooseRegions() async {
    dismissKeyboard(context);

    final regions = await widget.store.getRegions();

    final route = MaterialPageRoute<Region>(
      fullscreenDialog: true,
      builder: (_) => RegionPicker(regions: regions),
    );

    if (!mounted) return;
    final selectedRegion = await Navigator.of(context).push<Region>(route);

    if (selectedRegion != null) {
      log('Region selected: $selectedRegion');
      regionCtrl.text = "${selectedRegion.name} (+${selectedRegion.prefix})";
      setState(() => region = selectedRegion);
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }
}
