class JokeTypeModel {
  final String type;

  const JokeTypeModel({required this.type});

  static JokeTypeModel fromJson(String jsonData) {
    return JokeTypeModel(type: jsonData);
  }
}
