class RandomQuote {
  String content = '';
  String author = '';

  RandomQuote.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    author = json['author'];
  }
}
// RandomQuotes.dart