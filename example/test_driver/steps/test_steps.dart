import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:phone_number_example/features/feature_customer/domain/entities/customer_entity.dart';



/*Given platform has "0" customers
          When user creates a customer with following data by sending 'Create Customer Command'
              | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
              | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
          Then user can lookup all customers and filter by below properties and get "1" records
              | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
              | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |*/

StepDefinitionGeneric WhenIAddTheCustomers() {
  return when1(
    'I add the customer',
        (GherkinTable dataTable, context) async {
      for (var row in dataTable.rows) {
        // do something with row
        row.columns.forEach((columnValue) => print(columnValue));
      }
    },
  );
}

/*When user creates a customer with following data by sending 'Create Customer Command'
       | FirstName | LastName | Email         | PhoneNumber   | DateOfBirth | BankAccountNumber |
       | John      | Doe      | other@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |

     Then user must receive error code of "201"*/

class CheckGivenDuplicateCode201
    extends Given4WithWorld<String,String, String,String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3,String input4) async {
    final firstName = find.byValueKey(input1);
    final lastName = find.byValueKey(input2);
    final dateOfBirth = find.byValueKey(input3);
    final Add = find.byValueKey(input4);
    CustomerEntity? customerEntity;
    if( customerEntity!.firstName==firstName && customerEntity.lastName==lastName && customerEntity.dateOfBirth==dateOfBirth)

      await FlutterDriverUtils.isPresent(world.driver, Add);
    expect("user must receive error code 201", true);

  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string} and {string}");
}

class CheckGivenDuplicateCode202
    extends Given2WithWorld<String,String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final email = find.byValueKey(input1);
    final Add = find.byValueKey(input2);
    CustomerEntity? customerEntity;
    if( customerEntity!.email==email )
      await FlutterDriverUtils.isPresent(world.driver, Add);
    expect("user must receive error code 202", true);

  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I have {string} and {string} ");
}



class ClickAddButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String addBtn) async {
    // TODO: implement executeStep
    final addfinder = find.byValueKey(addBtn);
    await FlutterDriverUtils.tap(world.driver, addfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

