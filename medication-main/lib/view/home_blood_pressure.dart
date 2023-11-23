import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medication/common/widget/show_modals.dart';
import 'package:medication/pages/Calendar.dart';
import 'package:medication/pages/Insights.dart';
import 'package:medication/pages/Settings.dart';

class BloodSugar extends StatefulWidget {
  BloodSugar({Key? key}) : super(key: key);

  @override
  _BloodSugarState createState() => _BloodSugarState();
}

class _BloodSugarState extends State<BloodSugar> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    if (index == 0 && _selectedIndex == index) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else if (index == 1 && _selectedIndex == index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserInsights()),
      );
    } else if (index == 2 && _selectedIndex == index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserCalendar()),
      );
    } else if (index == 3 && _selectedIndex == index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserSettings()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Blood Pressure'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Todays Task',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold, // Fix the property name here
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Wednesday, 11 May',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold, // Fix the property name here
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context,
                    builder: (context) => AddNewTaskModals(),
                  ),
                  child: Text(
                    '+ New Task',
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigationBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights_outlined), label: 'Insights'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
