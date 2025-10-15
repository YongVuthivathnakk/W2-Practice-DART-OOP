class MyDuration {
  double _milliseconds;

  set milliseconds(double value) {
    if(value < 0) {
      throw ArgumentError("Duration shall always be greater or equal to 0");
    }
    _milliseconds = value;
  }

  MyDuration(double milliseconds) : _milliseconds = milliseconds;
  MyDuration.fromHours(double hours) : this._milliseconds = hours * 36e+6;
  MyDuration.fromMinutes(double minutes) : this._milliseconds = minutes * 60000;
  MyDuration.fromSeconds(double seconds) : this._milliseconds = seconds * 1000;

  MyDuration operator+(MyDuration other) {
    return MyDuration(_milliseconds + other._milliseconds);
  }

  bool operator>(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator-(MyDuration other) {
    if(_milliseconds < other._milliseconds) {
      throw Exception("Duration shall always be greater or equal to 0");
    }
    return MyDuration(_milliseconds - other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
