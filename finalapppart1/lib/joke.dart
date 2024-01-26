class Joke {
  final String category;
  final String setup;
  final String delivery;
  final JokeDetails details;  // Ensure this property is correctly defined

  Joke({required this.category, required this.setup, required this.delivery, required this.details});

  factory Joke.fromJson(Map<String, dynamic> json) {
  return Joke(
    category: json['category'],
    setup: json['setup'],
    delivery: json['delivery'],
    details: JokeDetails.fromJson(json), // Parsing details from the same JSON object
  );
}

}

class JokeDetails {
  final int id;
  final Map<String, bool> flags;
  final bool safe;
  final String lang;

  JokeDetails({required this.id, required this.flags, required this.safe, required this.lang});

  factory JokeDetails.fromJson(Map<String, dynamic> json) {
  return JokeDetails(
    id: json['id'],
    flags: Map<String, bool>.from(json['flags']),
    safe: json['safe'] ?? false,
    lang: json['lang'],
  );
}

}

