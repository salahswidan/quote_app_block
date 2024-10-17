import 'package:quote_app_block/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:quote_app_block/data/api/api_service.dart';
import 'package:quote_app_block/data/model/RandomQuotes.dart';
import 'event.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(Loading()) {
    on<FetchQuote>((event, emit) => _emitQuoteResponse());
  }

  _emitQuoteResponse() async {
    try {
      RandomQuote quote = await ApiService.api.fetchRandomQuote();
      emit(Success(quote));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
// class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
//   QuoteBloc() : super(Loading()) {
//     on<FetchQuote>(_onFetchQuote);
//   }

//   Stream<QuoteState> _onFetchQuote(
//       FetchQuote event, Emitter<QuoteState> emit) async* {
//     try {
//       RandomQuote quote = await ApiService.api.fetchRandomQuote();
//       yield Success(quote);
//     } catch (e) {
//       yield Error(e.toString());
//     }
//   }
// }
