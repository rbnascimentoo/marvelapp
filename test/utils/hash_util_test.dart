import 'package:flutter_test/flutter_test.dart';
import 'package:marvelapp/utils/hash_util.dart';
import 'package:mockito/mockito.dart';

void main() {

  setUp(() {
  });

  test('when call generateTsRandom the result should have length 10', () {
    String result = HashUtil.generateTsRandom();

    expect(result.length, 10);
  });

}
