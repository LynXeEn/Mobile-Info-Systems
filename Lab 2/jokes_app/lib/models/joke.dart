class JokeModel {
  String? type;
  String? setup;
  String? punchline;
  int? id;


  JokeModel({this.type, this.setup, this.punchline, this.id});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'setup': setup,
      'punchline': punchline,
      'id': id,
    };
  }
}
