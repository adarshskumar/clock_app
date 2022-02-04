import 'package:clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('  EEE,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      alignment: Alignment.center,
      color: Color(0xFF2D2F41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formattedTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 64,
                    )),
                Text(formattedDate,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ],
            ),
          ),
          Flexible(
              flex: 5,
              child: Align(alignment: Alignment.center, child: ClockView())),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Timezone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    )),
                SizedBox(height: 16),
                Row(children: [
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  Text('  UTC ' + offsetSign + timezoneString,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
