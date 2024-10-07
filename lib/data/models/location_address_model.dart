class LocationAddress {
  int? id;
  String? fullAddress;
  String? shortAddress;

  LocationAddress({
    this.id,
    this.fullAddress,
    this.shortAddress,
  });

  LocationAddress.fromJson(dynamic json) {
    id = json['id'];
    fullAddress = json['fullAddress'];
    shortAddress = json['shortAddress'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullAddress'] = fullAddress;
    map['shortAddress'] = shortAddress;
    return map;
  }
}
