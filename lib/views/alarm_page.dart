import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/models/alarm_info.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Alarm',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              )),
          Expanded(
              child: ListView(
            children: alarms.map((e) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: 32,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: GradientColors.sky,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 4,
                      offset: Offset(4, 4),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text('Office',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                )),
                          ],
                        ),
                        Switch(value: true, onChanged: (bool value) {})
                      ],
                    ),
                    Text('Mon-Fri',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Row(
                      children: [
                        Text('07:00 AM',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                        Icon(Icons.keyboard_arrow_down,
                            size: 36, color: Colors.white)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
