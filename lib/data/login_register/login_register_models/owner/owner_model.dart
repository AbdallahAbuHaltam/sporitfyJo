class OwnerInfo {
  final String ownerEmail;
  final String ownerPassword;
  final String ownerName;
  final String ownerUUId;
  final String ownerPhone;
  OwnerInfo({
    required this.ownerEmail,
    required this.ownerPassword,
    required this.ownerName,
    required this.ownerUUId,
    required this.ownerPhone,
  });

   Map<String, dynamic> toJosn() {
    return {
      'ownerEmail': ownerEmail,
      'ownerPassword': ownerPassword,
      'ownerUUId': ownerUUId,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
    };
  }

  factory OwnerInfo.fromJson(Map<String, dynamic> json) {
    return OwnerInfo(
      ownerEmail: json['ownerEmail'],
      ownerPassword: json['ownerPassword'],
      ownerUUId: json['ownerUUId'],
      ownerName: json['ownerName'],
      ownerPhone: json['ownerPhone'],
    );
  }

}
