import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/model/CheckinRResp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../http.dart';

class CheckinRecord extends StatefulWidget {
  final String id;

  const CheckinRecord({Key key, this.id}) : super(key: key);

  @override
  _CheckinRecordState createState() => _CheckinRecordState();
}
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

class _CheckinRecordState extends State<CheckinRecord>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events = {};
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  String monthday;
  int allNum=0;
  int absentNum=0;
  static const RecordType=["",'扫码签到','签到码签到','人脸签到'];
  static const RecordTypeIcon=["",Icons.qr_code,CupertinoIcons.number_circle_fill,Icons.face];
  var formatter=DateFormat("ahh:mm","zh_CN");
  getRecords() async {
    var resp = await Global.dio.get("/course/${widget.id}/signr");
    var info = CheckinRResp.fromJson(json.decode(resp.data.toString()));
    if (info.code != 0) {
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    var data = info.all;
    _events = {};
    absentNum=0;
    allNum=data.length;
    data.forEach((element) {
      var datetime =
          DateTime.fromMillisecondsSinceEpoch(element.datetime * 1000);
      print(datetime);
      var isSign=element.list.contains(Global.profile.iD);
      if(!isSign){
        absentNum++;
      }


      if (_events[element.datetime * 1000] == null) {
        _events[datetime] = [
          CheckinEvent(element.owner.name, datetime, element.type,
              isSign)
        ];
      } else {
        _events[datetime].add(CheckinEvent(element.owner.name, datetime,
            element.type,isSign ));
      }
    });
    final _selectedDay = DateTime.now();

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    // print(_events);
print(((1-(absentNum/allNum))*100).toStringAsFixed(2));
    _animationController.forward();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();

    final _selectedDay = DateTime.now();
    monthday =
        _selectedDay.month.toString() + "月" + _selectedDay.day.toString() + "日";
    print(_selectedDay.millisecondsSinceEpoch);
    getRecords();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      monthday = day.month.toString() + "月" + day.day.toString() + "日";
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                            margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
                            height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("缺勤次数",
                                          style: TextStyle(
                                            color: Colors.black45.withOpacity(0.8), fontSize: 12,
                                            //  fontWeight: FontWeight.bold
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text.rich(TextSpan(
                                          text: "${absentNum}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 24, fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: "次",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ))
                                          ]))
                                    ],
                                  ),
                                  flex: 1,
                                ),
                                VerticalDivider(
                                  color: Colors.black54,
                                 // width: 2,
                                  // width: 2,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("出勤率",
                                          style: TextStyle(
                                            color: Colors.black45.withOpacity(0.8),
                                            fontSize: 12,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text.rich(TextSpan(
                                          text: "${((1-(absentNum/allNum))*100).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 24, fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: "%",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ))
                                          ]))
                                    ],
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                               color: Colors.white,
                                borderRadius: BorderRadius.circular(22)
                              //   image:  new DecorationImage(
                              //   image: new ExactAssetImage('assets/images/s2.png'),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                    Container(

                      padding: EdgeInsets.only(top: 20),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                        child: _buildTableCalendarWithBuilders(),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                      ),
                    ),
                    // Switch out 2 lines below to play with TableCalendar's settings
                    //-----------------------
                    // _buildTableCalendar(),

                    // const SizedBox(height: 8.0),
                    // _buildButtons(),
                    SizedBox(height: 1),
                    Container(
                      color: Colors.white,
                      child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                              child:
                              Text("签到记录"+" "+monthday,style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black26,
                              )))]),),
                    //  const SizedBox(height: 8.0),
                    Expanded(child: Container(
                        color:Color(0xfff8faf9),
                        child:_buildEventList())),
                  ],
                ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/b2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )

        ));
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      rowHeight: 60,
      locale: 'zh-CN',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        dayBuilder: (context, date, events) {
          var color=Colors.white;
          if(events!=null){
            var eventsList=events.cast<CheckinEvent>();
            bool flag=true;
            eventsList.forEach((element) {
              if(!element.isSign) flag=false;
            });
            color=flag?MyColors.ColoroliveLight:MyColors.ColororangeLight;

          }
          return Container(
            margin: const EdgeInsets.all(0.5),
            padding: const EdgeInsets.only(top: 5.0),
            color: color,
            width: 100,
            height: 100,
            alignment: Alignment.topCenter,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(0.5),
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              color: Color(0xffFFF7EA),
              width: 100,
              height: 100,
              alignment: Alignment.topCenter,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(0.5),
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            color: Color(0xffFFF7EA),
            width: 100,
            height: 100,
            alignment: Alignment.topCenter,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            bool flag=true;
            events.forEach((element) {
              if(!element.isSign) flag=false;
            });
            if(flag)
              children.add(Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                  )));
            // if (events.length > 1) {
            //   children.add(
            //     Positioned(
            //       right: 1,
            //       bottom: 1,
            //       child: _buildEventsMarker(date, events),
            //     ),
            //   );
            // }
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: event.isSign?Colors.greenAccent:Colors.orangeAccent,
                            size: 12.0,
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.isSign?"已签到":"未签到",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 5.0),

                              Text(
                                formatter.format(event.time),
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.black45),
                              )
                            ],
                          ),
                          //  SizedBox(width: 20.0),
                          Spacer(),
                          buildtag(RecordType[event.type], Color(0xff43aedc), RecordTypeIcon[event.type])
                        ],
                      )),
                  onTap: () => print('$event tapped!'),
                ),
                // ListTile(
                //   title: Text(event.toString()),
                //   onTap: () => print('$event tapped!'),
                // ),
              ))
          .toList(),
    );
  }

  Widget buildtag(String text, Color color, IconData icon) {
    return Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        decoration: BoxDecoration(
          color: Color.fromARGB(99, color.red, color.green, color.blue),
          border: Border.all(
              color: Color.fromARGB(99, color.red, color.green, color.blue),
              width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Icon(
            icon,
            color: color,
            size: 9,
          ),
          SizedBox(
            width: 0.8,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 8, color: color, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
