import 'package:quote_app_block/data/model/RandomQuotes.dart';

abstract class QuoteState {}

class Loading extends QuoteState {}

class Success extends QuoteState {
  RandomQuote randomQuote;
  Success(this.randomQuote);
}

class Error extends QuoteState {
  String message = '';
  Error(this.message);
}
