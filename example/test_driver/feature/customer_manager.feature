Feature: Create Read Edit Delete Customer
    Background:
        Given system error codes are following
            | Code | Description                                                |
            | 101  | Invalid Mobile Number                                      |
            | 102  | Invalid Email address                                      |
            | 103  | Invalid Bank Account Number                                |
            | 201  | Duplicate customer by First-name, Last-name, Date-of-Birth |
            | 202  | Duplicate customer by Email address                        |

    @ignore
    Scenario Outline: Create Read Edit Delete Customer
        Given platform has "0" customers
        When user creates a customer with following data by sending 'Create Customer Command'
            | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
            | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
        Then user can lookup all customers and filter by below properties and get "1" records
            | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
            | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
        When user creates a customer with following data by sending 'Create Customer Command'
            | FirstName | LastName | Email         | PhoneNumber   | DateOfBirth | BankAccountNumber |
            | John      | Doe      | other@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
        Then user must receive error code of "201"
        When user creates a customer with following data by sending 'Create Customer Command'
            | FirstName | LastName | Email        | PhoneNumber | DateOfBirth | BankAccountNumber |
            | Jane      | William  | john@doe.com | +3161234567 | 01-FEB-2010 | IR000000000000002 |
        Then user must receive error code of "202"
        When user edit customer with new data
            | FirstName | LastName | Email            | PhoneNumber | DateOfBirth | BankAccountNumber |
            | Jane      | William  | jane@william.com | +3161234567 | 01-FEB-2010 | IR000000000000002 |
        Then user can lookup all customers and filter by below properties and get "0" records
            | FirstName | LastName | Email        | PhoneNumber   | DateOfBirth | BankAccountNumber |
            | John      | Doe      | john@doe.com | +989121234567 | 01-JAN-2000 | IR000000000000001 |
        And user can lookup all customers and filter by below properties and get "1" records
            | FirstName | LastName | Email            | PhoneNumber | DateOfBirth | BankAccountNumber |
            | Jane      | William  | jane@william.com | +3161234567 | 01-FEB-2010 | IR000000000000002 |

        When user delete customer by Email of "jane@william.com"
        Then user can get all records and get "0" records
        Examples:
            |

        @ignore
        Scenario Outline:InvalidMobileNumber,EmailAddress,BankAccountNumber
            Examples: I Add Customer
            Given User most receive error code 101=>invalidMobileNumber
            And User most receive error code 102=>invalidEmail
            And User most receive error code 103=>invalidBankNumber

            When  User most receive error code 101
                | FirstName   | LastName       | Email                      | PhoneNumber   | DateOfBirth | BankAccountNumber |
                | Parisa      | Mahmood i      | parisamahmoodi70@gmail.com | +9821184625723 | 02-OCT-1991 | IR000000000000001 |
            Then I expect error code 101

            When  User most receive error code 102
                | FirstName   | LastName       | Email                      | PhoneNumber   | DateOfBirth | BankAccountNumber |
                | Parisa      | Mahmood i      | parisamahmoodi70@gml       | +989156126501 | 02-OCT-1991 | IR000000000000001 |

            Then I expect error code 102

            When User most receive error code 103
                 | FirstName   | LastName       | Email                           | PhoneNumber    | DateOfBirth | BankAccountNumber |
                 | Parisa      | Mahmood i      | parisamahmoodi70@gmil.com       | +989156126501  | 02-OCT-1991 | I00000000001      |
            Then  I expect error code 103



       @ignore
            Scenario Outline: DuplicateCustomer
                Given platform has no customer
                And Duplicate Customer
                When userCreateCustomer
                    | FirstName   | LastName       | Email                      | PhoneNumber   | DateOfBirth | BankAccountNumber |
                    | Parisa      | Mahmood i      | parisamahmoodi70@gmail.com | +989156126501 | 02-OCT-1991 | IR000000000000001 |
                When User most receive error code 201 :  Duplicate customer by First-name, Last-name, Date-of-Birth
                    | FirstName   | LastName       | Email                      | PhoneNumber   | DateOfBirth | BankAccountNumber |
                    | Parisa      | Mahmood i      | p_mahmoodi19@yahoo.com     | +989385746489 | 02-OCT-1991 | IR000013254000001 |
                Then  I tap Button{Add} click I expect error code 201 for duplicate


                When  User most receive error code 202 : Duplicate customer by Email address
                    | FirstName   | LastName       | Email                      | PhoneNumber   | DateOfBirth | BankAccountNumber |
                    | Neda        | Ahmadi         | parisamahmoodi70@gmail.com | +989159822973 | 09-JUN-1989 | IR000000002887001 |
                Then  I tap Button{Add}click I expect error code 202 for duplicate email
           Examples:
               |  |

