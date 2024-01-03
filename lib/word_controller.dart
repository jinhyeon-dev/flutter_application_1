import 'package:english_words/english_words.dart';
import 'package:get/state_manager.dart';

class WordController extends GetxController {
  final RxString _wordState = ''.obs;
  final RxList _favoriteWordsState = [].obs;

  String get word => _wordState.value;
  set _word(String value) => _wordState(value);

  List get favorites => _favoriteWordsState;

  void changeWord() {
    _word = WordPair.random().toString();
  }

  void updateFavorite() {
    if (favorites.contains(word)) {
      _favoriteWordsState.remove(word);
    } else {
      _favoriteWordsState.add(word);
    }
  }
}
