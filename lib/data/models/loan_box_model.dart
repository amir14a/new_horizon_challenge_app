class LoanBox {
  int? id;
  String? title;
  String? secondTitle;
  int? totalAmount;
  String? position;
  int? membersCount;
  String? billingDate;

  LoanBox({
    this.id,
    this.title,
    this.secondTitle,
    this.totalAmount,
    this.position,
    this.membersCount,
    this.billingDate,
  });

  LoanBox.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    secondTitle = json['secondTitle'];
    totalAmount = json['totalAmount'];
    position = json['position'];
    membersCount = json['membersCount'];
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
    map['billingDate'] = billingDate;
    return map;
  }
}
