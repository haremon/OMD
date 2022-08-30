class QuizBrain {
  int _testnumber = 0;
  List<String> _tests = [
    'OMD has always been my go-to place for my dog!',
    'There is nothing better than finding all you require at a single place',
    'Be it food, or services, I always find the best solution at OMD!'
  ];

  void nexttest() {
    if (_testnumber < _tests.length - 1) {
      _testnumber++;
    }
  }

  void reset() {
    _testnumber = 0;
  }

  String gettest() {
    return _tests[_testnumber];
  }

  int getnumber() {
    return _testnumber;
  }

  bool exceed() {
    if (_testnumber >= _tests.length - 1)
      return true;
    else
      return false;
  }
}
