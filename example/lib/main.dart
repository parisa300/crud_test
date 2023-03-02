import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_example/home.dart';
import 'features/feature_customer/presentation/bloc/customer_bloc.dart';

import 'locator.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  ///  init locator
  await setup();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<CustomerBloc>()),

        ],
        child:  Home()
    ),
  ));
}
void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
