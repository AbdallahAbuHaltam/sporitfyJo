class SubPlaygroundModel {
  String playgroundNumber;
  String playgroundType;
  String playgroundPrice;
  String playgroundSize;
  String playgroundImage;
  List<String>? playersNames;
  bool playgroundAvailability;
  String playgroundUID;
  SubPlaygroundModel(
      {required this.playgroundNumber,
      required this.playgroundType,
      required this.playgroundPrice,
      required this.playgroundSize,
      required this.playgroundImage,
      required this.playgroundAvailability,
      this.playersNames,
      required this.playgroundUID});

  Map<String, dynamic> toJosn() {
    return {
      'playgroundNumber': playgroundNumber,
      'playgroundType': playgroundType,
      'playgroundPrice': playgroundPrice,
      'playgroundSize': playgroundSize,
      'playgroundImage': playgroundImage,
      'playgroundAvailability': playgroundAvailability,
      'playersNames': playersNames,
      'playgroundUID': playgroundUID,
    };
  }

  factory SubPlaygroundModel.fromJson(Map<String, dynamic> json) {
    return SubPlaygroundModel(
        playgroundNumber: json['playgroundNumber'],
        playgroundType: json['playgroundType'],
        playgroundPrice: json['playgroundPrice'],
        playgroundSize: json['playgroundSize'],
        playgroundImage: json['playgroundImage'],
        playgroundAvailability: json['playgroundAvailability'],
        playersNames: json['playersNames'],
        playgroundUID: json['playgroundUID']);
  }
}
