class OwnerInfo {
  final String ownerEmail;
  final String ownerPassword;
  final String playgroundName;
  final String ownerUUId;
  final String ownerPhone;
  OwnerInfo({
    required this.ownerEmail,
    required this.ownerPassword,
    required this.playgroundName,
    required this.ownerUUId,
    required this.ownerPhone,
  });

  Map<String, dynamic> toJosn() {
    return {
      'ownerEmail': ownerEmail,
      'ownerPassword': ownerPassword,
      'ownerUUId': ownerUUId,
      'ownerName': playgroundName,
      'ownerPhone': ownerPhone,
    };
  }

  factory OwnerInfo.fromJson(Map<String, dynamic> json) {
    return OwnerInfo(
      ownerEmail: json['ownerEmail'],
      ownerPassword: json['ownerPassword'],
      ownerUUId: json['ownerUUId'],
      playgroundName: json['ownerName'],
      ownerPhone: json['ownerPhone'],
    );
  }
}
