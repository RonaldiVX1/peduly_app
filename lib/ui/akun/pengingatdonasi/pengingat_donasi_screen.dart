import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:peduly_app/ui/rencanapenggunaandana/widget/divider.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';

class PengingatDonasiScreen extends StatefulWidget {
  static const routeName = "/pengingatDonasiScreen";

  var isEmailReminder = false;
  var isPushNotification = false;

  @override
  _PengingatDonasiScreenState createState() => _PengingatDonasiScreenState();
}

class _PengingatDonasiScreenState extends State<PengingatDonasiScreen> {
  String dropdownValue = "Setiap";
  TimeOfDay _dateTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Pengingat Donasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildContent(),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _listTile(
          title: 'Frekuensi',
        ),
        Divider(
          thickness: 1,
          indent: 15,
          endIndent: 20,
        ),
        _datePicker(title: 'Tanggal'),
        Divider(
          thickness: 1,
          indent: 15,
          endIndent: 20,
        ),
        // ListTile(
        //   title: Text("Tanggal"),
        //   trailing: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       DropdownButton<String>(
        //         value: dropdownValue,
        //         icon: const Icon(
        //           Icons.keyboard_arrow_down,
        //           color: Colors.grey,
        //         ),
        //         iconSize: 24,
        //         elevation: 16,
        //         style: const TextStyle(color: Colors.grey),
        //         onChanged: (value) {
        //           setState(() {
        //             dropdownValue = value;
        //           });
        //         },
        //         items: <String>['Setiap', 'Bulan', 'Free', 'Four']
        //             .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: Text(
        //     emailReminderNote,
        //     style: TextStyle(fontSize: 13, color: Colors.orange[200]),
        //   ),
        // ),
        _timePicker(title: 'Waktu')

        // SwitchListTile(
        //   title: Text("Push Notification"),
        //   value: widget.isPushNotification,
        //   onChanged: (value) {
        //     setState(() {
        //       widget.isPushNotification = value;
        //     });
        //   },
        // )
      ],
    );
  }

  Widget _listTile({
    @required String title,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.grey),
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: <String>['Setiap', 'Bulan', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _datePicker({
    @required String title,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        TextButton(
          onPressed: () async {
            DateTime pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));
            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              setState(() {
                _selectedDate = pickedDate;
              }); //formatted date output using intl package =>  2021-03-16
            } else {
              print("Date is not selected");
            }
          },
          child: Text(
            _selectedDate.day.toString() ?? 'Pilih Waktu',
            style:
                pBlackTextStyle.copyWith(color: pBlackColor.withOpacity(0.5)),
          ),
        )
      ]),
    );
  }

  Widget _timePicker({
    @required String title,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        TextButton(
          onPressed: () async {
            TimeOfDay timeOfDay = await showTimePicker(
              context: context,
              initialTime: _dateTime,
              initialEntryMode: TimePickerEntryMode.dial,
            );
            if (timeOfDay != null && timeOfDay != _dateTime) {
              setState(() {
                _dateTime = timeOfDay;
              });
            }
          },
          child: Text(
            '${_dateTime.hour}:${_dateTime.minute}' ?? 'Pilih Waktu',
            style:
                pBlackTextStyle.copyWith(color: pBlackColor.withOpacity(0.5)),
          ),
        )
      ]),
    );
  }
}

var emailReminderNote =
    "*Kami akan mengingatkan melalui email setiap pukul 14.30 sesuai yang telah dijadwalkan";
