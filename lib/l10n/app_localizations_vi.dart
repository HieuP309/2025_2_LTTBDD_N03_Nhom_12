// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi'])
    : super(locale);

  @override
  String get appTitle => 'Quản lý chi tiêu';

  @override
  String get settings => 'Cài đặt';

  @override
  String get home => 'Trang chủ';

  @override
  String get aboutMe => 'Về tôi';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get vietnamese => 'VN';

  @override
  String get english => 'EN';

  @override
  String totalExpense(Object amount) {
    return 'Tổng chi: $amount đ';
  }

  @override
  String get category => 'Danh mục';

  @override
  String get amount => 'Số tiền';

  @override
  String get date => 'Ngày';

  @override
  String get confirmDelete => 'Xác nhận xóa';

  @override
  String get confirmDeleteMessage =>
      'Bạn có chắc muốn xóa bản ghi này?';

  @override
  String get cancel => 'Hủy';

  @override
  String get delete => 'Xóa';

  @override
  String get addExpense => 'Thêm chi tiêu';

  @override
  String get expenseName => 'Tên khoản chi';

  @override
  String get expenseAmount => 'Số tiền';

  @override
  String get noteOptional => 'Ghi chú (tùy chọn)';

  @override
  String get save => 'Lưu';

  @override
  String get group12 => 'Nhóm 12';

  @override
  String get name => 'Nguyễn Văn Hiếu';

  @override
  String get studentId => 'MSSV: 21012058';
}
