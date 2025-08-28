class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Quote &&
        other.text == text &&
        other.author == author;
  }

  @override
  int get hashCode => text.hashCode ^ author.hashCode;
}
