import 'package:flutter/material.dart';
import 'package:phone_number_example/features/feature_customer/presentation/screens/customer_screen.dart';


import 'package:phone_number_example/phone_number_util.dart';
import 'package:phone_number_example/store.dart';



class Home extends StatelessWidget {
  final store = Store(PhoneNumberUtil());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('customer'),
          ),
          body:  CustomerScreen(store),
        ),

    );
  }
}
