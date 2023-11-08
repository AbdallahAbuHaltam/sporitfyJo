// ignore_for_file: public_member_api_docs, sort_constructors_first
class MainPlaygroundModel {
  String playgroundName;

  String ownerUID;

  MainPlaygroundModel({
    required this.playgroundName,
    required this.ownerUID,
  });

  Map<String, dynamic> toJosn() {
    return {
      'playgroundName': playgroundName,
      'ownerUID': ownerUID,
    };
  }

  factory MainPlaygroundModel.fromJson(Map<String, dynamic> json) {
    return MainPlaygroundModel(
      playgroundName: json['playgroundName'],
      ownerUID: json['ownerUID'],
    );
  }
}
