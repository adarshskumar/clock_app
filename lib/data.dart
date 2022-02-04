import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/models/alarm_info.dart';
import 'package:clock_app/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, 'Clock', 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm, 'Alarm', 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer, 'Timer', 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch, 'Stopwatch', 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      DateTime.now().add(Duration(hours: 1)), 'vb', true, GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'vb', true,
      GradientColors.sunset),
];
