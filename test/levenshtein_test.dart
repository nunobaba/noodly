library levenshtein_test;

import 'package:unittest/unittest.dart';
import '../levenshtein/levenshtein.dart';


void main() {
  
  test('Single word test', () {
    expect(proximity('supertramp', 'megatramp'), 5);
  });

  test('Short phrase test', () {  
    expect(proximity('ping is new', 'pong was new'), 3);
  });
  
  test('Phrase with punctuation', () {  
    expect(proximity('ping again?!', 'pong again!'), 2);
  });
}