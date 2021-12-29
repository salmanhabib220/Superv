// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:superv/models/monthModel.dart';
import 'package:superv/models/todayModel.dart';
import 'package:superv/models/weekModel.dart';
import 'package:superv/models/yesterdayModel.dart';

class Navigatebottom extends StatefulWidget {
  const Navigatebottom({Key key}) : super(key: key);

  @override
  _NavigatebottomState createState() => _NavigatebottomState();
}

class _NavigatebottomState extends State<Navigatebottom> {
  int index = 0;
  final screens = [
    ApiToday(),
    ApiYesterday(),
    ApiWeek(),
    ApiMonth(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      //  backgroundColor: Colors.blue,
        iconSize: 20,

        currentIndex: index,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: "Today",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Yesterday",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_week),
            label: "Last Week",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_rounded),
            label: "Month",
          ),
        ],
        onTap: (cindex) {
          setState(() {
            index = cindex;
          });
        },
      ),
    );
  }
}
