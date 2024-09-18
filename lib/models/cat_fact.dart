class CatFact {
  final String fact;
  final int length;

  const CatFact({
    required this.fact,
    required this.length,
  });


  factory CatFact.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'fact': String fact,
        'length': int length,
      } =>
        CatFact(
          fact: fact,
          length: length,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}