

import 'package:intl/intl.dart';

extension EmailValidation on String {
  bool isValidEmail() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
extension DateExtention on DateTime{

  String setUtcFormat() {
    return DateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'000'Z'").format(this);
  }

  String yyyyMMdd() {
    // 2022-07-20
    return DateFormat("yyyy-MM-dd'").format(this);
  }

  String yyyyMMddHHmm() {
    return DateFormat("yyyy-MM-dd HH:mm").format(this);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}

extension DateExtensionFromString on String {
  String dMMMMHm(bool isLocal) {
    DateTime dt = DateTime.parse(this);

    if (isLocal) dt = dt.toLocal();

    return "${DateFormat.d().format(dt)} ${DateFormat.MMMM().format(dt)} ${DateFormat.Hm().format(dt)}";
  }

  String dMMMHHmm() {
    // 22 Sep 11:30
    DateTime dt = DateTime.parse(this).toLocal();
    return DateFormat("d MMM HH:mm").format(dt);
  }

  String yyyyMMdd() {
    // 2022-07-20
    return DateTime.parse(this).toLocal().yyyyMMdd();
  }

  String day() {
    DateTime dt = DateTime.parse(this);
    return DateFormat.d().format(dt);
  }

  String month() {
    DateTime dt = DateTime.parse(this);
    return DateFormat.MMM().format(dt);
  }

  String year() {
    DateTime dt = DateTime.parse(this);
    return DateFormat.y().format(dt);
  }

  String yyyyMMddHHmm() {
    //2022-10-20 10:31
    DateTime dt = DateTime.parse(this).toLocal();
    return dt.yyyyMMddHHmm();
  }

  String dddMMMdd() {
    // Thursday 22 Sep
    DateTime dt = DateTime.parse(this);
    return DateFormat("EEEE d MMM").format(dt);
  }

  String mMMdd() {
    // 22 Sep
    DateTime dt = DateTime.parse(this).toLocal();
    return DateFormat("d MMM").format(dt);
  }

  String hHmm() {
    // 12:06
    DateTime dt = DateTime.parse(this);
    return DateFormat("HH:mm").format(dt);
  }
}



