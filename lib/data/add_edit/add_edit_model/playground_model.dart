// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlaygroundInfo {
  String playgroundName;
  String playgroundType;

  String playgroundPrice;
  String playgroundSize;
  String playgroundImage;

  bool playgroundAvailability;
  PlaygroundInfo({
    required this.playgroundName,
    required this.playgroundType,
    required this.playgroundPrice,
    required this.playgroundSize,
    required this.playgroundImage,
    required this.playgroundAvailability,
  });

  Map<String, dynamic> toJosn() {
    return {
      'playgroundName': playgroundName,
      'playgroundType': playgroundType,
      'playgroundPrice': playgroundPrice,
      'playgroundSize': playgroundSize,
      'playgroundImage': playgroundImage,
      'playgroundAvailability': playgroundAvailability,
    };
  }

  factory PlaygroundInfo.fromJson(Map<String, dynamic> json) {
    return PlaygroundInfo(
      playgroundName: json['playgroundName'],
      playgroundType: json['playgroundType'],
      playgroundPrice: json['playgroundPrice'],
      playgroundSize: json['playgroundSize'],
      playgroundImage: json['playgroundImage'],
      playgroundAvailability: json['playgroundAvailability'],
    );
  }
}