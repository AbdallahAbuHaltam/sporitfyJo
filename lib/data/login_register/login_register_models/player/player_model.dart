// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayerInfo {
  final String playerEmail;
  final String playerPassword;
  final String playerUUId;
  final String playerName;
  final String playerGender;
  final String playerPhone;
  final String playerAge;
  PlayerInfo({
    required this.playerEmail,
    required this.playerPassword,
    required this.playerUUId,
    required this.playerName,
    required this.playerGender,
    required this.playerPhone,
    required this.playerAge,
  });


  Map<String, dynamic> toJosn() {
    return {
      'playerEmail': playerEmail,
      'playerPassword': playerPassword,
      'playerUUId': playerUUId,
      'playerName': playerName,
      'playerGender':playerGender,
      'playerPhone': playerPhone,
      'playerAge':playerAge,
    };
  }

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      playerEmail: json['playerEmail'],
      playerPassword: json['playerPassword'],
      playerUUId: json['playerUUId'],
      playerName: json['playerName'],
      playerGender:json['playerGender'],
      playerPhone: json['playerPhone'],
      playerAge:json['playerAge'],
    );
  }
}
