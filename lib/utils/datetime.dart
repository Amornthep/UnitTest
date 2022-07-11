extension DateTimeExt on DateTime {
  int secondsSinceEpoch() =>
      millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
}

class DateTimeUtil {
  static DateTime fromSecondsSinceEpoch(int secondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(
      secondsSinceEpoch * Duration.millisecondsPerSecond,
    );
  }
}
