// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Expense Manager';

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get aboutMe => 'About me';

  @override
  String get language => 'Language';

  @override
  String get vietnamese => 'VN';

  @override
  String get english => 'EN';

  @override
  String totalExpense(Object amount) {
    return 'Total expense: $amount đ';
  }

  @override
  String get category => 'Category';

  @override
  String get amount => 'Amount';

  @override
  String get date => 'Date';

  @override
  String get confirmDelete => 'Confirm delete';

  @override
  String get confirmDeleteMessage => 'Are you sure you want to delete this record?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get addExpense => 'Add expense';

  @override
  String get expenseName => 'Expense name';

  @override
  String get expenseAmount => 'Amount';

  @override
  String get noteOptional => 'Note (optional)';

  @override
  String get save => 'Save';

  @override
  String get group12 => 'Group 12';

  @override
  String get name => 'Nguyen Van Hieu';

  @override
  String get studentId => 'ID: 21012058';

  @override
  String get appSettings => 'App Settings';

  @override
  String get customizeExperience => 'Customize your experience';

  @override
  String totalExpensesCount(Object count) {
    return 'Total expenses: $count';
  }

  @override
  String get personalExpenseManager => 'Personal expense management application';

  @override
  String get addNewExpense => 'Add new expense';

  @override
  String get fillExpenseInfo => 'Fill in your expense information';

  @override
  String get expenseExample => 'Example: Food, Transportation...';

  @override
  String get enterAmountVND => 'Enter amount (VND)';

  @override
  String get addNoteIfNeeded => 'Add note if needed...';
}
