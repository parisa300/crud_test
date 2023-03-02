

import 'dart:async';


import 'package:floor/floor.dart';
import 'package:phone_number_example/features/feature_customer/data/data_source/local/customer_dao.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part "app_database_customer.g.dart";


 @Database(version: 1, entities: [CustomerEntity])
abstract class AppDataBaseCustomer extends FloorDatabase{
  CustomerDao get customerDao;
}