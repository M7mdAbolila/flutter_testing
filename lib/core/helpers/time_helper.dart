class TimeHelper {
  static String getTimeOfTheDay({DateTime? time}) {
    final now = time ?? DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) return 'Morning';
    if (hour >= 12 && hour < 17) return 'Afternoon';
    if (hour >= 17 && hour < 21) return 'Evening';
    return 'Night';
  }
}
