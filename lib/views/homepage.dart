import 'package:clock_app/data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/views/alarm_page.dart';
import 'package:clock_app/views/clock_page.dart';
import 'package:clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          //  [
          //   buildMenuButton('Clock', 'assets/clock_icon.png'),
          //   buildMenuButton('Alarm', 'assets/alarm_icon.png'),
          //   buildMenuButton('Timer', 'assets/timer_icon.png'),
          //   buildMenuButton('Stopwatch', 'assets/stopwatch_icon.png')
          // ],

          VerticalDivider(color: Colors.white54, width: 1),
          Expanded(
            child: Consumer<MenuInfo>(builder: (context, value, child) {
              if (value.menuType == MenuType.clock)
                return ClockPage();
              else if (value.menuType == MenuType.alarm)
                return AlarmPage();
              else
                return Container(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorials\n'),
                          TextSpan(
                              text: value.title, style: TextStyle(fontSize: 48))
                        ]),
                  ),
                );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) => FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? Color(0xFF242634)
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context,
                listen: false); //fetching the instance of MenuInfo
            menuInfo.updateMenu(
                currentMenuInfo); //whenever we click this button we returning currentMenuInfo
          },
          child: Column(
            children: [
              Image.asset(currentMenuInfo.imageSource),
              SizedBox(height: 16),
              Text(currentMenuInfo.title,
                  style: TextStyle(color: Colors.white, fontSize: 14))
            ],
          )),
    );
  }
}
