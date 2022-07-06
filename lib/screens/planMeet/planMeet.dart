import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class PlanMeetScreen extends StatefulWidget {
  const PlanMeetScreen({Key key}) : super(key: key);

  @override
  State<PlanMeetScreen> createState() => _PlanMeetScreenState();
}

class _PlanMeetScreenState extends State<PlanMeetScreen> {
  final key = GlobalKey();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  final timeController = TextEditingController();
  final endTimeController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  String valueChoose;
  List listItem = ["one", "Two", "Three", "Four", "Five"];

  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#007bff'),
        title: Text('Plan Meet'),
        leading: Padding(
          padding: EdgeInsets.only(top: 19, left: 3),
          child: Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 18, right: 10),
            child: Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Subject',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Subject',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: startDateController,
                          readOnly: true,
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2025),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                startDateController.text =
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: timeController,
                          onTap: () async {
                            TimeOfDay initialTime = TimeOfDay.now();
                            TimeOfDay pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                            if (initialTime != null) {
                              setState(() {
                                _time = initialTime;
                                timeController.text = _time.format(context);
                              });
                            }

                            print(selectedTime);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Time',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'End',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: endDateController,
                          readOnly: true,
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2025),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                endDateController.text =
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: endTimeController,
                          onTap: () async {
                            TimeOfDay initialTime = TimeOfDay.now();
                            TimeOfDay pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                            if (initialTime != null) {
                              setState(() {
                                _time = initialTime;
                                endTimeController.text = _time.format(context);
                              });
                            }
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Time',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Related to',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(3)
                  ),
                  height: 55,
                  width: 375,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      hint: Text('Associate'),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20.0,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map<DropdownMenuItem<String>>((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Assigned To',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(3)
                  ),
                  height: 55,
                  width: 375,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      hint: Text('Associate'),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20.0,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map<DropdownMenuItem<String>>((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        //   _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }
}
