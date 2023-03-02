// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database_customer.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBaseCustomer {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseCustomerBuilder databaseBuilder(String name) =>
      _$AppDataBaseCustomerBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseCustomerBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseCustomerBuilder(null);
}

class _$AppDataBaseCustomerBuilder {
  _$AppDataBaseCustomerBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseCustomerBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseCustomerBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBaseCustomer> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBaseCustomer();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBaseCustomer extends AppDataBaseCustomer {
  _$AppDataBaseCustomer([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerDao? _customerDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CustomerEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `dateOfBirth` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `email` TEXT NOT NULL, `bankAccountNumber` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _customerEntityInsertionAdapter = InsertionAdapter(
            database,
            'CustomerEntity',
            (CustomerEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'dateOfBirth': item.dateOfBirth,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'bankAccountNumber': item.bankAccountNumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CustomerEntity> _customerEntityInsertionAdapter;

  @override
  Future<List<CustomerEntity>> getAllCustomers() async {
    return _queryAdapter.queryList('SELECT * FROM CustomerEntity',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            bankAccountNumber: row['bankAccountNumber'] as String));
  }

  @override
  Future<CustomerEntity?> findCustomerByFirstName(String firstName) async {
    return _queryAdapter.query('SELECT * FROM CustomerEntity WHERE firstName = ?1',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            bankAccountNumber: row['bankAccountNumber'] as String),
        arguments: [firstName]);
  }

  @override
  Future<CustomerEntity?> findCustomerByLastName(String lastName) async {
    return _queryAdapter.query('SELECT * FROM CustomerEntity WHERE lastName = ?1',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            bankAccountNumber: row['bankAccountNumber'] as String),
        arguments: [lastName]);
  }

  @override
  Future<CustomerEntity?> findCustomerByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM CustomerEntity WHERE email = ?1',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            bankAccountNumber: row['bankAccountNumber'] as String),
        arguments: [email]);
  }

  @override
  Future<void> insertCustomer(CustomerEntity customer) async {
    await _customerEntityInsertionAdapter.insert(
        customer, OnConflictStrategy.abort);
  }
}
