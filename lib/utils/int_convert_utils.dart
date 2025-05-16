import 'package:decimal/decimal.dart';
import 'package:flutter_se/utils/recent_date_format_utils.dart';
import 'package:intl/intl.dart';

class IntDateConvertUtils {
  ///补零
  static String zeroFill(int i) {
    return i >= 10 ? "$i" : "0$i";
  }

  ///秒转日期格式
  static String toHmsDate(int date, {String format = "yyyy-MM-dd HH:mm:ss"}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return DateFormat(format).format(dateTime);
  }

  ///秒转日期格式,MM-dd HH:mm
  static String toHmDate(int date, {String format = "MM-dd HH:mm"}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return DateFormat(format).format(dateTime);
  }

  /// 秒转时分秒
  static String second2HMS(int sec) {
    String hms = "00:00:00";
    if (sec > 0) {
      int h = sec ~/ 3600;
      int m = (sec % 3600) ~/ 60;
      int s = sec % 60;
      hms = "${h > 0 ? "${zeroFill(h)}:" : ""}${zeroFill(m)}:${zeroFill(s)}";
    }
    return hms;
  }

  ///数字转单位显示
  static String toUnitString(int num) {
    if (num > 100000000) {
      return '${Decimal.parse((num / 100000000).toStringAsFixed(2)).toStringAsFixed(2)}亿';
    } else if (num > 10000) {
      return '${Decimal.parse((num / 10000).toStringAsFixed(2)).toStringAsFixed(2)}万';
    } else {
      return Decimal.parse(num.toStringAsFixed(2)).toString();
    }
  }

  ///转时间 xx分钟这种形式
  static String toFormatTimeByRecent(int date) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return RelativeDateFormat.format(dateTime);
  }
}

extension IntConvertExt on int {
  ///转换成功时分秒
  String toHms() {
    return IntDateConvertUtils.second2HMS(this);
  }

  String toUnit() {
    if (this == 0) {
      return "0";
    }
    return IntDateConvertUtils.toUnitString(this);
  }

  String toFormatTimeByRecent() {
    return IntDateConvertUtils.toFormatTimeByRecent(this);
  }

  String toHmsDate({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return IntDateConvertUtils.toHmsDate(this, format: format);
  }
}
