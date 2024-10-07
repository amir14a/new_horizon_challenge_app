import 'package:intl/intl.dart' as intl;
import 'package:shamsi_date/shamsi_date.dart';

class LoanBox {
  int? id;
  String? title;
  String? secondTitle;
  int? totalAmount;
  String? position;
  int? membersCount;
  int? progressPercent;
  String? billingDate;

  LoanBox({
    this.id,
    this.title,
    this.secondTitle,
    this.totalAmount,
    this.position,
    this.membersCount,
    this.progressPercent,
    this.billingDate,
  });

  LoanBox.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    secondTitle = json['secondTitle'];
    totalAmount = json['totalAmount'];
    position = json['position'];
    membersCount = json['membersCount'];
    progressPercent = json['progressPercent'];
    billingDate = json['billingDate'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['secondTitle'] = secondTitle;
    map['totalAmount'] = totalAmount;
    map['position'] = position;
    map['membersCount'] = membersCount;
    map['progressPercent'] = progressPercent;
    map['billingDate'] = billingDate;
    return map;
  }
}

extension LoanBoxModelX on LoanBox {
  String get persianBillingDate {
    try {
      var dateTime = intl.DateFormat("yyyy-MM-dd' 'HH:mm:ss").parse(billingDate ?? '');
      final f = Jalali.fromDateTime(dateTime).formatter;
      return "${f.d} ${f.mN} ${f.yyyy}";
    } catch (e) {
      return 'خطا در تبدیل تاریخ';
    }
  }

  String get formattedTotalAmount {
    return '${intl.NumberFormat.decimalPattern().format(totalAmount)} تومان';
  }
}
